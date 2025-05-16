# 🧊 Block Diagram Prompts

> *A collection of prompts for generating block diagrams using Mermaid in VS Code*

## Basic Block Diagram Prompt

```prompt
Create a block diagram that shows [describe your system components]. Use clear labels and appropriate block shapes to represent different types of components. Use arrows to show relationships between components.

Requirements:
- Use appropriate block shapes (rectangle, circle, database cylinder, etc.)
- Show clear directional flow with arrows
- Include meaningful labels
- Use consistent styling for similar components
- Add brief descriptions on connecting arrows where needed

Additional context:
[Add any specific details about the system or requirements]
```

## System Architecture Block Diagram

```prompt
Generate a system architecture block diagram showing the interaction between [list main system components]. Include both front-end and back-end components, data stores, and external services.

Requirements:
- Use distinct shapes for different component types:
  - Cylinders for databases
  - Rectangles for services/applications
  - Circles for external interfaces
- Show data/process flow with labeled arrows
- Group related components using nested blocks
- Add appropriate styling to distinguish component types

System details:
[Describe your system's architecture and components]
```

## Process Flow Block Diagram

```prompt
Create a process flow block diagram that illustrates [describe your process]. Show the sequence of steps, decision points, and parallel processes if any.

Requirements:
- Use appropriate block shapes:
  - Rectangles for process steps
  - Diamonds for decision points
  - Rounded rectangles for start/end points
- Show clear flow direction with arrows
- Include condition labels on decision paths
- Group related steps in nested blocks where applicable

Process details:
[Describe the process steps and decision points]
```

## Component Interaction Block Diagram

```prompt
Generate a block diagram showing how [component name] interacts with other components in the system. Include all inputs, outputs, and dependencies.

Requirements:
- Show the main component in the center
- Use appropriate shapes for different types of connected components
- Indicate direction of data/control flow
- Label all connections with the type of interaction
- Use consistent styling for similar component types

Component details:
[Describe the component and its interactions]
```

## Layered Block Diagram

```prompt
Create a layered block diagram showing the [describe your layered architecture/system]. Show clear separation between layers and how they interact.

Requirements:
- Organize blocks in clear horizontal or vertical layers
- Use consistent block shapes within each layer
- Show inter-layer communication with appropriate arrows
- Include brief descriptions of layer responsibilities
- Use appropriate styling to distinguish layers

Architecture details:
[Describe your layered architecture and requirements]
```

## Tips for Using These Prompts

1. Replace all text in [brackets] with your specific requirements
2. Add relevant context about your system or process
3. Adjust the styling requirements based on your needs
4. Feel free to combine elements from different prompts
5. Use the column notation to control layout when needed
