# Project: Kubernetes Observability & High-Availability Infrastructure

## Overview

In this project, I engineered a production-grade observability and deployment ecosystem on a Kubernetes cluster. The primary goal was to move from manual, reactive management to an automated, "always-on" architecture. By integrating **Argo Rollouts** for zero-downtime deployments and **Prometheus/Grafana** for real-time telemetry, I created a robust environment capable of handling high-traffic spikes while maintaining full operational visibility.

---

## Technical Stack

* **Orchestration:** Kubernetes (Kind)
* **Deployment:** Argo Rollouts (Blue-Green Deployment)
* **Monitoring:** Prometheus, Grafana
* **Automation/Testing:** Shell Scripting, `kubectl`, Helm

---

## What We Achieved

* **Automated Monitoring:** Deployed a full-stack observability suite via Helm, providing deep insights into cluster performance.
* **Zero-Downtime Releases:** Configured Blue-Green deployments to ensure continuous service availability during application updates.
* **Performance Validation:** Conducted rigorous load-testing to stress the cluster, proving the infrastructure’s resilience under concurrent user requests.
* **Infrastructure Troubleshooting:** Successfully debugged inter-service communication and binary execution errors, ensuring system reliability.

---

## Challenge & Solution

**The Challenge:**
During the integration phase, we encountered two significant blockers:

1. **Observability Silos:** Port conflicts prevented the simultaneous monitoring of the application and the metrics stack.
2. **Environment Incompatibility:** Automated load-testing binaries failed due to architecture-specific (ARM/x86) "Exec format" errors in the WSL environment, preventing standardized stress testing.

**The Solution:**

1. **Strategic Port Mapping:** I implemented a port-segregation strategy using `kubectl port-forward`, allowing real-time observability of the application while under active load.
2. **Adaptive Load Testing:** To resolve binary execution issues, I engineered a robust, platform-agnostic shell script using `curl` loops. This ensured the load simulation was reproducible regardless of the underlying OS architecture.
3. **Telemetry Bridge:** Configured Grafana to ingest data via internal cluster service DNS, ensuring low-latency, stable data collection.

---

## Visualizing the Results

### Figure 1: Cluster-wide Resource Utilization & Namespace Health

*This dashboard provides a high-level overview of resource consumption across all system namespaces, demonstrating the ability to monitor the entire infrastructure's health in real-time.*
![GitHub Actions Dashboard](https://github.com/pitalsmith/High_Availability/blob/d95ff17288cca751e33752c35ab4dd6e7a8107e8/src/assets/Monitoring.JPG)


### Figure 2: Granular Network Performance Analysis

*This view drills down into the specific metrics for the `argo-rollouts` namespace. It highlights my ability to isolate and analyze network bandwidth and packet rates, which is critical for debugging latency and traffic issues.*
![GitHub Actions Dashboard](https://github.com/pitalsmith/High_Availability/blob/d95ff17288cca751e33752c35ab4dd6e7a8107e8/src/assets/Namespace%20pod.JPG)


### Figure 3: Stress-testing result under high-concurrency load

*This graph visualizes the impact of the custom-built `curl` load simulation. The clear spikes in transmit bandwidth confirm the successful stress-testing of the cluster and verify that the monitoring system accurately captures real-time performance impacts.*
![GitHub Actions Dashboard](https://github.com/pitalsmith/High_Availability/blob/d95ff17288cca751e33752c35ab4dd6e7a8107e8/src/assets/Monitoring5.JPG)

### Figure 3b: Corresponding CPU Usage spike, confirming that the cluster successfully processed the increased volume of requests.
![GitHub Actions Dashboard](https://github.com/pitalsmith/High_Availability/blob/502a65c5221dbf06b09724ed1bb9dddcbc43787c/src/assets/Monitoring3.JPG)

---

## Importance of the Project

In modern cloud-native environments, visibility is not optional it is a requirement. This project demonstrates the critical shift from "black-box" deployments to proactive system management. By combining High Availability (HA) with deep observability, I have built an architecture where engineers can detect bottlenecks, monitor resource saturation, and perform version rollouts with zero risk to the end-user.

---
*Maintained as part of the [Main Project Repository](https://github.com/pitalsmith/High_Availability.git)*
