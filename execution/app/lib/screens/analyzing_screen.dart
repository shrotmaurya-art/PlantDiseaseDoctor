import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/colors.dart';
import '../data/disease_remedies.dart';
import '../services/ai_service.dart';

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
      // Offline on-device inference using pytorch_lite
      final predictionResult = await AIService.predict(widget.imagePath!);

      final rawClassName = predictionResult['class_name'] as String;
      final confidence = predictionResult['confidence'] as double;

      // Sanitize the class name to ensure it matches exactly with our data map keys
      final className = rawClassName
          .trim()
          .replaceAll('"', '')
          .replaceAll("'", '');
      debugPrint("Raw prediction: '$rawClassName' -> Sanitized: '$className'");

      if (className.startsWith("Error")) {
        _showErrorAndReturn(className);
        return;
      }

      // Look up richer database info
      final diseaseInfo =
          DiseaseRemedies.data[className] ??
          DiseaseRemedies.data['Unknown'] ??
          {};

      if (mounted) {
        context.pushReplacement(
          '/result',
          extra: {
            "success": true,
            "plant_identification": diseaseInfo['plant'] ?? "Unknown Plant",
            "disease_detected": className,
            "confidence": confidence,
            "local_image_path": widget.imagePath,
            "disease_info": diseaseInfo,
          },
        );
      }
    } catch (e) {
      debugPrint("Analysis error: $e");
      // Local fallback on extreme error
      if (mounted) {
        context.pushReplacement(
          '/result',
          extra: {
            "success": false,
            "plant_identification": "Scanned Plant",
            "disease_detected": "Unknown",
            "confidence": 0.0,
            "local_image_path": widget.imagePath,
            "disease_info": DiseaseRemedies.data['Unknown'],
          },
        );
      }
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
      backgroundColor: AppColors.deepGreen,
      body: Stack(
        children: [
          // Animated gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.deepGreen,
                  AppColors.leafGreen.withValues(alpha: 0.7),
                  AppColors.deepGreen,
                ],
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Pulsing circle loader
                Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.1),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.4),
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.energy_savings_leaf_rounded,
                        size: 64,
                        color: Colors.white,
                      ),
                    )
                    .animate(onPlay: (c) => c.repeat(reverse: true))
                    .scale(
                      begin: const Offset(0.9, 0.9),
                      end: const Offset(1.1, 1.1),
                      duration: 1500.ms,
                      curve: Curves.easeInOut,
                    ),

                const SizedBox(height: 40),

                Text(
                  'Analyzing Plant',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ).animate().fade(delay: 300.ms).slideY(begin: 0.3),

                const SizedBox(height: 12),

                Text(
                  'AI is examining your plant for diseases...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 15,
                  ),
                ).animate().fade(delay: 500.ms),

                const SizedBox(height: 40),

                // Bouncing dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          )
                          .animate(onPlay: (c) => c.repeat())
                          .moveY(
                            begin: 0,
                            end: -12,
                            delay: Duration(milliseconds: i * 200),
                            duration: 500.ms,
                            curve: Curves.easeInOut,
                          )
                          .then()
                          .moveY(begin: -12, end: 0, duration: 500.ms),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
