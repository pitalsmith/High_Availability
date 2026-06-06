# Blue-Green Deployment Documentation

## Overview
This module demonstrates a high-availability **Blue-Green Deployment** strategy implemented using **Argo Rollouts** on Kubernetes. This approach allows for zero-downtime releases by maintaining two parallel environments:
- **Blue (Stable/Active):** Serves current production traffic.
- **Green (Preview):** Serves as a staging area to validate new releases.

## Architecture
The setup utilizes separate `activeService` and `previewService` objects to ensure that testing the new version never impacts the end-user experience.

## Implementation Highlights

### 1. Rollout Status
The controller manages the lifecycle of the rollout, ensuring that the new version is healthy before any traffic shift occurs.
*(Insert screenshot of `kubectl argo rollouts get rollout my-app-rollout` here)*

### 2. Side-by-Side Validation
Using `kubectl port-forward`, I can verify the "Green" version in a sandbox environment at `localhost:9090` while the "Blue" version continues to run at `localhost:8080`.
*(Insert screenshot of side-by-side browser windows here)*

### 3. Traffic Promotion & Rollback
Promoting a new version or reverting to a previous one is handled via atomic commands, ensuring system stability:
- **Promote:** `kubectl argo rollouts promote my-app-rollout`
- **Rollback:** `kubectl argo rollouts undo my-app-rollout --to-revision=<number>`

## Technical Stack
* **Orchestration:** Kubernetes (`kind`)
* **Deployment Controller:** Argo Rollouts
* **Strategy:** BlueGreen
* **Containerization:** Docker

---
*Maintained as part of the [Main Project Repository](URL_TO_YOUR_MAIN_BRANCH_HERE)*
