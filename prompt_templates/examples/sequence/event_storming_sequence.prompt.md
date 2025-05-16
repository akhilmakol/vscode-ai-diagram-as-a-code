<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🔄 Event Storming Sequence Template

Create a sequence diagram for event-driven architecture analysis using event storming methodology.

## Requirements

- Domain scope: [bounded context/full domain]
- Event types: [domain/integration/system]
- Time scope: [single transaction/complete flow]
- Actor types: [user/system/external]

## Components

Define the following:
1. Domain Events
   - Event names
   - Triggering conditions
   - Data payload
2. Commands
   - Command handlers
   - Validation rules
   - Business logic
3. Aggregates
   - State changes
   - Invariants
   - Business rules
4. External Systems
   - Integration points
   - Contracts
   - Failures

## Styling Guidelines

- Color code by event type
- Use clear event naming
- Show causality chains
- Indicate parallel processing
- Mark aggregate boundaries

## Expected Output

A complete Mermaid sequence diagram showing the event flow.

## Example Format

```mermaid
sequenceDiagram
    participant U as User
    participant C as Command Handler
    participant A as Aggregate
    participant E as Event Store
    participant S as Subscription Service
    
    Note over U,S: Order Creation Flow
    
    U->>+C: CreateOrder Command
    
    C->>C: Validate Order
    
    C->>+A: Create Order Aggregate
    A->>A: Apply Business Rules
    A->>-C: Order Created
    
    C->>+E: Store OrderCreated Event
    E-->>-C: Event Stored
    
    C-->>-U: Command Accepted
    
    E->>+S: Publish OrderCreated
    
    par Parallel Processing
        S->>S: Update Inventory
        S->>S: Send Confirmation
        S->>S: Update Analytics
    end
    
    S-->>-E: Processing Complete
```

## Additional Context

- Include compensation flows
- Note event versioning
- Document retry policies
- Specify consistency boundaries
- List business constraints
- Include timing requirements
- Document error scenarios
