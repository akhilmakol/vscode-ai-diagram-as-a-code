# 🔄 Sequence Diagram Template Prompts

> *A collection of reusable prompts for creating sequence diagrams in Mermaid syntax*

---

This file contains reusable prompts for creating sequence diagrams in Mermaid syntax. Copy these prompts and add them to your VS Code Reusable Prompts collection.

## Basic Interaction Sequence

```
Create a Mermaid sequence diagram showing the interaction between these components:
[list participants/actors]. The sequence starts with [initiating action] and should
include all message exchanges until [ending condition]. Use solid arrows for
synchronous calls and dotted arrows for responses or asynchronous messages.
```

## Authentication Flow Sequence

```
Generate a Mermaid sequence diagram showing the authentication flow between:
[user/client] and these system components: [list authentication components].
Include the complete sequence from login attempt through verification, token
generation, and successful authentication or rejection. Add notes to explain
security-related steps.
```

## API Request Handling Sequence

```
Create a Mermaid sequence diagram showing how an API request is handled from
[client] through [list system components] to the data layer and back. Include:
- Request validation
- Authentication/authorization checks
- Business logic processing
- Database interactions
- Response formation
Use activation boxes to show when each component is active in the process.
```

## Error Handling Sequence

```
Generate a Mermaid sequence diagram showing how errors are handled in [process name].
Start with the normal flow, then show what happens when [error condition] occurs.
Include error detection, logging, retry mechanisms, fallback procedures, and 
user/system notifications. Use alt/else blocks to show the different paths for
success and failure scenarios.
```

## Microservices Interaction Sequence

```
Create a Mermaid sequence diagram showing the interactions between these microservices:
[list microservices] during the [process name] operation. Include the API Gateway,
service discovery, and any message brokers. Show both synchronous API calls and
asynchronous event publishing/consumption. Add notes explaining key design decisions.
```

## User-System Interaction Sequence

```
Generate a Mermaid sequence diagram showing interactions between a user and
[system name] during the [task name] workflow. Include all user actions,
system responses, and backend processes triggered by each action. Use notes
to explain what the user sees at each step of the process.
```

## Parallel Processing Sequence

```
Create a Mermaid sequence diagram showing parallel processing in [system/process].
Start with [initiating event], then show how processing splits into parallel 
tracks for [list parallel operations], and finally how results are combined.
Use the par/and/end notation to clearly show parallel execution paths.
```

## Transaction Sequence

```
Generate a Mermaid sequence diagram showing the transaction flow for [transaction type]
in [system name]. Include all participants from the initiator through processing
services to datastores. Show the complete sequence including:
- Transaction initiation
- Validation steps
- Processing stages
- Commit/rollback mechanisms
- Confirmation messages
Add notes explaining transaction boundaries and integrity checks.
```

## Authentication and Authorization Sequence

```
Create a Mermaid sequence diagram showing both authentication and authorization
for [system name]. Include these participants: [list participants]. Show the 
flow from initial authentication through token issuance, resource request,
permission checking, and access control decisions. Use notes to explain how
different security aspects are addressed.
```

## System Startup Sequence

```
Generate a Mermaid sequence diagram showing the startup sequence for [system name].
Include all components that initialize during startup and their dependencies.
Show the complete sequence from system trigger through component initialization,
configuration loading, connection establishment, and readiness signaling.
Use activation boxes to show initialization time for each component.
```

## Navigation

- [🏠 Back to Main Page](../README.md)
- **Related Documents:**
  - [Prompt Templates Home](README.md)
  - [Sequence Diagram Example](../sequence_diagram_example.md)
  - [AI Diagram Generation Guide](../ai_diagram_generation_guide.md)
