<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# ☁️ Cloud Resource Organization Template

Create a comprehensive diagram showing cloud resource organization and relationships.

## Requirements

- Cloud scope: [single region/multi-region/global]
- Resource structure: [production/staging/development]
- Security zones: [public/private/restricted]
- Compliance needs: [standard/high-security/regulated]

## Components

Define the following:
1. Resource Hierarchy
   - Organization structure
   - Project organization
   - Resource groups
   - Resource tags

2. Network Topology
   - VPC/VNET design
   - Subnet organization
   - Peering connections
   - Transit routing

3. Security Architecture
   - IAM structure
   - Security groups
   - Network policies
   - Compliance controls

4. Service Organization
   - Service dependencies
   - API connections
   - Data flows
   - Management services

## Styling Guidelines

- Color code by security zone
- Group by resource type
- Show network connections
- Indicate compliance scope
- Highlight critical resources

## Expected Output

A detailed Mermaid diagram showing the cloud resource organization.

## Example Format

```mermaid
graph TB
    subgraph Organization["Cloud Organization"]
        direction TB
        subgraph Management["Management Layer"]
            IAM[Identity & Access]
            AUDIT[Audit Logging]
            BILLING[Billing Account]
        end
        
        subgraph Production["Production Environment"]
            direction LR
            subgraph ProdNet["Network"]
                PVPC[Production VPC]
                subgraph Public["Public Zone"]
                    PLB[Load Balancer]
                    NAT[NAT Gateway]
                end
                subgraph Private["Private Zone"]
                    PAPP[App Cluster]
                    PDB[(Database)]
                end
                subgraph Restricted["Restricted Zone"]
                    PDATA[Data Lake]
                    PANALYTICS[Analytics]
                end
            end
        end
        
        subgraph Staging["Staging Environment"]
            SVPC[Staging VPC]
            SAPP[Staging Apps]
        end
        
        subgraph SharedServices["Shared Services"]
            MONITOR[Monitoring]
            BACKUP[Backup]
            SECRETS[Secret Manager]
        end
    end
    
    PVPC ---|VPC Peering| SVPC
    PAPP --> PDB
    PAPP --> PDATA
    PLB --> PAPP
    
    PAPP --> MONITOR
    PDB --> BACKUP
    PAPP --> SECRETS
    
    classDef management fill:#e3f2fd,stroke:#1565c0
    classDef production fill:#c8e6c9,stroke:#2e7d32
    classDef staging fill:#fff3e0,stroke:#ef6c00
    classDef shared fill:#f3e5f5,stroke:#7b1fa2
    classDef security fill:#ffcdd2,stroke:#c62828
    
    class IAM,AUDIT,BILLING management
    class PVPC,PAPP,PDB,PDATA,PANALYTICS production
    class SVPC,SAPP staging
    class MONITOR,BACKUP,SECRETS shared
    class PLB,NAT security
```

## Additional Context

1. Resource Management
   - Naming conventions
   - Tagging strategy
   - Cost allocation
   - Resource lifecycle

2. Security Controls
   - Access management
   - Network security
   - Data protection
   - Compliance controls

3. Network Design
   - IP addressing
   - Route tables
   - Security zones
   - Connectivity options

4. Service Dependencies
   - Service accounts
   - API permissions
   - Resource sharing
   - Cross-project access

5. Operational Considerations
   - Monitoring setup
   - Backup strategy
   - Disaster recovery
   - Change management
