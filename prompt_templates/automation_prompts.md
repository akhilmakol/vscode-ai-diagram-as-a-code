# 🤖 Diagram Automation Template Prompts

> *A collection of reusable prompts for automating diagram creation and manipulation*

---

This file contains reusable prompts for automating common diagram tasks in VS Code. Copy these prompts and add them to your VS Code Reusable Prompts collection.

## 💻 Generate Diagram from Code

```
Analyze the code I've selected and generate an appropriate Mermaid diagram that
visualizes its structure and relationships. If it's:
- A class or interface: Create a class diagram showing methods, properties, and relationships
- Process or workflow code: Create a flowchart showing the execution flow
- API endpoints: Create a sequence diagram showing request handling
- Component with dependencies: Create a component diagram showing relationships

Use clear labels and consistent styling.
```

## Convert Between Diagram Types

```
Convert the following [source diagram type] diagram to a [target diagram type]
diagram, preserving all the key elements and relationships:

[paste your diagram here]

Ensure the new diagram accurately represents the same system or process but
takes advantage of the features of the [target diagram type] format.
```

## Update Diagram Based on Code Changes

```
I've made changes to code that is represented in this diagram:

[paste your diagram here]

The changes I've made are:
[describe code changes]

Please update the diagram to accurately reflect these changes while maintaining
the existing style and organization of the diagram.
```

## Add Styling to Plain Diagram

```
Apply professional styling to this basic diagram:

[paste your diagram here]

Add:
- Consistent color scheme (use: primary=#5a67d8, secondary=#6b7280, highlight=#f0f5ff)
- Improved node shapes appropriate to their function
- Visual grouping of related elements using subgraphs
- Better spacing and layout
- A legend if there are multiple types of elements
```

## Extract Diagram from Documentation

```
Review the technical documentation I've selected and create a Mermaid diagram that
visualizes the key components and relationships described in it. Choose the most
appropriate diagram type based on the content (flowchart, sequence, class, etc.).
Include all important elements mentioned in the text and maintain any hierarchy
or process flow described.
```

## Generate Documentation from Diagram

```
Generate comprehensive documentation based on this diagram:

[paste your diagram here]

Include:
- An overview of what the diagram represents
- Description of each component and its purpose
- Explanation of the relationships/connections
- Any important processes or flows shown
- Design considerations or constraints implied by the structure
- Potential areas for improvement or extension

Format as markdown with appropriate headings and structure.
```

## Simplify Complex Diagram

```
Simplify this complex diagram while preserving its essential meaning:

[paste your diagram here]

Create a high-level version that:
- Combines or abstracts detailed components into logical groups
- Removes unnecessary detail while keeping the core structure
- Improves readability through clearer layout
- Maintains all critical relationships and flows
- Uses subgraphs to represent grouped components
```

## Compare Two Diagrams

```
Compare these two diagrams and identify the key differences:

Diagram 1:
[paste first diagram here]

Diagram 2:
[paste second diagram here]

Analyze and report:
- Added/removed components
- Changed relationships or flows
- Structural or architectural differences
- Style or representation differences

Then provide a summary of the significant changes and their potential impact.
```

## Generate Test Scenarios from Diagram

```
Based on this diagram, generate comprehensive test scenarios that would verify
the correct implementation of the depicted system or process:

[paste your diagram here]

For each main path or component interaction shown:
- Create a test scenario description
- Identify preconditions
- List test steps
- Specify expected outcomes
- Note any edge cases or error conditions to test

Format as a structured test plan.
```

## Create Multiple Diagram Views

```
Generate multiple views of the same system based on this primary diagram:

[paste your diagram here]

Create these additional perspectives:
1. A high-level context diagram showing external interfaces
2. A component-focused view showing internal structure
3. A data flow view emphasizing movement of information
4. A dependency view showing relationships between components

Each view should maintain consistency with the original diagram but emphasize
different aspects of the system.
```

## Navigation

- [🏠 Back to Main Page](../README.md)
- **Related Documents:**
  - [Prompt Templates Home](README.md)
  - [AI Diagram Generation Guide](../ai_diagram_generation_guide.md)
  - [Workflow Integration](../workflow_integration.md)
