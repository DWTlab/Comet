# Comet: Automate Your Command Outputs

Welcome to Comet! This is a simple tool to help you automatically run a command, save its output, and upload it to GitHub. It's designed to be easy to use, even if you're new to scripts or the command line.

## What is Comet?

Comet is a small, self-contained script that lives in a hidden `.comet` directory in your home folder. It's designed to be out of the way but easy to run whenever you need it.

## How It Works

Comet is configured by editing the `comet.sh` script directly. You don't need to understand the code to use it. Just open the file, fill in your details, and run it.

## Getting Started

Follow these steps to get Comet up and running on your system.

### Step 1: Installation

To install Comet, run the following command in your terminal. This will create the `~/.comet` directory, move the necessary files, and set everything up for you.

```bash
# Run the installer
chmod +x install.sh && ./install.sh
```

### Step 2: Configuration

Once Comet is installed, you need to configure it. Open the `comet.sh` script in a text editor:

```bash
nano ~/.comet/comet.sh
```

At the top of the file, you'll see a `Configuration` section. This is where you'll tell the script what to do.

| Variable | What to Do | Example |
| --- | --- | --- |
| `COMMAND_TO_RUN` | The command you want the script to run. | `"ls -la"` |
| `OUTPUT_FILE` | The name of the file where the output will be saved. | `"comet_output.txt"` |
| `GIT_REPO_URL` | **(Optional)** The URL of your GitHub repository. To enable pushing to GitHub, **uncomment this line** and paste your URL. | `"git@github.com:your-username/your-repo.git"` |
| `GIT_BRANCH` | The branch you want to push to. `main` is a safe default. | `"main"` |
| `COMMIT_MESSAGE` | The message for your commit. | `"Comet: Automated update"` |
| `GIT_USERNAME` | **(Optional)** Your Git username. Uncomment to use. | `"Your Name"` |
| `GIT_EMAIL` | **(Optional)** Your Git email. Uncomment to use. | `"your.email@example.com"` |

### Step 3: Running Comet

Once you've configured Comet, you can run it from your terminal at any time:

```bash
~/.comet/comet.sh
```

That's it! The script will now run your command, save the output to the `~/.comet` directory, and push it to your GitHub repository.

## License

This project is licensed under the MIT License.
