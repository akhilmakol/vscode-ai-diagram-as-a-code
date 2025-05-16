// Prompt Analytics Service
class PromptAnalytics {
    constructor(config) {
        this.registry = config.registry;
        this.metrics = new Map();
    }

    // Track prompt usage
    trackUsage(promptId, metadata) {
        const usage = {
            timestamp: new Date(),
            success: metadata.success,
            duration: metadata.duration,
            variables: metadata.variables,
            user: metadata.user
        };

        if (!this.metrics.has(promptId)) {
            this.metrics.set(promptId, []);
        }
        this.metrics.get(promptId).push(usage);
    }

    // Generate usage report
    generateReport(timeframe = '7d') {
        const report = {
            summary: {
                totalUses: 0,
                successRate: 0,
                avgDuration: 0
            },
            byPrompt: new Map()
        };

        for (const [promptId, usages] of this.metrics) {
            const promptStats = this.calculateStats(usages, timeframe);
            report.byPrompt.set(promptId, promptStats);
            
            report.summary.totalUses += promptStats.uses;
            report.summary.successRate += promptStats.successRate;
            report.summary.avgDuration += promptStats.avgDuration;
        }

        // Calculate averages
        const promptCount = this.metrics.size;
        if (promptCount > 0) {
            report.summary.successRate /= promptCount;
            report.summary.avgDuration /= promptCount;
        }

        return report;
    }

    // Calculate statistics for a prompt
    calculateStats(usages, timeframe) {
        const timeframeMs = this.parseTimeframe(timeframe);
        const cutoff = new Date(Date.now() - timeframeMs);
        
        const recentUsages = usages.filter(u => u.timestamp >= cutoff);
        const successfulUsages = recentUsages.filter(u => u.success);
        
        return {
            uses: recentUsages.length,
            successRate: (successfulUsages.length / recentUsages.length) * 100,
            avgDuration: recentUsages.reduce((acc, u) => acc + u.duration, 0) / recentUsages.length,
            lastUsed: recentUsages.length > 0 ? recentUsages[recentUsages.length - 1].timestamp : null
        };
    }

    // Parse timeframe string to milliseconds
    parseTimeframe(timeframe) {
        const unit = timeframe.slice(-1);
        const value = parseInt(timeframe.slice(0, -1));
        
        switch(unit) {
            case 'd': return value * 24 * 60 * 60 * 1000;
            case 'h': return value * 60 * 60 * 1000;
            case 'm': return value * 60 * 1000;
            default: throw new Error('Invalid timeframe unit');
        }
    }
}

module.exports = PromptAnalytics;
