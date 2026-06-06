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
![kubectl argo rollouts](https://github.com/pitalsmith/High_Availability/blob/0d8ea22c9b1d13efc8325df49ac3990779f4dc9a/src/assets/Agro_Rollout_1.jpg)

### 2. Side-by-Side Validation
Using `kubectl port-forward`, I can verify the "Green" version in a sandbox environment at `localhost:9090` while the "Blue" version continues to run at `localhost:8080`.
![kubectl port-forward](https://github.com/pitalsmith/High_Availability/blob/0d8ea22c9b1d13efc8325df49ac3990779f4dc9a/src/assets/port_forwarding_2.jpg)
![Browser Output](https://github.com/pitalsmith/High_Availability/blob/0d8ea22c9b1d13efc8325df49ac3990779f4dc9a/src/assets/Blue-Green_3.JPG)

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
*Maintained as part of the [Main Project Repository](https://github.com/pitalsmith/High_Availability.git)*
