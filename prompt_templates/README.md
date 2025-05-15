# 📚 Importing and Managing Reusable Prompts in VS Code

> *A comprehensive guide for using template prompts with VS Code's reusable prompts feature*

---

This guide explains how to use the template prompts provided in this repository with VS Code 1.100+'s reusable prompts feature.

## 🗂️ Overview of Prompt Templates

This repository includes the following prompt template collections:

- 📊 [Flowchart Diagram Prompts](flowchart_prompts.md)
- 🔄 [Sequence Diagram Prompts](sequence_diagram_prompts.md)
- 📋 [Class Diagram Prompts](class_diagram_prompts.md)
- 🏗️ [Architecture Diagram Prompts](architecture_diagram_prompts.md)
- 🤖 [Diagram Automation Prompts](automation_prompts.md)
- 📊 [Entity-Relationship Diagram Prompts](entity_relationship_prompts.md)
- 🔄 [State Diagram Prompts](state_diagram_prompts.md)
- 📅 [Gantt Chart Prompts](gantt_chart_prompts.md)
- 🧠 [Mind Map Prompts](mind_map_prompts.md)
- 📊 [Data Visualization Prompts](data_visualization_prompts.md)
- 🔄 [Diagram Enhancement Prompts](diagram_enhancement_prompts.md)
- ⚙️ [Custom Instructions Templates](custom_instructions_templates.md)

Each file contains multiple template prompts designed for specific diagram types or automation tasks.

## 🛠️ How to Use These Template Prompts

### 📝 Adding Prompts Manually

1. Open VS Code 1.100+
2. Open the Chat view (View > Command Palette > "Chat: Focus on Chat View")
3. Click on the "Reusable Prompts" button in the Chat view
4. Click "Create new prompt"
5. Enter a descriptive name for your prompt
6. Copy and paste the content from one of the template prompts
7. Replace any placeholder text (typically in [square brackets]) with your specific details
8. Click "Create" to save the prompt

### 🔍 Example: Adding a Flowchart Prompt

1. Open [flowchart_prompts.md](flowchart_prompts.md)
2. Find the "Basic Process Flowchart" template
3. Copy the content between the triple backticks
4. In VS Code, create a new reusable prompt named "Generate Process Flowchart"
5. Paste the template content
6. Replace placeholders like `[describe your process]` with specific content
7. Save the prompt

### 📦 Bulk Import (Advanced)

For advanced users who want to import multiple prompts at once:

1. VS Code stores reusable prompts in your user settings
2. You can directly edit your settings.json file to add multiple prompts
3. Add prompts to the `chat.reusablePrompts` array in settings.json

Example settings.json entry:

```json
"chat.reusablePrompts": [
  {
    "name": "Generate Process Flowchart",
    "prompt": "Create a Mermaid flowchart diagram for the following process: Order processing. Include the following steps: Order received, Inventory check, Payment processing, Shipping, Delivery. The flow should start from order submission and end at delivery confirmation. Use TD (top-down) orientation and include decision points where appropriate. Apply this styling: - Process boxes: fill:#f5f5f5,stroke:#333 - Decision diamonds: fill:#fff3cd,stroke:#ffc107 - Start/End points: fill:#d4edda,stroke:#28a745"
  },
  {
    "name": "Generate Sequence Diagram",
    "prompt": "Create a Mermaid sequence diagram showing the interaction between these components: User, Frontend, API, Database. The sequence starts with user login and should include all message exchanges until successful authentication. Use solid arrows for synchronous calls and dotted arrows for responses or asynchronous messages."
  }
]
```

## 📋 Organizing Your Prompts

As your collection of prompts grows, consider organizing them with consistent naming patterns:

- Use prefixes to group similar prompts: "Flowchart: Process", "Flowchart: Decision Tree"
- Add suffixes to indicate complexity: "Class Diagram (Basic)", "Class Diagram (Advanced)"
- Include the diagram type in the prompt name for easy filtering

## ✨ Customizing Prompts

These templates are starting points. For best results:

1. Customize prompts with your specific style preferences
2. Add company-specific styling guidelines or color schemes
3. Reference your actual systems, processes, or code structures
4. Include any specific conventions your team follows

## 👥 Sharing Prompts with Your Team

To share prompts with team members:

1. Export your VS Code settings containing the prompts
2. Share the specific prompt definitions from your settings.json
3. Add the prompt templates to your project's documentation repository
4. Create a team-specific prompt library file

## 💡 Best Practices for Using Prompt Templates

1. **Start general, then refine**: Begin with a template, then add specific details
2. **Keep prompts focused**: Create separate prompts for different aspects rather than one massive prompt
3. **Iterate on prompts**: Refine your prompts based on the results you get
4. **Document your prompts**: Add comments about when and how to use each prompt
5. **Combine with custom instructions**: For best results, set up custom instructions that work well with your prompts

## 🔗 Advanced: Creating Prompt Chains

For complex diagramming tasks, consider creating a series of prompts that work together:

1. First prompt: Generate a basic diagram structure
2. Second prompt: Add styling and visual enhancements
3. Third prompt: Add detailed annotations or documentation
4. Fourth prompt: Export or integrate with documentation

## ❓ Troubleshooting

If you encounter issues with prompts:

1. **Syntax errors in diagrams**: Check that placeholders were properly replaced
2. **Prompt too complex**: Break it down into smaller, focused prompts
3. **Inconsistent results**: Add more specific guidance and examples
4. **VS Code version issues**: Ensure you're using VS Code 1.100+

---

## 🧭 Navigation

- [🏠 Back to Main Page](../README.md)
- **Related Documents:**
  - [AI Diagram Generation Guide](../ai_diagram_generation_guide.md)
  - [Custom Instructions Guide](../custom_instructions_guide.md)
