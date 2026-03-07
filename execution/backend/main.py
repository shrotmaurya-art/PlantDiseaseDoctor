from fastapi import FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
from data import DISEASE_DATA
from inference import predict_image

app = FastAPI(title="Plant Doctor AI Backend")

# Allow Flutter app to communicate with FastAPI
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def read_root():
    return {"message": "Plant Doctor AI Model Server is running."}

@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    contents = await file.read()
    
    # Run Inference
    result = predict_image(contents)
    
    class_name = result.get("class_name", "Unknown")
    confidence = result.get("confidence", 0.0)
    
    # Fetch data mapping
    disease_info = DISEASE_DATA.get(class_name, DISEASE_DATA["Unknown"])
    
    return {
        "success": True,
        "plant_identification": "Detected Plant", # Usually needs a 2-stage model
        "disease_detected": class_name,
        "confidence": confidence,
        "disease_info": disease_info
    }

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)
