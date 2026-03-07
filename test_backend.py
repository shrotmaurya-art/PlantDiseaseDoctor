import sys
import os

# Add root directory to sys path so we can import execution.backend.inference
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

print("Testing Backend...")

try:
    from execution.backend.inference import load_model
    print("Inference module loaded successfully.")
    
    from execution.backend.data import DISEASE_DATA
    print(f"Loaded {len(DISEASE_DATA)} diseases from data dict.")
    
except Exception as e:
    print(f"Error testing backend locally: {e}")

print("Backend test script complete.")
