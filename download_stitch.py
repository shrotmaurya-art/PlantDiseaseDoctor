import urllib.request
import json

try:
    with open(r"C:\Users\kings\.gemini\antigravity\brain\a877b229-1cac-4f08-850d-c2bb3cd5aeb1\.system_generated\steps\361\output.txt", "r", encoding="utf-8") as f:
        data = json.load(f)

    screens = data.get("outputComponents", [])[0].get("design", {}).get("screens", [])
    if len(screens) >= 2:
        url1 = screens[0]["screenshot"]["downloadUrl"]
        url2 = screens[1]["screenshot"]["downloadUrl"]

        urllib.request.urlretrieve(url1, r"C:\Users\kings\.gemini\antigravity\brain\a877b229-1cac-4f08-850d-c2bb3cd5aeb1\stitch_home.png")
        print("Downloaded home screenshot.")
        
        urllib.request.urlretrieve(url2, r"C:\Users\kings\.gemini\antigravity\brain\a877b229-1cac-4f08-850d-c2bb3cd5aeb1\stitch_result.png")
        print("Downloaded result screenshot.")
    else:
        print("Could not find screens in JSON.")
except Exception as e:
    print(f"Error: {e}")
