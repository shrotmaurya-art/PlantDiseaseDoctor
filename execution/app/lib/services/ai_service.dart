import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:pytorch_lite/pytorch_lite.dart';
import 'package:flutter/foundation.dart' show debugPrint, kIsWeb;

class AIService {
  static ClassificationModel? _classifier;
  static String? _loadError;

  // Standard PlantVillage 38 classes in alphabetical order
  static const List<String> classes = [
    "Apple Scab",
    "Apple Black Rot",
    "Apple Cedar Apple Rust",
    "Healthy", // Apple healthy
    "Healthy", // Blueberry healthy
    "Cherry Powdery Mildew",
    "Cherry Healthy", // Cherry healthy
    "Corn Gray Leaf Spot",
    "Corn Common Rust",
    "Corn Northern Leaf Blight",
    "Corn Healthy", // Corn healthy
    "Grape Black Rot",
    "Grape Esca Black Measles",
    "Grape Leaf Blight Isariopsis",
    "Grape Healthy", // Grape healthy
    "Orange Haunglongbing Citrus Greening",
    "Peach Bacterial Spot",
    "Peach Healthy", // Peach healthy
    "Bell Pepper Bacterial Spot",
    "Bell Pepper Healthy", // Pepper healthy
    "Potato Early Blight",
    "Potato Late Blight",
    "Potato Healthy", // Potato healthy
    "Raspberry Healthy", // Raspberry healthy
    "Soybean Healthy", // Soybean healthy
    "Squash Powdery Mildew",
    "Strawberry Leaf Scorch",
    "Strawberry Healthy", // Strawberry healthy
    "Tomato Bacterial Spot",
    "Tomato Early Blight",
    "Tomato Late Blight",
    "Tomato Leaf Mold",
    "Tomato Septoria Leaf Spot",
    "Tomato Spider Mites Two Spotted Spider Mite",
    "Tomato Target Spot",
    "Tomato Yellow Leaf Curl Virus",
    "Tomato Mosaic Virus",
    "Tomato Healthy", // Tomato healthy
  ];

  static Future<void> init() async {
    if (kIsWeb) {
      _loadError = "AI Inference is not supported on the Web platform.";
      return;
    }

    try {
      _classifier = await PytorchLite.loadClassificationModel(
        "assets/models/model_optimized.ptl", // Using the mobile-optimized model
        224,
        224,
        labelPath: "assets/models/labels.txt",
      );
      debugPrint("Local AI Model Loaded Successfully");
      _loadError = null;
    } catch (e) {
      debugPrint("Failed to load local AI model: $e");
      _loadError = e.toString();
    }
  }

  static Future<Map<String, dynamic>> predict(String imagePath) async {
    if (kIsWeb) {
      return {
        "class_name":
            "Error: AI Inference is not supported on the Web platform (try on Android/iOS).",
        "confidence": 0.0,
      };
    }

    if (_classifier == null) {
      await init();
    }

    if (_classifier == null) {
      return {
        "class_name": "Error: ${_loadError ?? 'Model not loaded'}",
        "confidence": 0.0,
      };
    }

    try {
      final Uint8List imageBytes = await File(imagePath).readAsBytes();

      // Get raw logits from the model (NOT pre-softmaxed probabilities,
      // to avoid double-softmax if the model already applies softmax).
      List<double?>? rawScores = await _classifier!.getImagePredictionList(
        imageBytes,
      );

      double maxConf = 0.0;
      int maxIdx = 0;

      if (rawScores != null && rawScores.isNotEmpty) {
        // Apply softmax manually to convert logits to probabilities
        double maxLogit = rawScores.fold<double>(
          double.negativeInfinity,
          (a, b) => (b ?? double.negativeInfinity) > a ? b! : a,
        );
        double sumExp = 0.0;
        List<double> probs = [];
        for (var s in rawScores) {
          double e = exp(
            (s ?? 0.0) - maxLogit,
          ); // subtract max for numerical stability
          probs.add(e);
          sumExp += e;
        }
        for (int i = 0; i < probs.length; i++) {
          double prob = probs[i] / sumExp;
          if (prob > maxConf) {
            maxConf = prob;
            maxIdx = i;
          }
        }
      }

      // Ensure index is within labels bounds
      String prediction = "Unknown";
      if (_classifier!.labels.isNotEmpty) {
        prediction = _classifier!
            .labels[maxIdx < _classifier!.labels.length ? maxIdx : 0];
      }

      return {"class_name": prediction, "confidence": maxConf};
    } catch (e) {
      debugPrint("Inference error: $e");
      return {"class_name": "Error: Inference failed", "confidence": 0.0};
    }
  }
}
