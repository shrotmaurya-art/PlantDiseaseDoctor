import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/colors.dart';

class DiseaseLibraryScreen extends StatelessWidget {
  const DiseaseLibraryScreen({super.key});

  final List<Map<String, String>> diseases = const [
    {
      "name": "Apple Scab",
      "type": "Fungus",
      "symptoms": "Dark, scabby spots on leaves and fruit.",
    },
    {
      "name": "Powdery Mildew",
      "type": "Fungus",
      "symptoms": "White powdery growth on leaves.",
    },
    {
      "name": "Early Blight",
      "type": "Fungal/Bacterial",
      "symptoms": "'Bullseye' spots on lower leaves.",
    },
    {
      "name": "Nitrogen Deficiency",
      "type": "Nutrient",
      "symptoms": "Yellowing of older leaves, slow growth.",
    },
    {
      "name": "Aphid Infestation",
      "type": "Pest",
      "symptoms": "Curled, yellowing leaves with sticky honeydew.",
    },
  ];

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
          'Disease Library',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 8.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search diseases...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.midGreyText,
                ),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: diseases.length,
              itemBuilder: (context, index) {
                final disease = diseases[index];
                return _buildDiseaseCard(context, disease);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiseaseCard(BuildContext context, Map<String, String> disease) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.leafGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.bug_report, color: AppColors.deepGreen),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  disease['name']!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  disease['type']!,
                  style: const TextStyle(
                    color: AppColors.leafGreen,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  disease['symptoms']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
