#!/bin/bash

# -----------------------------------------------------------------------------
# Comet: A script to run a command, save its output, and push it to GitHub.
#
# -- HOW TO USE --
# 1. Fill in the variables under "Configuration".
# 2. Save the file.
# 3. Run the script from your terminal: ~/.comet/comet.sh
# -----------------------------------------------------------------------------

# --- Configuration ---
# Fill in the details below.

# The command you want to run.
# Example: COMMAND_TO_RUN="ls -la"
COMMAND_TO_RUN="echo 'Hello, from Comet!'"

# The name of the file to save the output to.
# This file will be saved in the ~/.comet directory.
# Example: OUTPUT_FILE="my_files.txt"
OUTPUT_FILE="comet_output.txt"

# The URL of your GitHub repository.
# You can find this on your repository's page on GitHub.
# To enable pushing to GitHub, uncomment the line below and add your repository URL.
# GIT_REPO_URL="git@github.com:your-username/your-repo.git"

# The branch to push your changes to.
# The default is usually "main".
GIT_BRANCH="main"

# The commit message for the change.
COMMIT_MESSAGE="Comet: Automated command output"

# (Optional) Your Git username and email.
# If you have git configured globally, you can leave these commented out.
# To use a specific username and email for this script, uncomment the lines below.
# GIT_USERNAME="Your Name"
# GIT_EMAIL="your.email@example.com"


# --- Script (No need to edit below this line) ---

# This makes the script stop if any command fails.
set -e

# Get the directory where this script is located.
COMET_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run the command and save its output to the file.
echo "Running command: $COMMAND_TO_RUN"
$COMMAND_TO_RUN > "$COMET_DIR/$OUTPUT_FILE"
echo "Output saved to: $COMET_DIR/$OUTPUT_FILE"

# If a Git repository URL is set, push the changes.
if [ -n "$GIT_REPO_URL" ]; then
  echo "Preparing to push to GitHub..."

  # Change to the script's directory to run git commands.
  cd "$COMET_DIR"

  # (Optional) Set the Git username and email if they are configured.
  if [ -n "$GIT_USERNAME" ] && [ -n "$GIT_EMAIL" ]; then
    echo "Using Git user: $GIT_USERNAME <$GIT_EMAIL>"
    git config user.name "$GIT_USERNAME"
    git config user.email "$GIT_EMAIL"
  fi

  # Add the output file to Git.
  echo "Adding file to Git: $OUTPUT_FILE"
  git add "$OUTPUT_FILE"

  # Commit the changes.
  echo "Committing with message: '$COMMIT_MESSAGE'"
  git commit -m "$COMMIT_MESSAGE"

  # Push the changes to the specified branch.
  echo "Pushing to branch '$GIT_BRANCH' at '$GIT_REPO_URL'"
  git push "$GIT_REPO_URL" "$GIT_BRANCH"

  echo "Successfully pushed to GitHub."
else
  echo "GIT_REPO_URL is not set. Skipping GitHub push."
fi

echo "Comet script finished."
