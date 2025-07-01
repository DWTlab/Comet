#!/bin/bash

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
GIT_REPO_URL="git@github.com:DWTlab/Comet.git"

# The branch to push your changes to.
# The default is usually "main".
GIT_BRANCH="main"

# The commit message for the change.
COMMIT_MESSAGE="refactor: Split comet.sh into multiple files"

# (Optional) Your Git username and email.
# If you have git configured globally, you can leave these commented out.
# To use a specific username and email for this script, uncomment the lines below.
# GIT_USERNAME="Your Name"
# GIT_EMAIL="your.email@example.com"
