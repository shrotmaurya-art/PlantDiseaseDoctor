import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:io';
import '../theme/colors.dart';
import '../services/plants_storage.dart';

class MyPlantsScreen extends StatefulWidget {
  const MyPlantsScreen({super.key});

  @override
  State<MyPlantsScreen> createState() => _MyPlantsScreenState();
}

class _MyPlantsScreenState extends State<MyPlantsScreen> {
  List<PlantEntry> _plants = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPlants();
  }

  Future<void> _loadPlants() async {
    final plants = await PlantsStorage.loadAll();
    if (mounted) {
      setState(() {
        _plants = plants.reversed.toList(); // newest first
        _isLoading = false;
      });
    }
  }

  Future<void> _deletePlant(String id) async {
    await PlantsStorage.delete(id);
    await _loadPlants();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Plant removed from garden')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softBeige,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.darkText),
          onPressed: () => context.go('/home'),
        ),
        title: Text(
          'My Garden',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        actions: [
          if (_plants.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Chip(
                label: Text(
                  '${_plants.length} plants',
                  style: const TextStyle(
                    color: AppColors.deepGreen,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                backgroundColor: AppColors.leafGreen.withValues(alpha: 0.12),
                side: BorderSide.none,
              ),
            ),
          IconButton(
            icon: const Icon(Icons.add, color: AppColors.deepGreen),
            onPressed: () => context.go('/scan'),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.leafGreen),
            )
          : _plants.isEmpty
          ? _buildEmptyState(context)
          : RefreshIndicator(
              onRefresh: _loadPlants,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _plants.length,
                itemBuilder: (context, index) {
                  return _buildPlantCard(context, _plants[index], index);
                },
              ),
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColors.leafGreen.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.eco_rounded,
              size: 64,
              color: AppColors.leafGreen.withValues(alpha: 0.5),
            ),
          ).animate().scale(duration: 600.ms, curve: Curves.elasticOut),
          const SizedBox(height: 24),
          Text(
            'Your Garden is Empty',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.darkText,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Scan a plant leaf to detect diseases\nand save results here.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            icon: const Icon(Icons.camera_alt_rounded),
            label: const Text('Scan First Plant'),
            onPressed: () => context.go('/scan'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.deepGreen,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlantCard(BuildContext context, PlantEntry plant, int index) {
    final isHealthy = plant.diseaseName.toLowerCase().contains('healthy');
    final severityColor = isHealthy
        ? AppColors.leafGreen
        : _getSeverityColor(plant.severity);

    return Dismissible(
      key: Key(plant.id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppColors.errorRed.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete_outline, color: AppColors.errorRed),
      ),
      onDismissed: (_) => _deletePlant(plant.id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              // Image header
              if (plant.imagePath.isNotEmpty &&
                  File(plant.imagePath).existsSync())
                SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.file(File(plant.imagePath), fit: BoxFit.cover),
                      // Gradient overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.5),
                            ],
                          ),
                        ),
                      ),
                      // Status badge
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: severityColor.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            isHealthy ? '✓ Healthy' : '⚠ ${plant.severity}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // Info section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            plant.diseaseName,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: isHealthy
                                      ? AppColors.deepGreen
                                      : AppColors.errorRed,
                                ),
                          ),
                        ),
                        Text(
                          '${(plant.confidence * 100).toStringAsFixed(0)}% match',
                          style: const TextStyle(
                            color: AppColors.midGreyText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      plant.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.midGreyText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 14,
                          color: AppColors.midGreyText,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatDate(plant.savedAt),
                          style: TextStyle(
                            color: AppColors.midGreyText,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        // Swipe hint
                        Text(
                          'Swipe to delete',
                          style: TextStyle(
                            color: AppColors.midGreyText.withValues(alpha: 0.5),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ).animate(delay: Duration(milliseconds: index * 80)).fade().slideY(begin: 0.2),
    );
  }

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'high':
        return AppColors.errorRed;
      case 'moderate':
        return const Color(0xFFFF9800);
      case 'low to moderate':
        return const Color(0xFFFFB74D);
      default:
        return AppColors.midGreyText;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inDays == 0) return 'Today';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    return '${date.day}/${date.month}/${date.year}';
  }
}
