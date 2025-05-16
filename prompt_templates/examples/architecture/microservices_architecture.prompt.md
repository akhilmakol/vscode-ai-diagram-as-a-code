<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🏗️ Microservices Architecture Template

Create a detailed architecture diagram for microservices-based systems.

## Requirements

- System scope: [bounded context/full system]
- Service types: [sync/async/hybrid]
- Communication patterns: [REST/Event-driven/gRPC]
- Deployment environment: [cloud/hybrid/on-premise]

## Components

Define the following:
1. Microservices
   - Service name and purpose
   - Technologies used
   - Data store types
2. Communication Patterns
   - Synchronous calls
   - Message queues
   - Event buses
3. External Systems
   - Third-party services
   - Legacy systems
4. Infrastructure
   - Load balancers
   - API gateways
   - Service discovery

## Styling Guidelines

- Color code by service domain
- Use distinct shapes for different component types
- Show communication protocols
- Group related services
- Indicate scalability points

## Expected Output

A complete Mermaid architecture diagram showing the microservices ecosystem.

## Example Format

```mermaid
graph TB
    subgraph Frontend
        UI[Web UI]
        Mobile[Mobile App]
    end

    subgraph Gateway
        API[API Gateway]
        Auth[Auth Service]
    end

    subgraph Core Services
        User[User Service]
        Order[Order Service]
        Payment[Payment Service]
    end

    subgraph Message Bus
        Queue[(Message Queue)]
        Events[(Event Bus)]
    end

    subgraph Data Layer
        UserDB[(User DB)]
        OrderDB[(Order DB)]
        Cache[(Redis Cache)]
    end

    UI & Mobile --> API
    API --> Auth
    API --> User & Order & Payment
    User --> UserDB
    Order --> OrderDB
    Order --> Queue
    Payment --> Events
    User & Order --> Cache

    classDef service fill:#68a0cf,stroke:#333,stroke-width:2px
    classDef database fill:#f9d771,stroke:#333,stroke-width:2px
    classDef gateway fill:#f15b2a,stroke:#333,stroke-width:2px
    classDef message fill:#c7d7e8,stroke:#333,stroke-width:2px

    class User,Order,Payment service
    class UserDB,OrderDB,Cache database
    class API,Auth gateway
    class Queue,Events message
```

## Additional Context

- Include scaling indicators
- Note security boundaries
- Show data consistency patterns
- Indicate monitoring points
- Document failover paths
- Specify SLA requirements
