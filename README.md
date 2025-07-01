# Comet: Your Personal Command-Logging Time Machine

Welcome to Comet, the script that's like a flight recorder for your command line—and so simple, your cat could probably use it (no offense to your cat). Ever run a command and wish you had a snapshot of the output from last week? Or maybe you want to spy on a webpage to see when it *finally* changes? Comet is your go-to gadget for this kind of digital time-travel.

In a nutshell, Comet runs a command for you, saves the output to a file, and—here's the cool part—pushes it to a GitHub repository. This creates a neat, versioned history of... well, whatever you want! It's automation for the curious, the meticulous, and anyone who thinks `copy-paste` is a chore.


## So, What's This Comet Thing Anyway?

Comet is a tiny, yet mighty, script that lives in a secret lair on your computer (the `~/.comet` directory). It's designed to be your trusty sidekick, automating the boring stuff so you can get back to the important things, like watching cat videos.

## How Does This Magic Work?

It's not magic, it's just a little bit of shell script wizardry. You give Comet a command, and it runs it, captures the output, and (if you want) sends it flying into your GitHub repository. All you have to do is tweak a simple config file. No coding required, we promise!

## Let's Get This Party Started!

Ready to launch your first Comet? Let's do it!

### Before You Begin: The Checklist

Before we launch this Comet, let's make sure the launchpad is ready. You'll need:

