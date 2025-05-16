<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🚀 Deployment Strategy Patterns Template

Create a comprehensive diagram showing different deployment strategies and patterns.

## Requirements

- Strategy type: [rolling/blue-green/canary]
- Environment: [cloud/on-premise/hybrid]
- Scale: [small/medium/large]
- Risk level: [low/medium/high]

## Components

Define the following:
1. Deployment Types
   - Strategy patterns
   - Traffic routing
   - Version management
   - Rollback procedures

2. Infrastructure Setup
   - Load balancers
   - Service discovery
   - Health checks
   - Monitoring points

3. Release Process
   - Version control
   - Build pipeline
   - Testing stages
   - Approval gates

4. Validation Steps
   - Health checks
   - Smoke tests
   - Performance tests
   - User acceptance

## Styling Guidelines

- Color code by deployment stage
- Show traffic routing
- Indicate health status
- Mark verification points
- Highlight rollback paths

## Expected Output

A detailed Mermaid diagram showing deployment strategies.

## Example Format

```mermaid
graph TB
    subgraph Current["Current Version"]
        direction TB
        V1[Version 1.0]
        LB1[Load Balancer]
        HC1[Health Check]
    end

    subgraph Deployment["Deployment Process"]
        direction TB
        subgraph Strategy["Strategy Selection"]
            direction LR
            ROLL[Rolling Update]
            BG[Blue-Green]
            CAN[Canary]
        end
        
        subgraph Validation["Validation Steps"]
            TEST1[Smoke Tests]
            TEST2[Integration Tests]
            TEST3[Load Tests]
        end
    end

    subgraph New["New Version"]
        direction TB
        V2[Version 2.0]
        LB2[Load Balancer]
        HC2[Health Check]
    end

    subgraph Rollback["Rollback Plan"]
        RB1[Restore Config]
        RB2[Switch Traffic]
        RB3[Health Verify]
    end

    %% Deployment Flows
    ROLL --> TEST1
    BG --> TEST1
    CAN --> TEST1
    
    TEST1 --> TEST2 --> TEST3
    
    TEST3 -->|Pass| V2
    TEST3 -->|Fail| RB1
    
    V2 --> HC2
    HC2 -->|Healthy| LB2
    HC2 -->|Unhealthy| RB1
    
    RB1 --> RB2 --> RB3
    RB3 --> V1

    classDef current fill:#c8e6c9,stroke:#2e7d32
    classDef deploy fill:#e3f2fd,stroke:#1565c0
    classDef new fill:#fff3e0,stroke:#ef6c00
    classDef rollback fill:#ffcdd2,stroke:#c62828
    
    class V1,LB1,HC1 current
    class ROLL,BG,CAN,TEST1,TEST2,TEST3 deploy
    class V2,LB2,HC2 new
    class RB1,RB2,RB3 rollback
```

## Additional Context

1. Strategy Selection
   - Risk assessment
   - Downtime requirements
   - Resource needs
   - Rollback capability

2. Validation Requirements
   - Testing strategy
   - Success criteria
   - Performance baselines
   - Monitoring setup

3. Rollback Planning
   - Trigger conditions
   - Data handling
   - State management
   - Communication plan

4. Infrastructure Setup
   - Load balancing
   - Service discovery
   - Health monitoring
   - Traffic routing

5. Operational Considerations
   - Monitoring strategy
   - Alert configuration
   - Documentation needs
   - Team coordination
