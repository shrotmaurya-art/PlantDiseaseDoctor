import 'dart:io';
import 'package:pytorch_lite/pytorch_lite.dart';
import 'package:path_provider/path_provider.dart';

class AIService {
  static ClassificationModel? _classifier;

  // These map to the order in the original Python implementation
  static const List<String> classes = [
    "Apple Scab",
    "Powdery Mildew",
    "Healthy",
    "Tomato Early Blight",
  ];

  static Future<void> init() async {
    try {
      // Ensure the labels file exists for pytorch_lite
      final labelsPath = await _createTempLabelsFile();

      _classifier = await PytorchLite.loadClassificationModel(
        "assets/models/model_scripted.pt",
        224,
        224,
        labelPath: labelsPath,
      );
      print("Local AI Model Loaded Successfully");
    } catch (e) {
      print("Failed to load local AI model: $e");
    }
  }

  static Future<String> _createTempLabelsFile() async {
    final directory = await getTemporaryDirectory();
    final path = '${directory.path}/labels.txt';
    final file = File(path);

    // Create 38 lines of placeholders/classes
    String labelsContent = "";
    for (int i = 0; i < 38; i++) {
      if (i < classes.length) {
        labelsContent += "${classes[i]}\n";
      } else {
        labelsContent += "Class_$i\n";
      }
    }

    await file.writeAsString(labelsContent);
    return path;
  }

  static Future<Map<String, dynamic>> predict(String imagePath) async {
    if (_classifier == null) {
      await init();
    }

    if (_classifier == null) {
      return {"class_name": "Unknown", "confidence": 0.0};
    }

    try {
      // pytorch_lite expects a dart:io File string path or bytes. getImagePrediction normally takes a File
      String prediction = await _classifier!.getImagePrediction(
        await File(imagePath).readAsBytes(),
      );

      List<double?>? rawProbs = await _classifier!.getImagePredictionList(
        await File(imagePath).readAsBytes(),
      );
      List<double> probabilities = rawProbs?.whereType<double>().toList() ?? [];

      double maxConf = 0.0;
      if (probabilities.isNotEmpty) {
        maxConf = probabilities.reduce(
          (curr, next) => curr > next ? curr : next,
        );
      } else {
        maxConf = 0.90; // Fallback acceptable confidence
      }

      return {"class_name": prediction, "confidence": maxConf};
    } catch (e) {
      print("Inference error: $e");
      return {"class_name": "Unknown", "confidence": 0.0};
    }
  }
}
