class DiseaseRemedies {
  static const Map<String, Map<String, dynamic>> data = {
    "Healthy": {
      "disease_name": "Healthy Plant",
      "severity": "None",
      "description": "The plant is healthy and showing no signs of disease.",
      "organic_remedies": [
        "Maintain current care routine",
        "Ensure adequate sunlight and water",
      ],
      "chemical_treatment": ["None needed"],
      "prevention_tips": [
        "Water at the base to prevent leaf rot",
        "Ensure good air circulation",
      ],
    },
    "Apple Scab": {
      "disease_name": "Apple Scab",
      "severity": "Moderate",
      "description":
          "Fungal disease causing dark, scabby spots on leaves and fruit.",
      "organic_remedies": [
        "Remove and destroy infected leaves",
        "Apply neem oil or sulfur-based sprays",
      ],
      "chemical_treatment": ["Apply a preventative fungicide in early spring"],
      "prevention_tips": [
        "Prune trees to improve air circulation",
        "Rake up fallen leaves in autumn",
      ],
    },
    "Powdery Mildew": {
      "disease_name": "Powdery Mildew",
      "severity": "Low to Moderate",
      "description":
          "A white or gray powdery fungal growth on the surface of leaves and stems.",
      "organic_remedies": [
        "Spray with a mixture of baking soda, soap, and water",
        "Use milk spray (1 part milk to 9 parts water)",
      ],
      "chemical_treatment": ["Use sulfur or copper-based fungicides"],
      "prevention_tips": [
        "Avoid overhead watering",
        "Plant disease-resistant varieties",
        "Space plants for good airflow",
      ],
    },
    "Tomato Early Blight": {
      "disease_name": "Early Blight",
      "severity": "High",
      "description":
          "Fungal disease characterized by 'bullseye' spots on lower leaves, eventually causing them to drop.",
      "organic_remedies": [
        "Remove affected leaves immediately",
        "Apply copper fungicide",
      ],
      "chemical_treatment": ["Apply chlorothalonil or mancozeb fungicides"],
      "prevention_tips": [
        "Stake plants to keep foliage off the ground",
        "Mulch around the base",
        "Water at the soil level",
      ],
    },
    "Unknown": {
      "disease_name": "Unknown Condition",
      "severity": "Unknown",
      "description":
          "The disease could not be identified with high confidence.",
      "organic_remedies": ["Isolate the plant if possible", "Check for pests"],
      "chemical_treatment": ["Consult a local agricultural extension"],
      "prevention_tips": ["Monitor closely for spreading"],
    },
  };
}
