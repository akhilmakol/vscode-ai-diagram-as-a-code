<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🔄 GitOps Workflow Template

Create a comprehensive diagram showing GitOps workflow for continuous deployment and infrastructure management.

## Requirements

1. Source Control
   - Application code
   - Infrastructure code
   - Configuration files
   - Deployment manifests

2. Automation Components
   - CI pipeline
   - CD operators
   - State reconciliation
   - Drift detection

3. Environment Management
   - Development
   - Staging
   - Production
   - Disaster recovery

4. Monitoring & Control
   - Deployment status
   - System health
   - Audit logging
   - Rollback procedures

## Components

Define the following:

1. Git Components
   - Application repository
   - Infrastructure repository
   - Environment configs
   - Deployment manifests

2. CI Pipeline Components
   - Build system
   - Test runners
   - Security scanning
   - Artifact registry

3. CD Components
   - GitOps operator
   - Config manager
   - Secret manager
   - State store

4. Platform Components
   - Kubernetes clusters
   - Service mesh
   - Monitoring stack
   - Logging system

## Styling Guidelines

- Group by workflow stage
- Show automation flows
- Indicate sync points
- Mark verification steps
- Highlight security checks

## Example Format

```mermaid
graph TB
    subgraph Source["Source Control"]
        direction TB
        APP[Application Code]
        INFRA[Infrastructure Code]
        CONFIG[Configuration]
        DEPLOY[Deployment Manifests]
    end

    subgraph CI["Continuous Integration"]
        direction TB
        subgraph Build["Build Pipeline"]
            BUILD[Build System]
            TEST[Test Runner]
            SCAN[Security Scanner]
            PKG[Package Registry]
        end
        
        subgraph Verify["Verification"]
            LINT[Linter]
            SEC[Security Check]
            COMP[Compliance Check]
        end
    end

    subgraph CD["Continuous Deployment"]
        direction TB
        subgraph Operator["GitOps Operator"]
            CTRL[Controller]
            RECON[Reconciler]
            DRIFT[Drift Detector]
        end
        
        subgraph Manager["Resource Management"]
            CONFMGR[Config Manager]
            SECMGR[Secret Manager]
            STATE[State Store]
        end
    end

    subgraph Platform["Runtime Platform"]
        direction TB
        DEV[Development]
        STAGE[Staging]
        PROD[Production]
        DR[Disaster Recovery]
    end

    %% Source Control Flows
    APP & INFRA & CONFIG & DEPLOY --> BUILD
    
    %% CI Flows
    BUILD --> TEST
    TEST --> SCAN
    SCAN --> PKG
    
    BUILD & TEST & SCAN --> LINT
    LINT --> SEC
    SEC --> COMP

    %% CD Flows
    PKG & COMP --> CTRL
    CTRL --> RECON
    RECON --> DRIFT
    
    CTRL --> CONFMGR
    CTRL --> SECMGR
    RECON --> STATE

    %% Platform Flows
    CONFMGR --> DEV & STAGE
    SECMGR --> STAGE & PROD
    STATE --> DR

    classDef source fill:#e3f2fd,stroke:#1565c0
    classDef build fill:#f3e5f5,stroke:#7b1fa2
    classDef verify fill:#fce4ec,stroke:#c2185b
    classDef ops fill:#e8f5e9,stroke:#2e7d32
    classDef manage fill:#fff3e0,stroke:#ef6c00
    classDef platform fill:#fffde7,stroke:#f9a825

    class APP,INFRA,CONFIG,DEPLOY source
    class BUILD,TEST,SCAN,PKG build
    class LINT,SEC,COMP verify
    class CTRL,RECON,DRIFT ops
    class CONFMGR,SECMGR,STATE manage
    class DEV,STAGE,PROD,DR platform
```

## Additional Context

1. GitOps Principles
   - Declarative configuration
   - Version controlled
   - Automated operations
   - Continuous reconciliation

2. Implementation Strategy
   - Repository structure
   - Branch strategies
   - Pull request flows
   - Review processes

3. Security Considerations
   - Secrets management
   - Access controls
   - Audit requirements
   - Compliance checks

4. Operational Procedures
   - Deployment strategies
   - Rollback procedures
   - Disaster recovery
   - Incident response

5. Best Practices
   - Infrastructure as code
   - Configuration management
   - Environment parity
   - Monitoring and observability
