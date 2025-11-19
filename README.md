# infra
Infrastructure-as-Code for provisioning the full cloud foundation of the platform.  
This repository contains Terraform modules and environment configurations used to create:

- VPC and networking (subnets, routing, NAT, gateways)
- Kubernetes cluster (EKS or GKE)
- Node groups (spot and on-demand)
- IAM roles and policies (including IRSA)
- Container registry
- Database instances (optional)
- Remote state backend (S3/GCS + DynamoDB/locking)
- ArgoCD bootstrap bucket (optional)

This repository forms the first layer of the everything-as-code platform.

---

## Structure

```
infra/
  modules/
    vpc/
    eks/
    iam/
    rds/
    ecr/
  envs/
    dev/
    staging/
    prod/
  scripts/
    generate-inventory.sh
    extract-kubeconfig.sh
  ci/
    terraform-plan.yml
    terraform-apply.yml
```

---

## Workflow

1. Commit changes to `envs/<environment>`.
2. GitHub Actions runs `terraform plan`.
3. On approval, `terraform apply` is executed.
4. Outputs generate kubeconfig and IAM bindings for GitOps bootstrap.

---

## Prerequisites

- Terraform >= 1.5
- AWS CLI or GCloud CLI
- Remote state backend configured
- kubectl installed for validation

---

## Purpose

This repo maps directly to CKA provisioning competencies and provides the cluster foundation required for GitOps (ArgoCD) and progressive delivery.
