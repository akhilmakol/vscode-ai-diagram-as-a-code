# 🤖 Automating Diagram Creation with VS Code Custom Instructions and Reusable Prompts


> VS Code 1.100+ introduces powerful features for AI automation through custom instructions and reusable prompts. This guide shows you how to leverage these features to streamline diagram creation workflows.

[![VS Code](https://img.shields.io/badge/VS_Code-1.100+-007ACC?style=for-the-badge&logo=visual-studio-code&logoColor=white)](https://code.visualstudio.com/)
[![GitHub Copilot](https://img.shields.io/badge/GitHub_Copilot-enabled-2EA44F?style=for-the-badge&logo=github&logoColor=white)](https://github.com/features/copilot)
[![Mermaid](https://img.shields.io/badge/Mermaid-8A2BE2?style=for-the-badge&logo=mermaid&logoColor=white)](https://mermaid.js.org/)

## 🔍 Understanding VS Code's AI Automation Features


### ⚙️ Custom Instructions

| What are they? | Benefits for diagramming |
|----------------|--------------------------|
| Persistent preferences that configure VS Code Chat behavior | Ensure consistent diagram styling |
| Applied to all conversations with VS Code's AI | Maintain quality standards across all diagrams |
| Stored in your user settings | Set once and apply to all your diagram creation |

### 📋 Reusable Prompts

| What are they? | Benefits for diagramming |
|----------------|--------------------------|
| Saved commands for quick execution | Create diagram templates for specific use cases |
| Customizable with variables | Generate standardized diagrams with different content |
| Shareable across teams | Establish consistent diagramming practices |

## ⚙️ Setting Up Custom Instructions for Diagram Creation


| Step | Action |
|------|--------|
| 1️⃣ | Open VS Code 1.100+ |
| 2️⃣ | Access the Chat panel (View > Command Palette > "Chat: Focus on Chat View") |
| 3️⃣ | Click the settings icon (⚙️) in the Chat panel |
| 4️⃣ | Select "Custom Instructions" |
| 5️⃣ | Enter your customized instructions |

> 💡 **Pro Tip:** Review and update your custom instructions periodically as your diagramming needs evolve

### 📝 Recommended Custom Instructions for Diagram Creation

```text
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

## 📋 Creating Reusable Prompts for Diagram Workflows


To create reusable prompts in VS Code 1.100+:

| Step | Action |
|------|--------|
| 1️⃣ | In the Chat panel, click the "Reusable Prompts" button |
| 2️⃣ | Click "Create new prompt" |
| 3️⃣ | Define a prompt title and content |
| 4️⃣ | Save it for future use |

### 🔄 Example Reusable Prompt for Class Diagram

```text
Title: Generate Class Diagram

Prompt: Create a Mermaid class diagram for the following code or description:
{{selected_text}}

Include:
- All classes and their relationships
- Key methods and properties
- Proper inheritance and association arrows
- Meaningful grouping if there are many classes
```

## 🗂️ Managing Reusable Prompts


For a team environment, you can share prompts by:

| Method | Description |
|--------|-------------|
| 📤 **Export Settings** | Export prompts from VS Code settings as JSON |
| 📁 **Version Control** | Store prompt JSON files in your repository |
| 📚 **Shared Library** | Create a shared team prompt library in a common repository |

The prompt templates in this folder are organized by diagram type and use case, ready to be imported into your VS Code settings or used as reference when creating your own prompts.

## 🛠️ How to Use the Prompt Templates


| Step | Action |
|------|--------|
| 1️⃣ | Copy the content of a template prompt |
| 2️⃣ | In VS Code, create a new reusable prompt and paste the content |
| 3️⃣ | Customize the placeholders (text in [square brackets]) to match your specific needs |
| 4️⃣ | Save the prompt with a descriptive name |
| 5️⃣ | Access it anytime from the Reusable Prompts menu in Chat |

> 💡 **Pro Tip:** Create prompt variations for different levels of detail - quick sketches, detailed diagrams, and presentation-ready visuals

## 🔄 Combining Custom Instructions and Reusable Prompts


The true power comes from combining these features:

| Feature | Role in Workflow | Benefit |
|---------|-----------------|---------|
| ⚙️ **Custom Instructions** | Set global standards and styling | Ensure consistent styling and quality across all diagrams |
| 📋 **Reusable Prompts** | Provide specific templates | Create specialized templates for different diagram types and tasks |
| 🔄 **Combined Approach** | Create integrated workflow | Establish an efficient, consistent diagramming system |

> 💡 **Pro Tip:** Your custom instructions act as global rules, while reusable prompts handle specific use cases - together they create a powerful diagramming system

## 💡 Best Practices for AI-Assisted Diagram Creation


| Best Practice | Description | Example |
|--------------|-------------|---------|
| 📑 **Start with templates** | Use reusable prompts as starting points | Begin with a "Basic Flowchart" prompt and customize |
| 🔍 **Be specific** | Include details about components and relationships | "Create a microservices diagram with 5 services and a message queue" |
| 🔄 **Iterate** | Start simple, then refine with follow-up prompts | Generate basic structure first, then enhance styling |
| 📚 **Learn from examples** | Study effective diagrams and their prompts | Analyze well-designed diagrams to improve your own |
| 📂 **Maintain a library** | Organize prompts by diagram type and purpose | Create folders for flowcharts, class diagrams, etc. |

## 📋 Example Workflow


| Step | Action | VS Code Feature |
|------|--------|----------------|
| 1️⃣ | Select code or documentation to visualize | Text selection |
| 2️⃣ | Use a reusable prompt like "Generate Class Diagram from Selection" | Reusable Prompts menu |
| 3️⃣ | Review the generated diagram | Markdown Preview |
| 4️⃣ | Use follow-up prompts to refine specific aspects | Chat view |
| 5️⃣ | Export the final diagram for documentation | Diagram export options |

> 💡 **Pro Tip:** For complex systems, start with a high-level architecture diagram, then create detailed diagrams for specific components

By leveraging VS Code 1.100+'s custom instructions and reusable prompts, you can significantly reduce the time spent creating and maintaining diagrams while ensuring consistency and quality across all your visualizations.

## 🧭 Navigation


| Document | Description |
|----------|-------------|
| [🏠 Main Page](README.md) | Return to the main documentation hub |
| [🧠 Advanced AI Prompting](advanced_ai_prompting.md) | Learn more sophisticated prompting techniques |
| [📋 Workflow Example](workflow_example.md) | See practical examples of AI diagram workflows |
| [🤖 AI Diagram Generation Guide](ai_diagram_generation_guide.md) | Master AI-powered diagram generation |

### 📚 Additional Resources

| Resource | Description |
|----------|-------------|
| [VS Code Docs on Custom Instructions](https://code.visualstudio.com/docs) | Official documentation on VS Code Chat features |
| [Mermaid Diagram Syntax](https://mermaid-js.github.io/mermaid/) | Complete Mermaid language reference |
| [Prompt Engineering Guide](https://www.promptingguide.ai/) | Learn to craft more effective prompts |
