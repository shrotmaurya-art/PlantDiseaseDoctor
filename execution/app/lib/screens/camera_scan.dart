import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/colors.dart';

class CameraScanScreen extends StatefulWidget {
  const CameraScanScreen({super.key});

  @override
  State<CameraScanScreen> createState() => _CameraScanScreenState();
}

class _CameraScanScreenState extends State<CameraScanScreen>
    with TickerProviderStateMixin {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  bool _isCameraInitialized = false;
  bool _isFlashing = false;
  late AnimationController _scanLineController;

  @override
  void initState() {
    super.initState();
    _initCamera();
    _scanLineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isNotEmpty) {
        _controller = CameraController(
          _cameras[0],
          ResolutionPreset.high,
          enableAudio: false,
        );
        await _controller!.initialize();
        if (mounted) {
          setState(() {
            _isCameraInitialized = true;
          });
        }
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _scanLineController.dispose();
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (!_isCameraInitialized || _controller == null) return;
    try {
      setState(() => _isFlashing = true);
      await Future.delayed(
        const Duration(milliseconds: 100),
      ); // Flash effect duration
      final image = await _controller!.takePicture();
      setState(() => _isFlashing = false);
      if (mounted) {
        context.push('/analyzing', extra: image.path);
      }
    } catch (e) {
      setState(() => _isFlashing = false);
      debugPrint('Error taking picture: $e');
    }
  }

  Future<void> _pickFromGallery() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && mounted) {
      context.push('/analyzing', extra: image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Camera Preview
          if (_isCameraInitialized && _controller != null)
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CameraPreview(_controller!),
            )
          else
            const Center(
              child: CircularProgressIndicator(color: AppColors.leafGreen),
            ),

          // Flash Effect Overlay
          if (_isFlashing)
            Container(
              color: Colors.white.withValues(alpha: 0.8),
            ).animate().fade(duration: 100.ms),

          // Custom Overlay
          SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () => context.pop(),
                      ).animate().fade(delay: 200.ms).slideX(begin: -0.5),
                    ],
                  ),
                ),

                const Spacer(),

                // Scanning Frame with animation
                Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                              width: 280,
                              height: 280,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.leafGreen.withValues(
                                    alpha: 0.8,
                                  ),
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(32),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.leafGreen.withValues(
                                      alpha: 0.2,
                                    ),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                            )
                            .animate(
                              onPlay: (controller) =>
                                  controller.repeat(reverse: true),
                            )
                            .shimmer(duration: 2.seconds, color: Colors.white54)
                            .scale(
                              begin: const Offset(1, 1),
                              end: const Offset(1.02, 1.02),
                              duration: 1.5.seconds,
                              curve: Curves.easeInOut,
                            ),

                        // Moving Scan Line
                        AnimatedBuilder(
                          animation: _scanLineController,
                          builder: (context, child) {
                            return Positioned(
                              top:
                                  10 +
                                  (_scanLineController.value *
                                      250), // 280 - 10(padding) - 20(line height) = 250 range
                              child: Container(
                                width: 260,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: AppColors.leafGreen,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.leafGreen.withValues(
                                        alpha: 0.8,
                                      ),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    )
                    .animate()
                    .fade(duration: 800.ms)
                    .scale(
                      begin: const Offset(0.8, 0.8),
                      curve: Curves.easeOutBack,
                    ),

                const SizedBox(height: 32),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
                  child: const Text(
                    'Place the plant leaf inside the frame',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ).animate().fade(delay: 400.ms).slideY(begin: 0.5),

                const Spacer(),

                // Bottom Controls
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                    left: 24,
                    right: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.flash_off,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          // Toggle Flash
                        },
                      ).animate().fade(delay: 600.ms).scale(),

                      GestureDetector(
                            onTapDown: (_) => setState(() {}),
                            onTapUp: (_) => _takePicture(),
                            onTapCancel: () => setState(() {}),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          )
                          .animate()
                          .fade(delay: 500.ms)
                          .scale(curve: Curves.easeOutBack),

                      IconButton(
                        icon: const Icon(
                          Icons.photo_library,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: _pickFromGallery,
                      ).animate().fade(delay: 600.ms).scale(),
                    ],
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
