# 🔄 State Diagram Template Prompts

> *A collection of reusable prompts for creating state diagrams in Mermaid syntax*

---

This file contains reusable prompts for creating state diagrams in Mermaid syntax. Copy these prompts and add them to your VS Code Reusable Prompts collection.

## Basic State Machine

```
Create a Mermaid state diagram showing the states and transitions for [system/object].
Include these states: [list states]. Show all possible transitions between states
and the events that trigger them. Use clear state names and transition labels.
Add notes for any complex state behaviors or entry/exit actions.
```

## Application Lifecycle State Diagram

```
Generate a Mermaid state diagram showing the lifecycle of a [application type]
application. Include states for initialization, normal operation, error handling,
and shutdown. Show transitions between states and what triggers each transition.
Include any nested states or parallel states that operate simultaneously.
```

## User Session State Diagram

```
Create a Mermaid state diagram showing all possible states for a user session in
a [system type] system. Include authentication states, activity states, and timeout
states. Show transitions between states and the events or actions that trigger them.
Include any composite states that may contain nested substates.
```

## Order Processing State Diagram

```
Generate a Mermaid state diagram showing the states of an order in a [business type]
system. Include states from initial order creation through payment, fulfillment,
and completion. Show all possible transitions, including exception paths like
cancellations or returns. Add notes explaining any business rules that govern
state transitions.
```

## Document Workflow State Diagram

```
Create a Mermaid state diagram showing the workflow states for a document in a
[system type] system. Include states for draft, review, approval, published, and
archived. Show transitions between states and who/what can trigger each transition.
Include parallel states for tracking different aspects of the document simultaneously
(e.g., content status and approval status).
```

## IoT Device State Diagram

```
Generate a Mermaid state diagram showing the operational states of an IoT device
for [purpose/function]. Include states for startup, configuration, normal operation,
low-power modes, and error conditions. Show transitions between states and what
triggers each transition. Include any composite states with internal substates.
```

## Error Handling State Diagram

```
Create a Mermaid state diagram focusing on error handling for a [system type]
system. Start with normal operation state, then show transitions to various
error states. Include states for different error severities, retry mechanisms,
and recovery procedures. Show how the system returns to normal operation or
escalates to critical failure. Add notes explaining key error handling strategies.
```

## Feature Flag State Diagram

```
Generate a Mermaid state diagram showing how feature flags affect system behavior
in a [application type]. Show the different states the system can be in based on
feature flag configurations. Include transition conditions that depend on flag
values. Show how multiple feature flags might interact to create composite states.
```

## Game Character State Diagram

```
Create a Mermaid state diagram showing the possible states of a character in
a [game type] game. Include states like idle, moving, attacking, defending,
and special abilities. Show transitions between states and what player inputs
or game events trigger each transition. Include any hierarchical states with
nested substates for complex behaviors.
```

## API Request Handling State Diagram

```
Generate a Mermaid state diagram showing the states of an API request as it
flows through a [system type] system. Include states for validation, authentication,
processing, response generation, and caching. Show transitions between states
and what conditions cause state changes. Add notes explaining performance
considerations or special handling for different request types.
```

## Navigation

- [🏠 Back to Main Page](../README.md)
- **Related Documents:**
  - [Prompt Templates Home](README.md)
  - [AI Diagram Generation Guide](../ai_diagram_generation_guide.md)
