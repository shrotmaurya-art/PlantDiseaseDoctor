import torch
import os

ptl_path = r"c:\Users\kings\OneDrive\Desktop\Documents\plantdetection1\execution\app\assets\models\model_optimized.ptl"
pt_path = r"c:\Users\kings\OneDrive\Desktop\Documents\plantdetection1\execution\app\assets\models\model_scripted.pt"

print("Inspect PTL:")
try:
    # PyTorch lite models are opened using torch.jit.load
    model = torch.jit.load(ptl_path)
    print("Successfully loaded PTL as TorchScript!")
    print("Methods:", [m for m in model._c._get_methods()])
except Exception as e:
    print("Failed to load PTL as TorchScript:", e)

try:
    # Is it a PyTorch mobile module?
    import torch.utils.mobile_optimizer
    # wait, mobile models usually can't be executed easily in python but can be loaded via jit if not mobile-only
    print("PTL is likely a mobile formatted model if it failed standard jit load but is valid")
except Exception as e:
    pass

print("\nInspect PT:")
try:
    model2 = torch.jit.load(pt_path)
    print("Successfully loaded PT as TorchScript!")
except Exception as e:
    print("Failed to load PT as TorchScript:", e)
    # Check if it's a state dict
    try:
        sd = torch.load(pt_path)
        print("It is a state dict with keys:", list(sd.keys())[:5])
    except Exception as e2:
        print("Failed to load as state dict:", e2)
