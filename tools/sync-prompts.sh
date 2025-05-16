#!/bin/zsh

# Sync prompt templates with enterprise registry
echo "Syncing prompt templates with enterprise registry..."

# Load registry configuration
REGISTRY_CONFIG=".vscode/prompt-registry.json"
REGISTRY_URL=$(jq -r '.registry.baseUrl' $REGISTRY_CONFIG)

# For each collection in the registry
jq -r '.registry.collections | keys[]' $REGISTRY_CONFIG | while read collection; do
    echo "Processing collection: $collection"
    
    # Get collection details
    COLLECTION_PATH=$(jq -r ".registry.collections.$collection.path" $REGISTRY_CONFIG)
    COLLECTION_VERSION=$(jq -r ".registry.collections.$collection.version" $REGISTRY_CONFIG)
    
    # Download updated templates
    curl -s "$REGISTRY_URL$COLLECTION_PATH/v$COLLECTION_VERSION/templates.json" > "temp_$collection.json"
    
    # Update VS Code settings with new prompts
    jq -s '.[0].chat.reusablePrompts += (.[1].prompts)' \
        "$HOME/Library/Application Support/Code/User/settings.json" \
        "temp_$collection.json" > "temp_settings.json"
    
    mv "temp_settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
    rm "temp_$collection.json"
done

echo "Prompt templates synchronized successfully!"
