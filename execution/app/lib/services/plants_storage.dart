import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// A single saved plant entry
class PlantEntry {
  final String id;
  final String imagePath;
  final String plantName;
  final String diseaseName;
  final String severity;
  final String description;
  final double confidence;
  final DateTime savedAt;
  final List<String> organicRemedies;
  final List<String> chemicalTreatment;
  final List<String> preventionTips;

  PlantEntry({
    required this.id,
    required this.imagePath,
    required this.plantName,
    required this.diseaseName,
    required this.severity,
    required this.description,
    required this.confidence,
    required this.savedAt,
    required this.organicRemedies,
    required this.chemicalTreatment,
    required this.preventionTips,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'imagePath': imagePath,
    'plantName': plantName,
    'diseaseName': diseaseName,
    'severity': severity,
    'description': description,
    'confidence': confidence,
    'savedAt': savedAt.toIso8601String(),
    'organicRemedies': organicRemedies,
    'chemicalTreatment': chemicalTreatment,
    'preventionTips': preventionTips,
  };

  factory PlantEntry.fromJson(Map<String, dynamic> json) => PlantEntry(
    id: json['id'] ?? '',
    imagePath: json['imagePath'] ?? '',
    plantName: json['plantName'] ?? 'Unknown Plant',
    diseaseName: json['diseaseName'] ?? 'Unknown',
    severity: json['severity'] ?? 'Unknown',
    description: json['description'] ?? '',
    confidence: (json['confidence'] ?? 0.0).toDouble(),
    savedAt: DateTime.tryParse(json['savedAt'] ?? '') ?? DateTime.now(),
    organicRemedies: List<String>.from(json['organicRemedies'] ?? []),
    chemicalTreatment: List<String>.from(json['chemicalTreatment'] ?? []),
    preventionTips: List<String>.from(json['preventionTips'] ?? []),
  );
}

class PlantsStorage {
  static const _key = 'saved_plants';

  static Future<List<PlantEntry>> loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key) ?? [];
    return raw.map((e) => PlantEntry.fromJson(jsonDecode(e))).toList();
  }

  static Future<void> save(PlantEntry entry) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key) ?? [];
    raw.add(jsonEncode(entry.toJson()));
    await prefs.setStringList(_key, raw);
  }

  static Future<void> delete(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key) ?? [];
    raw.removeWhere((e) {
      final decoded = jsonDecode(e) as Map<String, dynamic>;
      return decoded['id'] == id;
    });
    await prefs.setStringList(_key, raw);
  }
}
