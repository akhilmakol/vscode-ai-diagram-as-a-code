<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# ☁️ Infrastructure as Code Architecture Template

Create a comprehensive IaC architecture diagram showing cloud resources and their relationships.

## Requirements

- Cloud provider: [AWS/Azure/GCP/Multi-cloud]
- Environment type: [production/staging/development]
- Resource scope: [single service/full stack]
- Management tools: [Terraform/CloudFormation/Pulumi]

## Components

Define the following:
1. Network Architecture
   - VPC/VNET structure
   - Subnet organization
   - Security groups
   - Network ACLs

2. Compute Resources
   - Instance types
   - Auto-scaling groups
   - Container services
   - Serverless functions

3. Storage Solutions
   - Object storage
   - Block storage
   - File systems
   - Database instances

4. Management & Monitoring
   - Logging setup
   - Monitoring tools
   - Backup systems
   - Access control

## Styling Guidelines

- Color code by resource type
- Group by network segments
- Show data flow directions
- Indicate high availability
- Mark managed services

## Expected Output

A detailed Mermaid infrastructure diagram.

## Example Format

```mermaid
graph TB
    subgraph Network["VPC/Network"]
        direction TB
        subgraph Public["Public Subnets"]
            ALB[Application Load Balancer]
            NAT[NAT Gateway]
            BAST[Bastion Host]
        end
        
        subgraph Private["Private Subnets"]
            direction TB
            subgraph App["Application Layer"]
                ECS[Container Service]
                LAMBDA[Serverless Functions]
            end
            
            subgraph Data["Data Layer"]
                RDS[(Database)]
                CACHE[(Cache)]
                S3[Object Storage]
            end
        end
    end
    
    subgraph Management["Management & Monitoring"]
        LOGS[Log Storage]
        METRICS[Metrics]
        ALERTS[Alerts]
    end
    
    Internet((Internet)) --> ALB
    ALB --> ECS
    ALB --> LAMBDA
    ECS --> RDS
    ECS --> CACHE
    LAMBDA --> S3
    
    ECS --> LOGS
    RDS --> LOGS
    LOGS --> METRICS
    METRICS --> ALERTS
    
    classDef network fill:#e3f2fd,stroke:#1565c0
    classDef compute fill:#f3e5f5,stroke:#7b1fa2
    classDef storage fill:#e8f5e9,stroke:#2e7d32
    classDef management fill:#fff3e0,stroke:#ef6c00
    
    class ALB,NAT,BAST network
    class ECS,LAMBDA compute
    class RDS,CACHE,S3 storage
    class LOGS,METRICS,ALERTS management
```

## Additional Context

1. Resource Management
   - Provisioning workflows
   - State management
   - Version control
   - Change tracking

2. Security Considerations
   - IAM configurations
   - Security groups
   - Key management
   - Compliance requirements

3. High Availability
   - Multi-AZ setup
   - Failover configurations
   - Backup strategies
   - Disaster recovery

4. Cost Optimization
   - Resource sizing
   - Auto-scaling policies
   - Reserved instances
   - Spot instances

5. Operations
   - Deployment strategies
   - Monitoring setup
   - Alerting configuration
   - Maintenance windows
