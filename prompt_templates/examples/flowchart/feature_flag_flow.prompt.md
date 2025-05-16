<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🚩 Feature Flag Implementation Flow Template

Create a comprehensive diagram showing feature flag management and implementation flow.

## Requirements

- Flag scope: [UI/backend/full-stack]
- Environment: [development/staging/production]
- Target type: [user/account/percentage]
- Evaluation: [simple/rule-based/complex]

## Components

Define the following:
1. Flag Management
   - Flag definition
   - Configuration
   - Targeting rules
   - Override settings

2. Implementation Flow
   - Code integration
   - Rule evaluation
   - Default behavior
   - Fallback handling

3. Monitoring System
   - Usage tracking
   - Performance impact
   - Error logging
   - Analytics data

4. Administration
   - Access control
   - Audit logging
   - Change management
   - Flag cleanup

## Styling Guidelines

- Color code by flag state
- Show evaluation flow
- Indicate decision points
- Mark monitoring points
- Highlight critical paths

## Expected Output

A detailed Mermaid diagram showing the feature flag implementation.

## Example Format

```mermaid
graph TB
    subgraph Management["Flag Management"]
        direction TB
        CREATE[Create Flag]
        CONFIG[Configure Rules]
        TARGET[Set Targeting]
        DEFAULT[Define Defaults]
    end

    subgraph Implementation["Implementation Flow"]
        direction TB
        subgraph Code["Code Integration"]
            CHECK[Check Flag]
            EVAL{Evaluate Rules}
            SERVE[Serve Feature]
            FALL[Fallback Logic]
        end
        
        subgraph Cache["Cache Layer"]
            STORE[Flag Store]
            UPDATE[Update Cache]
        end
    end

    subgraph Monitoring["Monitoring & Analytics"]
        direction TB
        TRACK[Track Usage]
        ANALYZE[Analyze Impact]
        ALERT[Alert System]
    end

    subgraph Admin["Administration"]
        direction TB
        AUDIT[Audit Log]
        CONTROL[Access Control]
        CLEAN[Cleanup Jobs]
    end

    %% Management Flow
    CREATE --> CONFIG
    CONFIG --> TARGET
    TARGET --> DEFAULT
    DEFAULT --> STORE
    
    %% Implementation Flow
    CHECK --> STORE
    STORE --> EVAL
    EVAL -->|Enabled| SERVE
    EVAL -->|Disabled| FALL
    
    %% Monitoring Flow
    SERVE & FALL --> TRACK
    TRACK --> ANALYZE
    ANALYZE --> ALERT
    
    %% Administration
    CONFIG & TARGET --> AUDIT
    AUDIT --> CONTROL
    ANALYZE --> CLEAN

    classDef management fill:#e3f2fd,stroke:#1565c0
    classDef implement fill:#c8e6c9,stroke:#2e7d32
    classDef monitor fill:#fff3e0,stroke:#ef6c00
    classDef admin fill:#f3e5f5,stroke:#7b1fa2

    class CREATE,CONFIG,TARGET,DEFAULT management
    class CHECK,EVAL,SERVE,FALL,STORE,UPDATE implement
    class TRACK,ANALYZE,ALERT monitor
    class AUDIT,CONTROL,CLEAN admin
```

## Additional Context

1. Flag Design
   - Naming conventions
   - Flag types
   - Default values
   - Cleanup strategy

2. Implementation Details
   - SDK integration
   - Caching strategy
   - Performance impact
   - Error handling

3. Monitoring Setup
   - Usage metrics
   - Performance tracking
   - Error reporting
   - Impact analysis

4. Administration
   - Access levels
   - Audit requirements
   - Change tracking
   - Cleanup process

5. Best Practices
   - Testing strategy
   - Gradual rollout
   - Emergency switches
   - Documentation
