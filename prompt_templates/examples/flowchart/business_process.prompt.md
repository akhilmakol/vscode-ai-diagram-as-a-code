<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🏢 Business Process Modeling Template

Create a comprehensive diagram modeling business processes, workflows, and decision points.

## Requirements

1. Process Components
   - Activities
   - Decisions
   - Events
   - Gateways

2. Process Flow
   - Sequence flows
   - Message flows
   - Event triggers
   - Exception paths

3. Process Actors
   - Roles
   - Systems
   - Departments
   - External entities

4. Process Metrics
   - KPIs
   - SLAs
   - Measurements
   - Outcomes

## Components

Define the following:

1. Core Elements
   - Start/end events
   - Activities/tasks
   - Decision points
   - Process paths

2. Supporting Elements
   - Documentation
   - Resources
   - Systems
   - Data stores

3. Control Elements
   - Business rules
   - Validations
   - Approvals
   - Notifications

4. Monitoring Elements
   - Performance metrics
   - Quality checks
   - Status tracking
   - Results capture

## Styling Guidelines

- Group by process phase
- Show actor swimlanes
- Indicate decision points
- Mark critical paths
- Highlight exceptions

## Example Format

```mermaid
graph TB
    subgraph Initiation["Process Initiation"]
        direction TB
        START[Start Event]
        REQ[Receive Request]
        VAL[Initial Validation]
        ROUTE{Route Request}
    end

    subgraph Processing["Request Processing"]
        direction TB
        subgraph AutoProcess["Automated Processing"]
            AUTO[Automated Checks]
            RULES[Apply Business Rules]
            CALC[Calculate Results]
        end
        
        subgraph ManualProcess["Manual Processing"]
            REVIEW[Manual Review]
            APPROVE[Approval Process]
            UPDATE[Update Records]
        end
    end

    subgraph Completion["Process Completion"]
        direction TB
        subgraph Notification["Notifications"]
            NOTIFY[Send Notification]
            CONF[Generate Confirmation]
        end
        
        subgraph Recording["Record Keeping"]
            LOG[Update Logs]
            METRICS[Record Metrics]
            AUDIT[Audit Trail]
        end
    end

    subgraph Exception["Exception Handling"]
        direction TB
        ERR{Error Detected}
        RETRY[Retry Process]
        ESCALATE[Escalate Issue]
        MANUAL[Manual Intervention]
    end

    %% Main Flow
    START --> REQ
    REQ --> VAL
    VAL --> ROUTE
    
    %% Normal Processing
    ROUTE -->|Automated| AUTO
    ROUTE -->|Manual| REVIEW
    
    AUTO --> RULES
    RULES --> CALC
    
    REVIEW --> APPROVE
    APPROVE --> UPDATE

    %% Completion Flow
    CALC & UPDATE --> NOTIFY
    NOTIFY --> CONF
    CONF --> LOG
    LOG --> METRICS
    METRICS --> AUDIT

    %% Exception Flow
    VAL & AUTO & REVIEW -->|Error| ERR
    ERR -->|Retry| RETRY
    ERR -->|Escalate| ESCALATE
    ERR -->|Manual| MANUAL
    RETRY & ESCALATE & MANUAL --> VAL

    classDef init fill:#e3f2fd,stroke:#1565c0
    classDef auto fill:#f3e5f5,stroke:#7b1fa2
    classDef manual fill:#fce4ec,stroke:#c2185b
    classDef notify fill:#e8f5e9,stroke:#2e7d32
    classDef record fill:#fff3e0,stroke:#ef6c00
    classDef error fill:#ffebee,stroke:#c62828

    class START,REQ,VAL,ROUTE init
    class AUTO,RULES,CALC auto
    class REVIEW,APPROVE,UPDATE manual
    class NOTIFY,CONF notify
    class LOG,METRICS,AUDIT record
    class ERR,RETRY,ESCALATE,MANUAL error
```

## Additional Context

1. Process Design
   - Process objectives
   - Process scope
   - Process boundaries
   - Process interfaces

2. Performance Measures
   - Process efficiency
   - Process quality
   - Process compliance
   - Process outcomes

3. Process Integration
   - System integration
   - Data integration
   - Role integration
   - External integration

4. Process Documentation
   - Process maps
   - Work instructions
   - Role descriptions
   - Training materials

5. Best Practices
   - Process optimization
   - Exception handling
   - Change management
   - Continuous improvement
