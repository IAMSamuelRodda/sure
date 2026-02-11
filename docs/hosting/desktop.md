# Desktop Launcher (Linux)

Launch Sure from your application dock/menu on Linux desktops.

## Setup

1. **Copy the launch script:**
   ```bash
   cp docs/hosting/desktop/sure-launch.sh ~/.local/bin/sure-launch.sh
   chmod +x ~/.local/bin/sure-launch.sh
   ```

2. **Copy the icon:**
   ```bash
   cp docs/hosting/desktop/sure-icon.svg ~/.local/share/icons/sure.svg
   ```

3. **Install the desktop entry:**
   ```bash
   # Copy and expand $HOME in the desktop file
   envsubst < docs/hosting/desktop/sure.desktop > ~/.local/share/applications/sure.desktop
   update-desktop-database ~/.local/share/applications/
   ```

4. **Pin to dock:** Search "Sure" in your app launcher, right-click, and pin.

## Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `SURE_COMPOSE_FILE` | `~/docker-apps/sure/compose.yml` | Path to compose file |
| `SURE_URL` | `http://sure.localhost:3000` | URL to open after launch |

## What it does

The launcher starts the Docker Compose stack (if not already running), waits for the web server to be healthy, then opens the app in your default browser.
