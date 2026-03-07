import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/colors.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softBeige,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context)
                  .animate()
                  .fade(duration: 600.ms)
                  .slideY(begin: -0.2, curve: Curves.easeOutCubic),
              const SizedBox(height: 32),
              _buildMainScanCard(context),
              const SizedBox(height: 32),
              Text(
                'Quick Actions',
                style: Theme.of(context).textTheme.titleMedium,
              ).animate().fade(delay: 200.ms).slideX(begin: -0.1),
              const SizedBox(height: 16),
              _buildQuickActions(context),
              const SizedBox(height: 32),
              Text(
                'Recent Scans',
                style: Theme.of(context).textTheme.titleMedium,
              ).animate().fade(delay: 400.ms).slideX(begin: -0.1),
              const SizedBox(height: 16),
              _buildRecentScansEmpty(context)
                  .animate()
                  .fade(delay: 500.ms, duration: 600.ms)
                  .slideY(begin: 0.2, curve: Curves.easeOutBack),
            ],
          ),
        ),
      ),
      floatingActionButton:
          FloatingActionButton(
                onPressed: () => context.push('/chat'),
                backgroundColor: AppColors.leafGreen,
                elevation: 4,
                child: const Icon(Icons.smart_toy, color: AppColors.white),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .shimmer(duration: 2.seconds, color: Colors.white24),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Gardener 🌿',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Let\'s check your plant health',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [AppColors.leafGreen, AppColors.deepGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.leafGreen.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 22,
            child: Icon(Icons.person, color: AppColors.deepGreen),
          ),
        ),
      ],
    );
  }

  Widget _buildMainScanCard(BuildContext context) {
    return Hero(
      tag: 'scan_card',
      child:
          Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    context.push('/scan');
                  },
                  borderRadius: BorderRadius.circular(28),
                  splashColor: Colors.white24,
                  highlightColor: Colors.white10,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.leafGreen, AppColors.deepGreen],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.deepGreen.withValues(alpha: 0.4),
                          blurRadius: 24,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white.withValues(alpha: 0.15),
                                border: Border.all(
                                  color: AppColors.white.withValues(alpha: 0.5),
                                  width: 1.5,
                                ),
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: AppColors.white,
                                size: 48,
                              ),
                            )
                            .animate(
                              onPlay: (controller) =>
                                  controller.repeat(reverse: true),
                            )
                            .scale(
                              begin: const Offset(1, 1),
                              end: const Offset(1.08, 1.08),
                              duration: 2.seconds,
                              curve: Curves.easeInOutSine,
                            )
                            .boxShadow(
                              begin: BoxShadow(
                                color: AppColors.white.withValues(alpha: 0.0),
                                blurRadius: 0,
                                spreadRadius: 0,
                              ),
                              end: BoxShadow(
                                color: AppColors.white.withValues(alpha: 0.3),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                              duration: 2.seconds,
                            ),
                        const SizedBox(height: 20),
                        Text(
                          'Scan Plant',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Identify diseases instantly with AI',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.white.withValues(alpha: 0.9),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .animate()
              .fade(duration: 800.ms)
              .scale(
                begin: const Offset(0.95, 0.95),
                curve: Curves.easeOutExpo,
              ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ActionColumn(
          icon: Icons.upload_file,
          label: 'Upload',
          color: AppColors.leafGreen,
          delay: 200,
          onTap: () {
            context.push('/scan');
          },
        ),
        _ActionColumn(
          icon: Icons.local_florist,
          label: 'My Plants',
          color: const Color(0xFF2196F3),
          delay: 300,
          onTap: () {
            context.push('/my_plants');
          },
        ),
        _ActionColumn(
          icon: Icons.library_books,
          label: 'Disease Lib',
          color: const Color(0xFFFF9800),
          delay: 400,
          onTap: () {
            context.push('/library');
          },
        ),
      ],
    );
  }

  Widget _buildRecentScansEmpty(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.history,
            size: 48,
            color: AppColors.midGreyText.withValues(alpha: 0.2),
          ),
          const SizedBox(height: 16),
          Text(
            'No recent scans',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.midGreyText,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your plant analysis history will appear here',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        selectedItemColor: AppColors.deepGreen,
        unselectedItemColor: AppColors.midGreyText,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        elevation: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              context.push('/scan');
              break;
            case 2:
              context.push('/library');
              break;
            case 3:
              context.push('/my_plants');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class _ActionColumn extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  final int delay;

  const _ActionColumn({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
    required this.delay,
  });

  @override
  State<_ActionColumn> createState() => _ActionColumnState();
}

class _ActionColumnState extends State<_ActionColumn> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) {
            setState(() => _isPressed = false);
            widget.onTap();
          },
          onTapCancel: () => setState(() => _isPressed = false),
          child: AnimatedScale(
            scale: _isPressed ? 0.92 : 1.0,
            duration: const Duration(milliseconds: 150),
            curve: Curves.fastOutSlowIn,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: widget.color.withValues(
                          alpha: _isPressed ? 0.0 : 0.15,
                        ),
                        blurRadius: _isPressed ? 0 : 15,
                        offset: _isPressed
                            ? const Offset(0, 0)
                            : const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(widget.icon, color: widget.color, size: 28),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
              ],
            ),
          ),
        )
        .animate()
        .fade(delay: widget.delay.ms, duration: 500.ms)
        .slideY(begin: 0.2, curve: Curves.easeOutBack);
  }
}
