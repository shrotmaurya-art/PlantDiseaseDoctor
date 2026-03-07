# Directive: Flutter App SOP

## Goal
Build a premium, high-fidelity UI that aligns with "Organic Precision" philosophy and integrates with the backend API.

## Design Philosophy
- **Colors**: Deep Green (#1B5E20), Leaf Green (#4CAF50), Beige (#F5F5F5).
- **Typography**: Inter / SF Pro aesthetic.
- **Components**: Rounded cards, subtle shadows, glassmorphism overlays.

## Required Tools
- Flutter SDK.
- `camera` package for in-app scanning.
- `image_picker` / `image_cropper` for uploads.
- `http` for backend communication.

## Expected Outputs
- Compiled Android app `app-release.apk`.

## Constraints & Edge Cases
- State management must seamlessly handle "Loading..." states during AI inference.
- UI must remain performant; avoid jank during heavy camera frame processing.
