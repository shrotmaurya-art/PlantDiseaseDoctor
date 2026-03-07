import requests
import io
import time
from PIL import Image

def test_api():
    print("Creating mock image...")
    # Create a 224x224 green image
    img = Image.new('RGB', (224, 224), color = (73, 109, 137))
    img_byte_arr = io.BytesIO()
    img.save(img_byte_arr, format='JPEG')
    img_byte_arr.seek(0)
    
    print("Testing /predict endpoint...")
    try:
        response = requests.post(
            "http://127.0.0.1:8000/predict",
            files={"file": ("test.jpg", img_byte_arr, "image/jpeg")}
        )
        print(f"Status Code: {response.status_code}")
        if response.status_code == 200:
            print("Response JSON:")
            print(response.json())
        else:
            print("Error:", response.text)
    except Exception as e:
        print(f"Connection failed: {e}")

if __name__ == "__main__":
    test_api()
