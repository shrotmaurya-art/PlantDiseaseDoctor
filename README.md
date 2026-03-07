# Plant Doctor AI

## Product Overview
Plant Doctor AI is a premium digital experience designed to empower gardeners and farmers with real-time, precise plant health diagnostics. By leverageing a custom-trained PyTorch model (`best_model.pth`), the system identifies diseases from leaf images with high accuracy.

## Design Philosophy
The experience is built on the principle of **"Organic Precision"**. It blends natural aesthetics with high-tech diagnostic clarity to build trust and provide actionable insights.

## Audience Psychology
- **Gardeners**: Seeking reassurance and simple, step-by-step care instructions.
- **Farmers**: Requiring speed, data density, and scalable diagnostic logs.

## Tech Stack
- **Frontend**: Next.js (App Router), TypeScript, Tailwind CSS, Framer Motion.
- **Backend/Execution**: Python (PyTorch) for model inference.
- **Components**: Shadcn UI.
- **Deployment**: Vercel.

## Folder Structure
- `directives/`: Structured SOPs for system operations.
- `execution/`: Deterministic logic modules (Inference scripts, API handlers).
- `skills/`: Reusable logic frameworks for orchestration.
- `src/`: Next.js application source.

## Architecture Explanation (3-Layer Mapping)
1. **Layer 1: Directive (What to Do)**: SOPs for model loading, image preprocessing, and UI state management.
2. **Layer 2: Orchestration (Decision Layer)**: Antigravity AI managing the workflow, tool selection, and state transitions.
3. **Layer 3: Execution (Deterministic Work)**: Pure functions and scripts that perform the actual detection and UI rendering.

## Performance Strategy
- **Lighthouse First**: Zero-bundle-bloat approach.
- **Deterministic Inference**: Optimized Python scripts for sub-500ms response times.
- **Lazy Loading**: Visual assets and model weights loaded only when necessary.
