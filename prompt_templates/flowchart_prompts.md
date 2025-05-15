# Flowchart Diagram Template Prompts

This file contains reusable prompts for creating flowchart diagrams in Mermaid syntax. Copy these prompts and add them to your VS Code Reusable Prompts collection.

## Basic Process Flowchart

```
Create a Mermaid flowchart diagram for the following process: [describe your process]. 
Include the following steps: [list key steps]. 
The flow should start from [starting point] and end at [ending point].
Use TD (top-down) orientation and include decision points where appropriate.
Apply this styling:
- Process boxes: fill:#f5f5f5,stroke:#333
- Decision diamonds: fill:#fff3cd,stroke:#ffc107
- Start/End points: fill:#d4edda,stroke:#28a745
```

## System Workflow Flowchart

```
Generate a Mermaid flowchart showing the workflow between these system components: 
[list components]. Show the data/control flow from [entry point] through the system
to [exit point]. Include error handling paths and use subgraphs to group related 
components. Use LR (left-right) orientation for better readability.
```

## Decision Tree Flowchart

```
Create a Mermaid decision tree flowchart for [scenario]. 
Start with [initial state] and include these decision points: [list decision points]. 
For each decision, show the possible outcomes and resulting paths. 
Use diamonds for decisions and rectangles for outcomes or states.
```

## Application Navigation Flowchart

```
Generate a Mermaid flowchart showing the navigation flow of [application name].
Start at the [entry page/screen] and show paths to all major screens/pages including:
[list key screens]. Use one-way arrows for direct navigation and two-way arrows
where users can navigate back and forth. Group screens by functional area using subgraphs.
```

## Data Processing Pipeline Flowchart

```
Create a Mermaid flowchart diagram of a data processing pipeline with these stages:
[list pipeline stages]. Show data transformations between each stage and include
any validation or error handling steps. Use different node shapes to represent:
- Data sources/sinks (cylinders)
- Processing steps (rectangles)
- Validation/decisions (diamonds)
```

## State Transition Flowchart

```
Generate a Mermaid flowchart showing the state transitions for [object/system].
Include these states: [list states]. Show the events or conditions that trigger
transitions between states. Use different colors to indicate:
- Normal operation states
- Error or exception states
- Terminal states
```

## Customer Journey Flowchart

```
Create a Mermaid flowchart showing a customer journey for [product/service].
Start with [entry point] and follow through to [end goal]. Include:
- Customer actions (what the customer does)
- Touchpoints (where interaction occurs)
- Pain points and moments of delight
- Decision points where the customer might abandon the journey
Use subgraphs to organize the journey into phases.
```

## Conditional Flowchart

```
Generate a Mermaid flowchart with multiple conditional paths for [process name].
The process should start with [starting point] and include these conditions:
[list conditions]. For each condition, show the different execution paths and
where they merge back to the main flow, if applicable. Include annotations
explaining complex decision logic.
```

## Multi-Layer Process Flowchart

```
Create a Mermaid flowchart showing [process name] with clear separation between
these layers: [list layers, e.g., "User Interface", "Business Logic", "Data Access"].
Show how control and data flow between components in different layers.
Use subgraphs to represent each layer and maintain a consistent flow direction.
```

## Error Handling Flowchart

```
Generate a Mermaid flowchart focusing on error handling for [system/process].
Start with the normal flow path, then show:
- Potential error points
- Error detection mechanisms
- Recovery/fallback paths
- User notifications
Use different colors to distinguish normal flow from error handling paths.
```

## Navigation

- [🏠 Back to Main Page](../README.md)
- **Related Documents:**
  - [Prompt Templates Home](README.md)
  - [Flowchart Example](../flowchart_example.md)
  - [AI Diagram Generation Guide](../ai_diagram_generation_guide.md)