*   **Git:** Comet uses Git to work its magic. Most systems have it, but if not, you can grab it from the [official Git website](https://git-scm.com/downloads).
*   **A GitHub Account:** Since Comet's ultimate destination is GitHub, you'll need an account. If you don't have one, you can sign up for free at [GitHub.com](https://github.com).


### Step 1: The Grand Installation

First things first, you need to install Comet. Don't worry, it's easier than assembling IKEA furniture. Just open your terminal and run this command:

```bash
# Make the installer executable and run it
chmod +x install.sh && ./install.sh
```

This will create the `~/.comet` directory, copy the scripts, and make sure your system knows where to find them. It's like giving Comet a key to your city.

### Step 2: Teach Comet Your Ways

Now it's time to tell Comet what you want it to do. Open up the `config.sh` file in your favorite text editor. If you're new to the command line, `nano` is a great choice:

```bash
nano ~/.comet/config.sh
```

Inside, you'll find a few variables to play with. Here's the lowdown:

| Variable | What It Does | Example |
| --- | --- | --- |
| `COMMAND_TO_RUN` | The command you want Comet to run for you. | `"echo 'Hello, space cowboy!'"` |
| `OUTPUT_FILE` | The name of the file where Comet will stash the output. | `"my_awesome_output.txt"` |
| `GIT_REPO_URL` | **(Optional)** Your GitHub repository URL. If you want Comet to push to GitHub, **uncomment this line** and paste your URL. | `"git@github.com:your-username/your-cool-repo.git"` |
| `GIT_BRANCH` | The branch you want to push to. `main` is usually a good bet. | `"main"` |
| `COMMIT_MESSAGE` | The witty message for your commit. | `"Comet: Houston, we have liftoff!"` |
| `GIT_USERNAME` | **(Optional)** Your Git username. Uncomment to use. | `"Captain Kirk"` |
| `GIT_EMAIL` | **(Optional)** Your Git email. Uncomment to use. | `"captain.kirk@starfleet.com"` |

#### A Quick Detour: Setting Up Your GitHub Repo

This is where Comet's journey ends. If you want Comet to push its findings to GitHub, you need a repository for it to call home.

1.  **Create a New Repository:** Go to [repo.new](https://repo.new) on GitHub. Give it a cool name (like `comet-logs` or `my-digital-diary`) and click "Create repository."

2.  **Grab the URL:** On your new repository's page, click the green `<> Code` button. You'll see a URL. **For an easier setup, I recommend using the HTTPS URL.** It looks like `https://github.com/your-username/your-cool-repo.git`. Copy it!

3.  **Give Your Computer Access:** Your computer needs permission to push to your GitHub account. If you haven't done this before, GitHub has excellent guides on [setting up authentication](https://docs.github.com/en/get-started/getting-started-with-git/setting-your-username-in-git). Using a **Personal Access Token** is the modern way to do it!

Now, back to our regular programming...

### Step 3: Engage!

Once you've configured Comet, you're ready for launch. Just type this into your terminal:

```bash
comet
```

**Heads-Up!** The installer adds the `comet` command to your system's PATH, which is like a list of shortcuts. Your terminal only reads this list when it starts up, so you'll need to **restart your terminal** or run `source ~/.bashrc` (or `~/.zshrc`) to make the new `comet` command work.

And that's it! Comet will do its thing, and you can sit back and relax. You've successfully automated the boring stuff. High five!

## Examples: Unleash the Power of Comet! (Now with more GitHub Goodness!)

Comet truly shines when you want to track changes over time. By pushing to GitHub, you get a beautiful, versioned history of whatever Comet captures. Here are some ideas to get you started:

### 1. Website Content Change Tracker (For the Curious Web Explorer)

Ever wonder when a website updates its content? Or if a specific piece of text changes? Comet can be your digital detective!

**`config.sh` setup:**
```bash
COMMAND_TO_RUN="curl -s https://example.com/some-page.html"
OUTPUT_FILE="example_page_content.html"
COMMIT_MESSAGE="Comet: Snapshot of example.com content"
```

This will fetch the HTML content of a webpage, save it, and push it to GitHub. You can then use GitHub's diff viewer to see exactly what changed between runs!

### 2. Configuration File Versioning (For the Organized Admin)

Critical configuration files can change, and sometimes you need to know *when* and *what* changed. Comet can keep a historical record for you.

**`config.sh` setup:**
```bash
COMMAND_TO_RUN="cat /etc/nginx/nginx.conf"
OUTPUT_FILE="nginx_config_snapshot.conf"
COMMIT_MESSAGE="Comet: Nginx config snapshot"
```

Replace `/etc/nginx/nginx.conf` with any configuration file you want to track (e.g., `~/.bashrc`, `/etc/fstab`, `my_app/config.yaml`).

### 3. Database Schema Snapshot (For the Data-Minded Developer)

Database schemas evolve. Keep a versioned history of your database structure without needing full backups.

**`config.sh` setup (for PostgreSQL example):**
```bash
COMMAND_TO_RUN="pg_dump -s -U your_user your_database > /tmp/db_schema.sql && cat /tmp/db_schema.sql"
OUTPUT_FILE="db_schema_snapshot.sql"
COMMIT_MESSAGE="Comet: Database schema snapshot"
```

**Note:** You'll need `pg_dump` installed and configured. Adjust the command for MySQL (`mysqldump -d`), SQLite, or other databases. Remember to clean up temporary files if created.

### 4. Dependency List Tracker (For the Diligent Developer)

Dependencies can be a wild ride. Track changes in your project's dependencies to understand when new versions are introduced or removed.

**`config.sh` setup (for Python `requirements.txt`):**
```bash
COMMAND_TO_RUN="pip freeze"
OUTPUT_FILE="python_dependencies.txt"
COMMIT_MESSAGE="Comet: Python dependencies snapshot"
```

**`config.sh` setup (for Node.js `package.json`):**
```bash
COMMAND_TO_RUN="cat package.json"
OUTPUT_FILE="nodejs_package_json.json"
COMMIT_MESSAGE="Comet: Node.js package.json snapshot"
```

This helps you see how your project's external libraries change over time.

### 5. System Information Baseline (For the Troubleshooting Guru)

When things go wrong, knowing what your system *used* to look like can be a lifesaver. Create a baseline and track changes to key system info.

**`config.sh` setup:**
```bash
COMMAND_TO_RUN="uname -a && lsb_release -a && ip a && df -h"
OUTPUT_FILE="system_info_baseline.txt"
COMMIT_MESSAGE="Comet: System information baseline"
```

This captures basic system details, OS info, network configuration, and disk usage. Great for debugging mysterious issues!

### 6. API Data Snapshot (For the Data-Minded Developer)

Need to track changes in data from an API? Comet can fetch and save it periodically!

**`config.sh` setup:**
```bash
COMMAND_TO_RUN="curl -s https://api.github.com/users/octocat"
OUTPUT_FILE="octocat_profile.json"
COMMIT_MESSAGE="Comet: Octocat API profile snapshot"
```

This example fetches the Octocat GitHub profile. Replace the URL with any API endpoint you want to monitor. Just be mindful of API rate limits!


## A Note for the Pros

Hey there, seasoned veteran! You've probably noticed that Comet is just a simple shell script. That's the beauty of it! Feel free to tinker with it, extend it, or even rewrite it in Rust if that's your jam. It's your script now.

## License

Comet is licensed under the MIT License. Go forth and do cool things with it.
