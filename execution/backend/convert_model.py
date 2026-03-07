import torch
import torchvision.models as models
import torch.nn as nn
import os

MODEL_PATH = os.path.join(os.path.dirname(__file__), "..", "..", "best_model.pth")
OUTPUT_PATH = os.path.join(os.path.dirname(__file__), "..", "..", "model_scripted.pt")
CLASSES = ["Apple Scab", "Powdery Mildew", "Healthy", "Tomato Early Blight"]

device = torch.device('cpu')

def load_and_convert():
    print(f"Loading {MODEL_PATH}...")
    try:
        model = models.efficientnet_b3(pretrained=False)
        num_ftrs = model.classifier[1].in_features
        model.classifier[1] = nn.Linear(num_ftrs, 38)
        
        # Load state dict
        checkpoint = torch.load(MODEL_PATH, map_location=device, weights_only=True)
        if 'model_state_dict' in checkpoint:
            state_dict = checkpoint['model_state_dict']
            # Sometimes models are saved via DataParallel, which prepends 'module.'
            if list(state_dict.keys())[0].startswith('module.'):
                state_dict = {k.replace('module.', ''): v for k, v in state_dict.items()}
            model.load_state_dict(state_dict)
        elif 'state_dict' in checkpoint:
            model.load_state_dict(checkpoint)
        
        model.eval()
        
        # Trace the model
        print("Tracing model...")
        example_input = torch.rand(1, 3, 224, 224)
        traced_script_module = torch.jit.trace(model, example_input)
        
        # Save the optimized TorchScript model
        traced_script_module.save(OUTPUT_PATH)
        print(f"Successfully saved TorchScript model to {OUTPUT_PATH}")
        
    except Exception as e:
        import traceback
        with open("error_full.txt", "w") as f:
            f.write(traceback.format_exc())
        print(f"Error during conversion written to error_full.txt")

if __name__ == "__main__":
    load_and_convert()
