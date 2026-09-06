# SRE Chaos Engineering Lab Architecture

## Components

- Kind Kubernetes cluster
- NGINX workload
- Prometheus
- Grafana
- Alertmanager
- Loki
- Chaos experiments

## Flow

User
  |
  v
NGINX
  |
  v
Prometheus
  |
  v
Grafana / Alertmanager

Logs
  |
  v
Loki

Chaos
  |
  v
Kubernetes workload
  |
  v
Failure detection
  |
  v
Alert
  |
  v
Recovery
