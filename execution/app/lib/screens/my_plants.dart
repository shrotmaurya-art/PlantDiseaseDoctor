import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/colors.dart';

class MyPlantsScreen extends StatelessWidget {
  const MyPlantsScreen({super.key});

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
          'My Plants',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: AppColors.deepGreen),
            onPressed: () => context.go('/scan'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_florist,
              size: 64,
              color: AppColors.midGreyText.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            Text(
              'Your Garden is Empty',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AppColors.darkText),
            ),
            const SizedBox(height: 8),
            Text(
              'Save your analyzed plants to track\nhealth and growth over time.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/scan'),
              child: const Text('Add First Plant'),
            ),
          ],
        ),
      ),
    );
  }
}
