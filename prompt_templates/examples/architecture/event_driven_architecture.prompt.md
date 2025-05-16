<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🔄 Event-Driven Architecture Pattern Template

Create a comprehensive diagram showing event-driven system architecture and patterns.

## Requirements

- Event patterns: [pub-sub/event-streaming/CQRS]
- Messaging system: [Kafka/RabbitMQ/Custom]
- Consistency model: [eventual/strong]
- Scale requirements: [low/medium/high]

## Components

Define the following:
1. Event Sources
   - Publishers
   - Event types
   - Generation patterns
   - Source systems

2. Event Processing
   - Consumers
   - Event handlers
   - Processing logic
   - State management

3. Message Infrastructure
   - Message brokers
   - Topics/Queues
   - Partitioning
   - Replication

4. Integration Points
   - External systems
   - APIs
   - Databases
   - Legacy systems

## Styling Guidelines

- Color code by event type
- Show message flow
- Indicate processing stages
- Mark persistence points
- Highlight critical paths

## Expected Output

A detailed Mermaid diagram showing the event-driven architecture.

## Example Format

```mermaid
graph TB
    subgraph Publishers["Event Publishers"]
        direction LR
        P1[User Service]
        P2[Order Service]
        P3[Payment Service]
        P4[Inventory Service]
    end

    subgraph EventBus["Event Infrastructure"]
        direction TB
        subgraph Topics["Message Topics"]
            T1[User Events]
            T2[Order Events]
            T3[Payment Events]
            T4[Inventory Events]
        end
        
        subgraph Processing["Event Processing"]
            EP1[Event Validation]
            EP2[Event Routing]
            EP3[Event Storage]
        end
    end

    subgraph Consumers["Event Consumers"]
        direction TB
        C1[Analytics Service]
        C2[Notification Service]
        C3[Reporting Service]
        C4[Audit Service]
    end

    subgraph Storage["Event Store"]
        direction LR
        ES[(Event Store)]
        SS[(Snapshot Store)]
    end

    P1 --> T1
    P2 --> T2
    P3 --> T3
    P4 --> T4

    T1 & T2 & T3 & T4 --> EP1
    EP1 --> EP2
    EP2 --> EP3
    EP3 --> ES

    EP2 --> C1 & C2 & C3 & C4
    
    classDef publisher fill:#e3f2fd,stroke:#1565c0
    classDef topic fill:#f3e5f5,stroke:#7b1fa2
    classDef process fill:#c8e6c9,stroke:#2e7d32
    classDef consumer fill:#fff3e0,stroke:#ef6c00
    classDef storage fill:#ffcdd2,stroke:#c62828

    class P1,P2,P3,P4 publisher
    class T1,T2,T3,T4 topic
    class EP1,EP2,EP3 process
    class C1,C2,C3,C4 consumer
    class ES,SS storage
```

## Additional Context

1. Event Design
   - Event schema
   - Versioning
   - Compatibility
   - Documentation

2. Processing Patterns
   - Event sourcing
   - CQRS
   - Saga patterns
   - Event replay

3. Reliability
   - Message persistence
   - Error handling
   - Dead letter queues
   - Retry policies

4. Scalability
   - Partitioning
   - Consumer groups
   - Load balancing
   - Back pressure

5. Monitoring
   - Event tracking
   - Performance metrics
   - Error detection
   - Flow visualization
