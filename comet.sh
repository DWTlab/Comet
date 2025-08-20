#!/bin/bash

# -----------------------------------------------------------------------------
# Comet: A script to run a command, save its output, and push it to GitHub.
#
# -- HOW TO USE --
# 1. Fill in the variables in `config.sh`.
# 2. Save the file.
# 3. Run the script from your terminal: ~/.comet/comet.sh
# -----------------------------------------------------------------------------

# This makes the script stop if any command fails.
set -e

# Source the configuration and variables files.
source "$(dirname "${BASH_SOURCE[0]}")/config.sh"
source "$(dirname "${BASH_SOURCE[0]}")/variables.sh"

# Run the command and save its output to the file.
echo "Running command: $COMMAND_TO_RUN"
eval $COMMAND_TO_RUN > "$COMET_DIR/$OUTPUT_FILE"
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

  # Add all new and modified files to Git.
  echo "Adding all new and modified files to Git..."
  git add .

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

echo "Comet Launched!"