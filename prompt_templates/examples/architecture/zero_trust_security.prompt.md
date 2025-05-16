<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🔐 Zero Trust Security Architecture Template

Create a comprehensive diagram illustrating a Zero Trust security model for enterprise applications.

## Requirements

1. Security Boundaries
   - Network segmentation
   - Identity perimeter
   - Resource isolation

2. Access Controls
   - Authentication methods
   - Authorization policies
   - Session management

3. Monitoring & Telemetry
   - Logging points
   - Analytics collection
   - Threat detection

4. Data Protection
   - Encryption layers
   - Key management
   - Data classification

## Components

Define the following:

1. Identity & Access
   - Identity providers
   - MFA systems
   - Policy engines
   - Access gateways

2. Network Security
   - Micro-segmentation
   - Traffic inspection
   - VPN/network isolation
   - DDoS protection

3. Resource Protection
   - API gateways
   - Service meshes
   - Workload isolation
   - Secret management

4. Security Operations
   - SIEM integration
   - Audit logging
   - Compliance monitoring
   - Incident response

## Styling Guidelines

- Use clear boundary indicators
- Color code trust zones
- Show security checkpoints
- Mark data classifications
- Indicate encryption points

## Example Format

```mermaid
graph TB
    subgraph Users["User Layer"]
        direction TB
        EMP[Employees]
        CON[Contractors]
        PAR[Partners]
    end

    subgraph Access["Access Layer"]
        direction TB
        subgraph Identity["Identity Services"]
            IDP[Identity Provider]
            MFA[MFA Service]
            RBAC[RBAC Policies]
        end
        
        subgraph Gateway["Security Gateway"]
            WAF[Web Application Firewall]
            APIG[API Gateway]
            PROX[Security Proxy]
        end
    end

    subgraph Resources["Resource Layer"]
        direction TB
        subgraph Apps["Applications"]
            WEB[Web Apps]
            API[API Services]
            FUNC[Functions]
        end

        subgraph Data["Data Services"]
            DB[(Databases)]
            OBJ[(Object Storage)]
            CACHE[(Cache)]
        end
    end

    subgraph Security["Security Services"]
        direction TB
        LOG[Audit Logging]
        MON[Security Monitoring]
        KMS[Key Management]
        SIEM[SIEM Platform]
    end

    %% Access Flows
    EMP & CON & PAR --> IDP
    IDP --> MFA
    MFA --> RBAC
    RBAC --> WAF
    WAF --> APIG
    APIG --> PROX

    %% Resource Access
    PROX --> WEB
    PROX --> API
    PROX --> FUNC

    %% Data Access
    API --> DB
    API --> OBJ
    API --> CACHE

    %% Security Monitoring
    WEB & API & FUNC --> LOG
    DB & OBJ & CACHE --> LOG
    LOG --> MON
    MON --> SIEM

    %% Key Management
    KMS --> DB
    KMS --> OBJ

    classDef users fill:#e3f2fd,stroke:#1565c0
    classDef identity fill:#f3e5f5,stroke:#7b1fa2
    classDef gateway fill:#fce4ec,stroke:#c2185b
    classDef apps fill:#e8f5e9,stroke:#2e7d32
    classDef data fill:#fffde7,stroke:#f9a825
    classDef security fill:#fff3e0,stroke:#ef6c00

    class EMP,CON,PAR users
    class IDP,MFA,RBAC identity
    class WAF,APIG,PROX gateway
    class WEB,API,FUNC apps
    class DB,OBJ,CACHE data
    class LOG,MON,KMS,SIEM security
```

## Additional Context

1. Zero Trust Principles
   - Never trust, always verify
   - Least privilege access
   - Assume breach
   - Explicit trust verification

2. Implementation Guidelines
   - Strong identity foundation
   - Device-based trust conditions
   - Context-based access controls
   - Dynamic policy enforcement

3. Key Features
   - End-to-end encryption
   - Continuous monitoring
   - Automated response
   - Compliance controls

4. Security Layers
   - User identity verification
   - Device security posture
   - Network security controls
   - Application security
   - Data security

5. Best Practices
   - Regular policy reviews
   - Security telemetry
   - Automated remediation
   - Incident response plans
