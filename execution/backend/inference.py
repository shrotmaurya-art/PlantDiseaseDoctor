import torch
import torchvision.transforms as transforms
from PIL import Image
import io
import os

# Note: Loading a raw .pth file requires the original model class
# Assuming a standard ResNet or similar architecture based on typical plant disease models
# For this implementation, we will mock the exact model class import 
# or use a generic load if it's a traced model.

MODEL_PATH = os.path.join(os.path.dirname(__file__), "..", "..", "best_model.pth")

# Example classes (Replace with your actual classes associated with best_model.pth)
CLASSES = ["Apple Scab", "Powdery Mildew", "Healthy", "Tomato Early Blight"]

device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

# Dummy model class for demonstration if it's not a TorchScript model
import torchvision.models as models
import torch.nn as nn

def load_model():
    try:
        # Assuming it's a ResNet18 trained on standard plant village dataset 
        # You will need to replace this architecture matching your original training code
        model = models.resnet18(pretrained=False)
        num_ftrs = model.fc.in_features
        model.fc = nn.Linear(num_ftrs, len(CLASSES)) # adjust number of classes
        
        if os.path.exists(MODEL_PATH):
            model.load_state_dict(torch.load(MODEL_PATH, map_location=device))
            model.to(device)
            model.eval()
            print(f"Model loaded successfully from {MODEL_PATH}")
            return model
        else:
            print(f"Warning: Model not found at {MODEL_PATH}")
            return None
    except Exception as e:
        print(f"Error loading model: {e}")
        return None

app_model = load_model()

# Image transformations matching typical ImageNet/PyTorch training
transform = transforms.Compose([
    transforms.Resize((224, 224)),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
])

def predict_image(image_bytes: bytes):
    if app_model is None:
        return {"error": "Model not loaded", "class_name": "Unknown", "confidence": 0.0}
    
    try:
        image = Image.open(io.BytesIO(image_bytes)).convert('RGB')
        tensor = transform(image).unsqueeze(0).to(device)
        
        with torch.no_grad():
            outputs = app_model(tensor)
            probabilities = torch.nn.functional.softmax(outputs, dim=1)
            confidence, predicted = torch.max(probabilities, 1)
            
            class_idx = predicted.item()
            conf_score = confidence.item()
            
            # Fallback if classes list is smaller than model output
            if class_idx < len(CLASSES):
                class_name = CLASSES[class_idx]
            else:
                class_name = f"Class_{class_idx}"
                
            return {
                "class_name": class_name,
                "confidence": conf_score
            }
    except Exception as e:
        return {"error": str(e), "class_name": "Unknown", "confidence": 0.0}
