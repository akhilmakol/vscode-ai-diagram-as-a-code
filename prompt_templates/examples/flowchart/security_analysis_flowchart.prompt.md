<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🔒 Security Analysis Flow Template

Create a comprehensive security analysis diagram showing threat modeling and security controls.

## Requirements

- Analysis scope: [application/infrastructure/organization]
- Security framework: [STRIDE/MITRE ATT&CK/OWASP]
- Risk levels: [low/medium/high/critical]
- Control types: [preventive/detective/corrective]

## Components

Define the following:
1. Threat Vectors
   - Entry points
   - Attack surfaces
   - Vulnerabilities
   - Risk ratings

2. Security Controls
   - Access controls
   - Monitoring systems
   - Incident response
   - Recovery procedures

3. Data Flow
   - Data classification
   - Encryption points
   - Trust boundaries
   - Data handling

4. Compliance Requirements
   - Regulatory controls
   - Audit points
   - Documentation
   - Reporting

## Styling Guidelines

- Color code by risk level
- Show trust boundaries
- Indicate control points
- Mark sensitive data flows
- Highlight critical assets

## Expected Output

A detailed Mermaid diagram showing the security analysis flow.

## Example Format

```mermaid
flowchart TB
    subgraph External["External Zone"]
        direction LR
        U1[Users] --> WAF[Web Application Firewall]
        A1[Attackers] -.->|Threat Vector| WAF
    end

    subgraph DMZ["DMZ"]
        direction TB
        WAF --> LB[Load Balancer]
        IDS[IDS/IPS] --> LB
    end

    subgraph Application["Application Zone"]
        direction TB
        LB --> API[API Gateway]
        API --> AUTH[Authentication]
        AUTH --> APP[Application Server]
        APP --> CACHE[Cache Layer]
    end

    subgraph Database["Database Zone"]
        direction LR
        APP --> FW[Database Firewall]
        FW --> DB[(Encrypted Database)]
        CACHE --> FW
    end

    subgraph Monitoring["Security Monitoring"]
        direction TB
        SIEM[SIEM System]
        LOG[Log Analytics]
        ALERT[Alert System]
    end

    IDS --> SIEM
    APP --> LOG
    DB --> LOG
    LOG --> SIEM
    SIEM --> ALERT

    classDef external fill:#ffcdd2,stroke:#c62828
    classDef dmz fill:#fff9c4,stroke:#f9a825
    classDef internal fill:#c8e6c9,stroke:#2e7d32
    classDef monitoring fill:#e1f5fe,stroke:#0277bd
    classDef database fill:#e8eaf6,stroke:#283593

    class U1,A1 external
    class WAF,IDS dmz
    class API,AUTH,APP internal
    class SIEM,LOG,ALERT monitoring
    class DB,FW database
```

## Additional Context

1. Threat Modeling
   - Attack scenarios
   - Threat actors
   - Impact assessment
   - Likelihood analysis

2. Security Controls
   - Authentication methods
   - Authorization levels
   - Encryption standards
   - Monitoring systems

3. Incident Response
   - Detection methods
   - Response procedures
   - Recovery plans
   - Communication flow

4. Compliance Requirements
   - Regulatory standards
   - Audit requirements
   - Documentation needs
   - Reporting formats

5. Security Testing
   - Penetration testing
   - Vulnerability scanning
   - Security reviews
   - Compliance audits
