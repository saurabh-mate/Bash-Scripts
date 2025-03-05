# Bash Scripts Collection

## Repository: `saurabh-mate-bash-scripts`

This repository contains a collection of useful Bash scripts for various automation tasks, including file archiving, audio alerts, Docker automation, and file monitoring.

## Scripts Overview

### 1. `archive.sh`
A script to archive a given directory using either `tar` or `zip`.

**Usage:**
```sh
./archive.sh <directory_name>
```

- Displays the directory size.
- Prompts the user to choose an archive method (`tar` or `zip`).
- Creates an archive and displays its size.

### 2. `beep.sh`
A script to play an audio notification using `aplay`.

**Usage:**
```sh
./beep.sh
```

- Plays the sound file located at `/home/saurabh/Downloads/jai-shree-ram-notification-ringtone-tone-60275.wav`.

### 3. `docker_hub.sh`
A script to automate Docker container management and image deployment to Docker Hub.

**Usage:**
```sh
./docker_hub.sh
```

- Builds a Docker image from the portfolio website.
- Stops and removes an existing container if running.
- Runs a new container.
- Tags and pushes the image to Docker Hub.

### 4. `file_monitor.sh`
A script to monitor file changes in a given directory and detect significant file size increases.

**Usage:**
```sh
./file_monitor.sh <directory_name>
```

- Monitors the specified directory using `inotifywait`.
- Detects file size changes and logs increases greater than 10%.
- Displays disk usage periodically.

## Requirements
Ensure the following packages are installed on your system:

- `bash`
- `tar`, `zip`
- `docker`
- `inotify-tools`
- `numfmt`
- `aplay` (for beep.sh)

## Author
[Saurabh Dnyaneshwar Mate](https://github.com/saurabh-mate)

## License
This project is open-source and available under the MIT License.

