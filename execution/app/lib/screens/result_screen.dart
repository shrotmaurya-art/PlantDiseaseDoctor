import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:io';
import '../theme/colors.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> resultData;

  const ResultScreen({super.key, required this.resultData});

  @override
  Widget build(BuildContext context) {
    final imagePath = resultData['local_image_path'];
    final plantId = resultData['plant_identification'] ?? "Unknown Plant";
    final confidence = (resultData['confidence'] * 100).toStringAsFixed(1);

    final diseaseInfo = resultData['disease_info'] ?? {};
    final diseaseName = diseaseInfo['disease_name'] ?? "Unknown";
    final severity = diseaseInfo['severity'] ?? "Unknown";
    final description =
        diseaseInfo['description'] ?? "No description available.";

    // Safely cast or default lists
    final organicRemedies = List<String>.from(
      diseaseInfo['organic_remedies'] ?? [],
    );
    final chemicalTreatment = List<String>.from(
      diseaseInfo['chemical_treatment'] ?? [],
    );
    final preventionTips = List<String>.from(
      diseaseInfo['prevention_tips'] ?? [],
    );

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
          'Scan Results',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Card
            if (imagePath != null && (kIsWeb || File(imagePath).existsSync()))
              Hero(
                    tag: 'scan_card',
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 30,
                            offset: const Offset(0, 15),
                          ),
                        ],
                        image: DecorationImage(
                          image: kIsWeb
                              ? NetworkImage(imagePath) as ImageProvider
                              : FileImage(File(imagePath)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  .animate()
                  .scale(
                    begin: const Offset(1.1, 1.1),
                    end: const Offset(1, 1),
                    curve: Curves.easeOutExpo,
                    duration: 800.ms,
                  )
                  .fade(),

            const SizedBox(height: 32),

            // Top Info Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plant Identification',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      plantId,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.leafGreen.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.leafGreen),
                      ),
                      child: Text(
                        '$confidence% Match',
                        style: const TextStyle(
                          color: AppColors.deepGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .shimmer(
                      duration: 2.seconds,
                      color: AppColors.leafGreen.withValues(alpha: 0.3),
                    ),
              ],
            ).animate().fade(delay: 200.ms).slideY(begin: 0.2),

            const SizedBox(height: 32),

            // Diagnosis Card
            Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.coronavirus,
                            color: AppColors.errorRed,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Diagnosis',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: AppColors.errorRed),
                          ),
                          const Spacer(),
                          _buildSeverityBadge(severity),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        diseaseName,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: AppColors.errorRed,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      const SizedBox(height: 24),
                      // Animated Progress Bar for Severity
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Severity Level',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(color: AppColors.midGreyText),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppColors.midGreyText.withValues(
                                alpha: 0.2,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child:
                                  Container(
                                    width: severity.toLowerCase() == 'high'
                                        ? 250
                                        : severity.toLowerCase() == 'moderate'
                                        ? 150
                                        : 80, // rough visualization
                                    decoration: BoxDecoration(
                                      color: severity.toLowerCase() == 'high'
                                          ? AppColors.errorRed
                                          : severity.toLowerCase() == 'moderate'
                                          ? AppColors.warningOrange
                                          : AppColors.leafGreen,
                                      borderRadius: BorderRadius.circular(4),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              (severity.toLowerCase() == 'high'
                                                      ? AppColors.errorRed
                                                      : AppColors.warningOrange)
                                                  .withValues(alpha: 0.4),
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                  ).animate().scaleX(
                                    begin: 0,
                                    end: 1,
                                    alignment: Alignment.centerLeft,
                                    duration: 1.seconds,
                                    curve: Curves.easeOutQuint,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                .animate()
                .fade(delay: 300.ms)
                .slideY(begin: 0.2, curve: Curves.easeOutBack),

            const SizedBox(height: 32),
            Text(
              'Treatment Plan',
              style: Theme.of(context).textTheme.titleMedium,
            ).animate().fade(delay: 400.ms).slideX(begin: -0.1),
            const SizedBox(height: 16),

            _buildTreatmentSection(
              'Organic Remedies',
              Icons.eco,
              organicRemedies,
            ).animate().fade(delay: 500.ms).slideY(begin: 0.2),
            _buildTreatmentSection(
              'Chemical Treatment',
              Icons.science,
              chemicalTreatment,
            ).animate().fade(delay: 600.ms).slideY(begin: 0.2),
            _buildTreatmentSection(
              'Prevention Tips',
              Icons.shield,
              preventionTips,
            ).animate().fade(delay: 700.ms).slideY(begin: 0.2),

            const SizedBox(height: 32),

            // Action Buttons
            Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.deepGreen,
                          foregroundColor: AppColors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 5,
                          shadowColor: AppColors.deepGreen.withValues(
                            alpha: 0.5,
                          ),
                        ),
                        child: const Text(
                          'Save to My Plants',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.share,
                          color: AppColors.deepGreen,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
                .animate()
                .fade(delay: 800.ms)
                .slideY(begin: 0.2, curve: Curves.easeOutExpo),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildSeverityBadge(String severity) {
    Color color;
    if (severity.toLowerCase() == 'high') {
      color = AppColors.errorRed;
    } else if (severity.toLowerCase() == 'moderate') {
      color = AppColors.warningOrange;
    } else {
      color = AppColors.leafGreen;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        severity.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _buildTreatmentSection(
    String title,
    IconData icon,
    List<String> items,
  ) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.deepGreen.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: AppColors.deepGreen, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.darkText,
                  ),
                ),
                const SizedBox(height: 12),
                ...items.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 6, right: 12),
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: AppColors.leafGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item,
                            style: const TextStyle(
                              color: AppColors.midGreyText,
                              height: 1.5,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
