# Directive: Backend SOP

## Goal
Host the 129MB `best_model.pth` PyTorch weights safely to serve deterministic inference results to the frontend.

## Inputs
- Uploaded plant images (multipart form-data).

## Required Tools
- FastAPI, Uvicorn (Networking layer)
- PyTorch (Inference layer)
- Pillow (Image preprocessing)

## Expected Outputs
- JSON response containing: `success`, `plant_identification`, `disease_detected`, `confidence`, and `disease_info`.

## Constraints & Edge Cases
- Do NOT run heavy preprocessing on the main event loop.
- Handle bad image uploads gracefully.
- Send default 'Unknown Condition' data if prediction fails.
