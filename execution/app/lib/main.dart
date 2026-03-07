import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme/typography.dart';
import 'screens/splash_screen.dart';
import 'screens/home_dashboard.dart';
import 'screens/camera_scan.dart';
import 'screens/analyzing_screen.dart';
import 'screens/result_screen.dart';
import 'screens/my_plants.dart';
import 'screens/disease_library.dart';
import 'screens/ai_chat.dart';

void main() {
  runApp(const PlantDoctorApp());
}

class PlantDoctorApp extends StatelessWidget {
  const PlantDoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Smart Plant Doctor',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeDashboard()),
    GoRoute(
      path: '/scan',
      builder: (context, state) => const CameraScanScreen(),
    ),
    GoRoute(
      path: '/analyzing',
      builder: (context, state) {
        final imagePath = state.extra as String?;
        return AnalyzingScreen(imagePath: imagePath);
      },
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return ResultScreen(resultData: data);
      },
    ),
    GoRoute(
      path: '/my_plants',
      builder: (context, state) => const MyPlantsScreen(),
    ),
    GoRoute(
      path: '/library',
      builder: (context, state) => const DiseaseLibraryScreen(),
    ),
    GoRoute(path: '/chat', builder: (context, state) => const AiChatScreen()),
  ],
);
