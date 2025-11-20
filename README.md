# infra
Infrastructure-as-Code for provisioning the full cloud foundation of the platform.  
This repository contains all infrastructure-as-code for provisioning cloud resources and Kubernetes clusters.
It uses Terraform modules and Terragrunt for environment layering and DRY configuration.

This repository forms the first layer of the everything-as-code platform.

---

## Structure

```
infra/
├── terragrunt.hcl
├── live/
│ ├── dev/
│ │ └── terragrunt.hcl
│ ├── staging/
│ │ └── terragrunt.hcl
│ └── prod/
│ └── terragrunt.hcl
└── modules/
├── network/
├── eks/
├── rds/
└── storage/
```

---

## Goals
- Provision Kubernetes clusters and supporting cloud infrastructure.
- Maintain strict separation of environments.
- Reuse Terraform modules cleanly.
- Provide a reproducible foundation for GitOps workflows.

---

## Workflow

1. Commit changes to `live/<environment>`.
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

## How to Run
```
cd live/dev
terragrunt init
terragrunt plan
terragrunt apply
```

---
## Purpose

This repo maps directly to CKA provisioning competencies and provides the cluster foundation required for
GitOps (ArgoCD) and progressive delivery.
