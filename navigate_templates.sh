#!/bin/bash

# Function to display the menu
show_menu() {
    clear
    echo "🎨 Mermaid Diagram Template Navigator"
    echo "===================================="
    echo
    echo "Choose a diagram category:"
    echo
    echo "Structure & Architecture:"
    echo "1) Block Diagrams"
    echo "2) Architecture Diagrams"
    echo "3) Class Diagrams"
    echo "4) Entity-Relationship Diagrams"
    echo
    echo "Flow & Process:"
    echo "5) Flowchart Diagrams"
    echo "6) Sequence Diagrams"
    echo "7) State Diagrams"
    echo "8) User Journey Diagrams"
    echo
    echo "Planning & Project:"
    echo "9) Gantt Charts"
    echo "10) Requirement Diagrams"
    echo "11) Timeline Diagrams"
    echo "12) Quadrant Charts"
    echo
    echo "Data & Analytics:"
    echo "13) Data Visualization"
    echo "14) Sankey Diagrams"
    echo "15) XY Charts"
    echo "16) Packet Diagrams"
    echo
    echo "Conceptual & Creative:"
    echo "17) Mind Maps"
    echo "18) SVG Graphics"
    echo
    echo "Automation & Enhancement:"
    echo "19) Diagram Automation"
    echo "20) Diagram Enhancement"
    echo "21) Custom Instructions"
    echo
    echo "0) Exit"
    echo
    echo "Enter your choice [0-21]: "
}

# Function to open a file
open_file() {
    if [ -f "$1" ]; then
        code "$1"
    else
        echo "File not found: $1"
        echo "Press any key to continue..."
        read -n 1
    fi
}

# Main loop
while true; do
    show_menu
    read choice

    case $choice in
        0) exit ;;
        1) open_file "prompt_templates/block_diagram_prompts.md" ;;
        2) open_file "prompt_templates/architecture_diagram_prompts.md" ;;
        3) open_file "prompt_templates/class_diagram_prompts.md" ;;
        4) open_file "prompt_templates/entity_relationship_prompts.md" ;;
        5) open_file "prompt_templates/flowchart_prompts.md" ;;
        6) open_file "prompt_templates/sequence_diagram_prompts.md" ;;
        7) open_file "prompt_templates/state_diagram_prompts.md" ;;
        8) open_file "prompt_templates/user_journey_prompts.md" ;;
        9) open_file "prompt_templates/gantt_chart_prompts.md" ;;
        10) open_file "prompt_templates/requirement_diagram_prompts.md" ;;
        11) open_file "prompt_templates/timeline_prompts.md" ;;
        12) open_file "prompt_templates/quadrant_chart_prompts.md" ;;
        13) open_file "prompt_templates/data_visualization_prompts.md" ;;
        14) open_file "prompt_templates/sankey_diagram_prompts.md" ;;
        15) open_file "prompt_templates/xy_chart_prompts.md" ;;
        16) open_file "prompt_templates/packet_diagram_prompts.md" ;;
        17) open_file "prompt_templates/mind_map_prompts.md" ;;
        18) open_file "prompt_templates/svg_graphics_prompts.md" ;;
        19) open_file "prompt_templates/automation_prompts.md" ;;
        20) open_file "prompt_templates/diagram_enhancement_prompts.md" ;;
        21) open_file "prompt_templates/custom_instructions_templates.md" ;;
        *) echo "Invalid option. Press any key to continue..." && read -n 1 ;;
    esac
done
