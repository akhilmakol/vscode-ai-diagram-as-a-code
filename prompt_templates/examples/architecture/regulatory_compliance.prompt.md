<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 📋 Regulatory Compliance Mapping Template

Create a comprehensive diagram mapping system components to regulatory requirements and controls.

## Requirements

1. Compliance Frameworks
   - Regulatory standards
   - Industry requirements
   - Internal policies
   - Audit controls

2. System Components
   - Data processing
   - Security controls
   - Access management
   - Audit logging

3. Risk Management
   - Risk assessment
   - Control mapping
   - Gap analysis
   - Remediation plans

4. Documentation
   - Policy documents
   - Procedures
   - Evidence collection
   - Audit trails

## Components

Define the following:

1. Regulatory Requirements
   - Standards (e.g., GDPR, HIPAA)
   - Controls & objectives
   - Compliance criteria
   - Reporting requirements

2. System Controls
   - Technical controls
   - Administrative controls
   - Physical controls
   - Compensating controls

3. Monitoring Systems
   - Compliance monitoring
   - Control effectiveness
   - Policy enforcement
   - Violation detection

4. Reporting Systems
   - Compliance reports
   - Audit evidence
   - Status dashboards
   - Risk registers

## Styling Guidelines

- Group by requirement domain
- Show control mappings
- Indicate control status
- Mark audit points
- Highlight gaps

## Example Format

```mermaid
graph TB
    subgraph Regulations["Regulatory Requirements"]
        direction TB
        subgraph DataPrivacy["Data Privacy"]
            GDPR[GDPR Requirements]
            CCPA[CCPA Requirements]
            HIPAA[HIPAA Requirements]
        end
        
        subgraph Security["Security Standards"]
            SOC2[SOC2 Controls]
            ISO[ISO 27001]
            PCI[PCI DSS]
        end
    end

    subgraph Controls["System Controls"]
        direction TB
        subgraph Technical["Technical Controls"]
            ACCESS[Access Control]
            CRYPTO[Encryption]
            AUDIT[Audit Logging]
        end
        
        subgraph Process["Process Controls"]
            POLICY[Policies]
            PROC[Procedures]
            TRAIN[Training]
        end
    end

    subgraph Implementation["Control Implementation"]
        direction TB
        subgraph DataControls["Data Protection"]
            MASK[Data Masking]
            ENC[Encryption Service]
            DLP[Data Loss Prevention]
        end
        
        subgraph MonitorControls["Monitoring"]
            SIEM[SIEM System]
            ALERT[Alert System]
            REPORT[Reporting System]
        end
    end

    subgraph Evidence["Compliance Evidence"]
        direction TB
        LOGS[System Logs]
        DOCS[Documentation]
        METRICS[Metrics]
        REVIEW[Reviews]
    end

    %% Regulation Mappings
    GDPR --> ACCESS
    GDPR --> CRYPTO
    HIPAA --> CRYPTO
    HIPAA --> AUDIT
    SOC2 --> ACCESS
    SOC2 --> AUDIT
    PCI --> CRYPTO
    
    %% Control Implementation
    ACCESS --> MASK
    CRYPTO --> ENC
    AUDIT --> SIEM
    
    POLICY --> DLP
    PROC --> ALERT
    TRAIN --> REPORT

    %% Evidence Collection
    SIEM --> LOGS
    DLP --> DOCS
    ALERT --> METRICS
    REPORT --> REVIEW

    classDef regs fill:#e3f2fd,stroke:#1565c0
    classDef controls fill:#f3e5f5,stroke:#7b1fa2
    classDef impl fill:#e8f5e9,stroke:#2e7d32
    classDef evidence fill:#fff3e0,stroke:#ef6c00

    class GDPR,CCPA,HIPAA,SOC2,ISO,PCI regs
    class ACCESS,CRYPTO,AUDIT,POLICY,PROC,TRAIN controls
    class MASK,ENC,DLP,SIEM,ALERT,REPORT impl
    class LOGS,DOCS,METRICS,REVIEW evidence
```

## Additional Context

1. Compliance Strategy
   - Framework selection
   - Control design
   - Implementation planning
   - Continuous monitoring

2. Documentation Requirements
   - Policy documentation
   - Procedure manuals
   - Evidence collection
   - Audit preparation

3. Risk Assessment
   - Risk identification
   - Impact analysis
   - Control effectiveness
   - Gap remediation

4. Monitoring Program
   - Control testing
   - Compliance scanning
   - Policy enforcement
   - Incident response

5. Best Practices
   - Control automation
   - Evidence collection
   - Documentation updates
   - Staff training
