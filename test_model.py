import torch
import torchvision.transforms as transforms
from PIL import Image
import urllib.request
import os

def download_image(url, filename):
    if not os.path.exists(filename):
        req = urllib.request.Request(url, headers={'User-Agent': 'PlantDoctorTestScript/1.0 (test@example.com)'})
        with urllib.request.urlopen(req) as response, open(filename, 'wb') as out_file:
            out_file.write(response.read())
    return filename

def main():
    model_path = r"c:\Users\kings\OneDrive\Desktop\Documents\plantdetection1\execution\app\assets\models\model_scripted.pt"
    labels_path = r"c:\Users\kings\OneDrive\Desktop\Documents\plantdetection1\execution\app\assets\models\labels.txt"
    
    # Load labels
    with open(labels_path, "r") as f:
        labels = [line.strip() for line in f.readlines() if line.strip()]

    print(f"Loading {model_path}...")
    model = torch.jit.load(model_path, map_location=torch.device('cpu'))
    model.eval()

    transform = transforms.Compose([
        transforms.Resize((224, 224)),
        transforms.ToTensor()
    ])

    test_images = [
        # User's uploaded image
        (r"c:\Users\kings\OneDrive\Desktop\Documents\plantdetection1\WhatsApp Image 2026-03-09 at 5.47.48 PM.jpeg", "User Uploaded (Tomato)"),
        # Random image 1
        (download_image("https://picsum.photos/224", "random_1.jpg"), "Random Image 1"),
        # Random image 2
        (download_image("https://picsum.photos/id/237/224/224", "random_2_dog.jpg"), "Random Image 2 (Dog)")
    ]

    for img_path, desc in test_images:
        print(f"\n--- Testing: {desc} ---")
        try:
            img = Image.open(img_path).convert('RGB')
        except Exception as e:
            print(f"Could not open image {img_path}: {e}")
            continue

        img_tensor = transform(img).unsqueeze(0)

        with torch.no_grad():
            out = model(img_tensor)
            
        probabilities = torch.nn.functional.softmax(out, dim=1)[0]
        top5_prob, top5_catid = torch.topk(probabilities, 5)
        
        for i in range(top5_prob.size(0)):
            idx = top5_catid[i].item()
            prob = top5_prob[i].item() * 100
            print(f"[{idx}] {labels[idx]} - {prob:.2f}%")

if __name__ == '__main__':
    main()
