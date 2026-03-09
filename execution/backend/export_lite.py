import torch
import os

pt_path = r"c:\Users\kings\OneDrive\Desktop\Documents\plantdetection1\execution\app\assets\models\model_scripted.pt"
out_ptl = r"c:\Users\kings\OneDrive\Desktop\Documents\plantdetection1\execution\app\assets\models\model_optimized_reexport.ptl"

model = torch.jit.load(pt_path)
model.eval()

# Check output shape
dummy_input = torch.randn(1, 3, 224, 224)
with torch.no_grad():
    out = model(dummy_input)
    print("Output shape:", out.shape)

# Re-export for lite interpreter
try:
    model._save_for_lite_interpreter(out_ptl)
    print("Successfully exported to PTL format!")
except Exception as e:
    print("Failed to export to lite interpreter:", e)
