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

## Examples: Unleash the Power of Comet!

Comet is super flexible! Here are a few ideas to get your creative juices flowing, whether you're a command-line newbie or a seasoned pro.

### 1. Daily System Health Check (New User Friendly!)

Want to keep an eye on your computer's vital signs without becoming a sysadmin wizard? Comet can do that!

**`config.sh` setup:**
```bash
COMMAND_TO_RUN="df -h && free -h && uptime"
OUTPUT_FILE="system_health_report.txt"
COMMIT_MESSAGE="Comet: Daily system health report"
```

This will run commands to show disk space, memory usage, and system uptime, saving it all to a file and pushing it to GitHub. Now you're a digital doctor!

### 2. Website Uptime Monitor (New User Friendly!)

Ever wonder if your favorite website is taking a nap? Comet can check for you!

**`config.sh` setup:**
```bash
COMMAND_TO_RUN="curl -s -o /dev/null -w '%{http_code}' https://www.google.com"
OUTPUT_FILE="google_uptime.txt"
COMMIT_MESSAGE="Comet: Google uptime check"
```

This command checks Google's HTTP status code. If it's `200`, it's up! You can change `https://www.google.com` to any website you want to monitor.

### 3. Error Log Watcher (Power User Alert!)

For the developers and server admins out there: automatically capture and version critical errors from your logs. Never miss a bug again!

**`config.sh` setup:**
```bash
COMMAND_TO_RUN="grep -i 'error\|fail' /var/log/syslog | tail -n 50"
OUTPUT_FILE="recent_errors.txt"
COMMIT_MESSAGE="Comet: Latest system errors"
```

This will grab the last 50 lines containing "error" or "fail" from your system log. Adjust the `grep` pattern and log file path to fit your needs.

### 4. API Data Snapshot (Power User Alert!)

Need to track changes in data from an API? Comet can fetch and save it periodically!

**`config.sh` setup:**
```bash
COMMAND_TO_RUN="curl -s https://api.github.com/users/octocat"
OUTPUT_FILE="octocat_profile.json"
COMMIT_MESSAGE="Comet: Octocat API profile snapshot"
```

This example fetches the Octocat GitHub profile. Replace the URL with any API endpoint you want to monitor. Just be mindful of API rate limits!

### 5. Daily Creative Prompt (Fun for Everyone!)

Feeling uninspired? Let Comet give you a daily dose of creativity!

**`config.sh` setup:**
```bash
COMMAND_TO_RUN="curl -s https://www.affirmations.dev/api/daily"
OUTPUT_FILE="daily_affirmation.txt"
COMMIT_MESSAGE="Comet: Daily dose of inspiration"
```

This will fetch a daily affirmation. You can replace the URL with other fun APIs that provide quotes, jokes, or random facts. Get creative!

## A Note for the Pros

Hey there, seasoned veteran! You've probably noticed that Comet is just a simple shell script. That's the beauty of it! Feel free to tinker with it, extend it, or even rewrite it in Rust if that's your jam. It's your script now.

## License

Comet is licensed under the MIT License. Go forth and do cool things with it.