# Comet: Your Personal Command-Logging Time Machine

Welcome to Comet, the script that's like a flight recorder for your command line, and so simple, your cat could probably use it (no offense to your cat). Ever run a command and wish you had a snapshot of the output from last week? Or maybe you want to spy on a webpage to see when it *finally* changes? Comet is your go-to gadget for this kind of digital time-travel.

In a nutshell, Comet runs a command for you, saves the output to a file, and pushes to Github. This creates a neat, versioned history of... well, whatever you want! It's automation for the curious, the meticulous, and anyone who thinks `copy-paste` is a chore.


## So, What's This Comet Thing Anyway?

Comet is a tiny, yet mighty, script that lives in a secret lair on your computer (the `~/.comet` directory). It's designed to be your trusty sidekick, automating the boring stuff so you can get back to the important things, like watching cat videos.

## How Does This Magic Work?

It's not magic, it's just a little bit of shell script wizardry. You give Comet a command, and it runs it, captures the output, and (if you want) sends it flying into your GitHub repository. All you have to do is tweak a simple config file. No coding required, we promise!

## How to Get Started in 5 Minutes

Follow these steps, and you'll be launching your first Comet in no time!

### Step 1: Download the Latest Release

First, you need to get the Comet scripts onto your computer.

1.  Go to the [**Releases page**](https://github.com/DWTlab/Comet/releases) of the Comet repository.
2.  Look for the latest release.
3.  Under the **Assets** section, click on `Source code (zip)` or `Source code (tar.gz)` to download the files.

### Step 2: Unpack and Prepare the Scripts

Now that you have the files, you need to unpack them.

1.  Open your terminal and navigate to your `Downloads` folder.
    ```bash
    cd ~/Downloads
    ```
2.  Unzip the downloaded file. The folder name will vary depending on the version you downloaded.
    ```bash
    # If you downloaded the .zip file
    unzip Comet-1.0.0.zip 

    # If you downloaded the .tar.gz file
    tar -xvf Comet-1.0.0.tar.gz
    ```
3.  Now, step into the newly created directory.
    ```bash
    cd Comet-1.0.0
    ```

### Step 3: Run the Installer

This is where the magic happens. The installer will copy the scripts to a hidden `.comet` directory in your home folder and set everything up.

```bash
# Make the installer executable and run it
chmod +x install.sh && ./install.sh
```

**Heads-Up!** The installer adds the `comet` command to your system's PATH, which is like a list of shortcuts. Your terminal only reads this list when it starts up, so you'll need to **restart your terminal** or run `source ~/.bashrc` (or `~/.zshrc`) to make the new `comet` command work.

### Step 4: Configure Your Comet

Now it's time to tell Comet what you want it to do.

1.  Open the `config.sh` file in a text editor. `nano` is a great choice for beginners.
    ```bash
    nano ~/.comet/config.sh
    ```
2.  Inside, you'll find several variables. The most important one is `COMMAND_TO_RUN`. Set this to whatever command you want to track.
3.  To enable pushing to GitHub, you'll need to set up a repository.

#### A Quick Detour: Setting Up Your GitHub Repo
This is where Comet's journey ends. If you want Comet to push its findings to GitHub, you need a repository for it to call home.

1.  **Create a New Repository:** Go to [repo.new](https://repo.new) on GitHub. Give it a cool name (like `comet-logs` or `my-digital-diary`) and click "Create repository."

2.  **Grab the URL:** On your new repository's page, click the green `<> Code` button. You'll see a URL. **For an easier setup, I recommend using the HTTPS URL.** It looks like `https://github.com/your-username/your-cool-repo.git`. Copy it!

3.  **Give Your Computer Access:** Your computer needs permission to push to your GitHub account. If you haven't done this before, GitHub has excellent guides on [setting up authentication](https://docs.github.com/en/get-started/getting-started-with-git/setting-your-username-in-git). Using a **Personal Access Token** is the modern way to do it!

Now, back to our regular programming...

4.  Paste your repository URL into the `GIT_REPO_URL` variable in `config.sh` and make sure the line is uncommented.

### Step 5: Launch Your First Comet!

You're all set! With your terminal restarted and your configuration saved, you're ready for launch.

```bash
comet
```

And that's it! Comet will run your command, save the output, and push it to your GitHub repository. You've successfully automated the boring stuff. High five!

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
