# Comet: Your Friendly Neighborhood Command-Running Sidekick

Greetings, Earthling! Welcome to Comet, the script that's so simple, your cat could probably use it (no offense to your cat).

Ever find yourself running the same command over and over, like a hamster on a wheel? And then you have to copy the output, save it somewhere, and maybe even push it to GitHub? Sounds like a job for a robot. Or, even better, a Comet!

## So, What's This Comet Thing Anyway?

Comet is a tiny, yet mighty, script that lives in a secret lair on your computer (the `~/.comet` directory). It's designed to be your trusty sidekick, automating the boring stuff so you can get back to the important things, like watching cat videos.

## How Does This Magic Work?

It's not magic, it's just a little bit of shell script wizardry. You give Comet a command, and it runs it, captures the output, and (if you want) sends it flying into your GitHub repository. All you have to do is tweak a simple config file. No coding required, we promise!

## Let's Get This Party Started!

Ready to launch your first Comet? Let's do it!

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

### Step 3: Engage!

Once you've configured Comet, you're ready for launch. Just type this into your terminal:

```bash
comet
```

**Important:** If this is your first time running `comet` after installation, you might need to restart your terminal or run `source ~/.bashrc` (or `source ~/.zshrc` if you're a zsh user) for the `comet` command to be recognized.

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

## A Note on "Automatically Pulling from Repos on Shell Launch"

You asked about automatically pulling from specific repos on shell launch. While Comet is fantastic for *pushing* command outputs to GitHub, it's not really designed for *pulling* code or updates from repositories.

For automatically pulling changes from a Git repository when your shell launches, you'd typically add a `git pull` command directly to your shell's configuration file (like `~/.bashrc` or `~/.zshrc`).

**Example for `~/.bashrc` (or `~/.zshrc`):**
```bash
# Navigate to your repo and pull changes
cd /path/to/your/repo && git pull
```

This approach is more direct and efficient for keeping your local repositories up-to-date. Comet's strength lies in capturing and versioning the *output* of commands, not managing code repositories themselves.

## A Note for the Pros

Hey there, seasoned veteran! You've probably noticed that Comet is just a simple shell script. That's the beauty of it! Feel free to tinker with it, extend it, or even rewrite it in Rust if that's your jam. It's your script now.

## License

Comet is licensed under the MIT License. Go forth and do cool things with it.