#!/bin/zsh

# Function to log messages
log_message() {
    local message=$1
    echo "$(date +"%Y-%m-%d %T"): $message"
}

# Check if there are any changes
if [[ $(git status --porcelain) ]]; then
    log_message "Changes detected. Adding files..."
    
    # Add modified or newly added files
    git add .

    # Commit changes with default message
    commit_message="Auto-commit: $(date +"%Y-%m-%d %T")"
    git commit -m "$commit_message"
    log_message "Changes committed with message: $commit_message"

    # Push changes to remote
    git push origin main
    log_message "Changes pushed to GitHub."

    echo "Changes successfully added, committed, and pushed."
else
    log_message "No changes detected. Exiting."
    echo "No changes detected. Exiting."
fi
