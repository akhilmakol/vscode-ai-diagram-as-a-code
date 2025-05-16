const fs = require('fs');
const path = require('path');
const yaml = require('js-yaml');

class PromptValidator {
    constructor() {
        this.errors = [];
    }

    validateFrontMatter(content, filePath) {
        try {
            const match = content.match(/^---\n([\s\S]*?)\n---/);
            if (!match) {
                this.errors.push(`${filePath}: Missing YAML front matter`);
                return null;
            }

            const frontMatter = yaml.load(match[1]);
            this.validateRequired(frontMatter, filePath);
            this.validateVersion(frontMatter, filePath);
            this.validateVariables(frontMatter, filePath);

            return frontMatter;
        } catch (e) {
            this.errors.push(`${filePath}: Invalid YAML - ${e.message}`);
            return null;
        }
    }

    validateRequired(frontMatter, filePath) {
        const required = ['version', 'author', 'category'];
        for (const field of required) {
            if (!frontMatter[field]) {
                this.errors.push(`${filePath}: Missing required field '${field}'`);
            }
        }
    }

    validateVersion(frontMatter, filePath) {
        const version = frontMatter.version;
        if (version && !/^\d+\.\d+\.\d+$/.test(version)) {
            this.errors.push(`${filePath}: Invalid version format. Use semver (e.g., 1.0.0)`);
        }
    }

    validateVariables(frontMatter, filePath) {
        const variables = frontMatter.variables;
        if (variables) {
            if (typeof variables !== 'object') {
                this.errors.push(`${filePath}: Variables must be an object`);
            } else {
                // Check variable definitions
                for (const [key, value] of Object.entries(variables)) {
                    if (!value || typeof value !== 'string') {
                        this.errors.push(`${filePath}: Invalid variable '${key}'`);
                    }
                }
            }
        }
    }

    validatePromptContent(content, filePath) {
        // Check for minimum content length
        if (content.length < 50) {
            this.errors.push(`${filePath}: Prompt content too short`);
        }

        // Check for placeholder patterns
        const placeholderPattern = /\[[\w\s-]+\]/;
        if (!placeholderPattern.test(content)) {
            this.errors.push(`${filePath}: No customizable placeholders found`);
        }
    }

    getErrors() {
        return this.errors;
    }

    hasErrors() {
        return this.errors.length > 0;
    }
}

// Export the validator
module.exports = PromptValidator;
