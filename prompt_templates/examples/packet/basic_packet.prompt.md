<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# Basic Packet Diagram Template

Create a packet diagram showing network protocol structure with these specifications:

## Requirements

- Protocol: [specify protocol]
- Packet type: [header/payload/complete]
- Detail level: [basic/detailed]

## Components

Define the following:
1. Fields: [list packet fields]
2. Sizes: [field lengths]
3. Structure: [field organization]
4. Descriptions: [field purposes]

## Styling Guidelines

- Use clear field labels
- Show proper bit/byte counts
- Include field types
- Group related fields

## Expected Output

A complete Mermaid packet diagram showing the protocol structure.

## Example Format

```mermaid
packet-beta
    title TCP Header
    rect "Source Port" "16"
    rect "Destination Port" "16"
    rect "Sequence Number" "32"
    rect "Acknowledgment Number" "32"
    space 4
    rect "Flags" "8"
    rect "Window Size" "16"
    space 2
    rect "Checksum" "16"
    rect "Urgent Pointer" "16"
```

## Additional Context

Specify any protocol standards, field requirements, or structural constraints.
