```mermaid
sequenceDiagram
    participant User
    participant VSCode
    participant AI
    participant Extension
    participant Renderer
    
    User->>VSCode: Open VS Code
    User->>VSCode: Install AI graphics extensions
    VSCode->>Extension: Initialize
    User->>VSCode: Describe needed diagram
    VSCode->>AI: Request diagram generation
    AI->>AI: Process natural language
    AI->>VSCode: Generate diagram code
    VSCode->>User: Display generated code
    User->>VSCode: Edit/refine diagram
    VSCode->>Renderer: Render preview
    Renderer->>VSCode: Return visualization
    VSCode->>User: Display visualization
    User->>VSCode: Export diagram
    VSCode->>User: Provide exported file
    
    note over User,VSCode: The entire process happens within VS Code
```
