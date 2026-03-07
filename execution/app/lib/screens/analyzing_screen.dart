import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/colors.dart';
import '../services/ai_service.dart';
import '../data/disease_remedies.dart';

class AnalyzingScreen extends StatefulWidget {
  final String? imagePath;

  const AnalyzingScreen({super.key, required this.imagePath});

  @override
  State<AnalyzingScreen> createState() => _AnalyzingScreenState();
}

class _AnalyzingScreenState extends State<AnalyzingScreen> {
  @override
  void initState() {
    super.initState();
    _analyzeImage();
  }

  Future<void> _analyzeImage() async {
    if (widget.imagePath == null) {
      _showErrorAndReturn("No image selected");
      return;
    }

    try {
      // Offline local model processing
      final prediction = await AIService.predict(widget.imagePath!);

      final className = prediction['class_name'] as String;
      final confidence = prediction['confidence'] as double;

      // Pull deterministic remedies dictionary matching the AI class
      final diseaseInfo =
          DiseaseRemedies.data[className] ?? DiseaseRemedies.data['Unknown'];

      // Construct routing payload matching the ResultScreen expected format
      final payload = {
        "success": true,
        "plant_identification": className == "Healthy" || className == "Unknown"
            ? "Scanned Plant"
            : "Infected Plant",
        "disease_detected": className,
        "confidence": confidence,
        "local_image_path": widget.imagePath,
        "disease_info": diseaseInfo,
      };

      // Slight synthetic delay for UX premium loading feel
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        context.pushReplacement('/result', extra: payload);
      }
    } catch (e) {
      _showErrorAndReturn("Processing failed: $e");
    }
  }

  void _showErrorAndReturn(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softBeige,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image Stack
            Stack(
              alignment: Alignment.center,
              children: [
                // Outer glowing circle
                Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.leafGreen.withValues(alpha: 0.1),
                      ),
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .scale(
                      begin: const Offset(1, 1),
                      end: const Offset(1.1, 1.1),
                      duration: 1.5.seconds,
                      curve: Curves.easeInOut,
                    )
                    .fade(begin: 0.5, end: 1),

                // Inner rotating dashed border (Circular Loader effect)
                SizedBox(
                  width: 220,
                  height: 220,
                  child: CircularProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.deepGreen,
                    ),
                    strokeWidth: 2,
                    backgroundColor: AppColors.leafGreen.withValues(alpha: 0.2),
                  ),
                ),

                // Image payload
                if (widget.imagePath != null)
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.deepGreen.withValues(alpha: 0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: kIsWeb
                          ? Image.network(widget.imagePath!, fit: BoxFit.cover)
                          : Image.file(
                              File(widget.imagePath!),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),

                // Scanning Overlay
                Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.leafGreen.withValues(alpha: 0.4),
                            Colors.transparent,
                          ],
                          stops: const [0.2, 1.0],
                        ),
                      ),
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .fade(duration: 1.seconds),
              ],
            ).animate().scale(curve: Curves.easeOutBack, duration: 800.ms),

            const SizedBox(height: 48),

            // Text
            Text(
                  'Analyzing plant health...',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.deepGreen,
                  ),
                )
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: 2.seconds, color: AppColors.leafGreen)
                .fadeIn(duration: 500.ms),

            const SizedBox(height: 12),

            Text(
              'Running AI Model 🌿',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.midGreyText),
            ).animate().fade(delay: 500.ms).slideY(begin: 0.5),
          ],
        ),
      ),
    );
  }
}
