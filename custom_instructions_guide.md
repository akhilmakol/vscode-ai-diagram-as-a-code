# Automating Diagram Creation with VS Code Custom Instructions and Reusable Prompts

VS Code 1.100+ introduces powerful features for AI automation through custom instructions and reusable prompts. This guide shows you how to leverage these features to streamline diagram creation workflows.

## Understanding VS Code's AI Automation Features

### Custom Instructions

Custom instructions allow you to configure the behavior of VS Code's Chat feature to align with your specific diagram creation needs. Think of them as persistent preferences that guide how the AI interacts with you.

### Reusable Prompts

Reusable prompts are saved commands that can be quickly accessed and executed. For diagram creation, they serve as templates for generating specific types of diagrams or performing automated diagram tasks.

## Setting Up Custom Instructions for Diagram Creation

1. Open VS Code 1.100+
2. Access the Chat panel (View > Command Palette > "Chat: Focus on Chat View")
3. Click the settings icon (⚙️) in the Chat panel
4. Select "Custom Instructions"
5. Enter your customized instructions

### Recommended Custom Instructions for Diagram Creation

```
As a diagram creation assistant:

1. Always output valid Mermaid/PlantUML syntax that can be rendered without errors
2. Follow these styling conventions:
   - Use a consistent color palette (#f9f9f9 for backgrounds, #333 for borders, #5a67d8 for highlights)
   - Ensure readable node labels with descriptive text
   - Group related components in subgraphs where it improves clarity
   - Use appropriate diagram types for the content (flowcharts for processes, sequence diagrams for interactions)
3. Create diagrams with these quality standards:
   - Clear visual hierarchy
   - Logical flow direction (typically left-to-right or top-to-bottom)
   - Minimal crossing lines
   - Meaningful labels on relationships
4. Include brief explanations for complex diagram sections
5. When providing diagrams, also include tips on how to extend or modify them

When I ask you to modify a diagram:
1. Preserve existing styling and naming conventions
2. Focus on the specific elements I want to change
3. Explain your changes so I understand the modifications
```

## Creating Reusable Prompts for Diagram Workflows

To create reusable prompts in VS Code 1.100+:

1. In the Chat panel, click the "Reusable Prompts" button
2. Click "Create new prompt"
3. Define a prompt title and content
4. Save it for future use

## Managing Reusable Prompts

For a team environment, you can share prompts by:

1. Exporting them from VS Code settings
2. Storing them in version control
3. Creating a shared prompt library

The prompt templates in this folder are organized by diagram type and use case, ready to be imported into your VS Code settings or used as reference when creating your own prompts.

## How to Use the Prompt Templates

1. Copy the content of a template prompt
2. In VS Code, create a new reusable prompt and paste the content
3. Customize the placeholders (text in [square brackets]) to match your specific needs
4. Save the prompt with a descriptive name
5. Access it anytime from the Reusable Prompts menu in Chat

## Combining Custom Instructions and Reusable Prompts

The true power comes from combining these features:

1. **Custom instructions** ensure consistent styling and quality across all diagrams
2. **Reusable prompts** provide templates for specific diagram types or tasks
3. Together, they create an efficient, consistent diagramming workflow

## Best Practices for AI-Assisted Diagram Creation

1. **Start with templates**: Use reusable prompts as starting points
2. **Be specific**: Include details about components, relationships, and styles
3. **Iterate**: Generate a basic diagram first, then refine with follow-up prompts
4. **Learn from examples**: Study effective diagrams and their corresponding prompts
5. **Maintain a library**: Organize your reusable prompts by diagram type and purpose

## Example Workflow

1. Select code or documentation to visualize
2. Use a reusable prompt like "Generate Class Diagram from Selection"
3. Review the generated diagram
4. Use follow-up prompts to refine specific aspects
5. Export the final diagram for documentation

By leveraging VS Code 1.100+'s custom instructions and reusable prompts, you can significantly reduce the time spent creating and maintaining diagrams while ensuring consistency and quality across all your visualizations.
