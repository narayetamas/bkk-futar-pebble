# Building PebFUTÁR on Mac

Since Pebble is no longer officially supported, you'll need to use community-maintained tools. Here are your options:

## Option 1: CloudPebble (Easiest - No Installation Required)

CloudPebble is still maintained by the Rebble community and works in your browser.

1. **Visit CloudPebble**: Go to https://cloudpebble.net/
2. **Create Account**: Sign up or log in with your Rebble account
3. **Import Project**:
   - Click "Import" → "Import from GitHub"
   - Or create a new project and manually upload files
4. **Add API Key**:
   - Edit `src/js/app.js`
   - Replace `YOUR_API_KEY_HERE` with your BKK API key
5. **Build**: Click "Compilation" → "Run Build"
6. **Install**:
   - Connect your phone with the Rebble Pebble app
   - Click "Install and Run"

## Option 2: Pebble SDK via Docker (Recommended for Mac)

The easiest way to use the Pebble SDK on modern Macs is through Docker.

### Prerequisites

```bash
# Install Docker Desktop for Mac
# Download from: https://www.docker.com/products/docker-desktop

# Verify Docker is installed
docker --version
```

### Build Process

```bash
# Navigate to project directory
cd /path/to/bkk-futar-pebble

# First, add your API key to src/js/app.js
# Edit line 9: var BKK_API_KEY = 'your-actual-api-key-here';

# Pull the Pebble SDK Docker image
docker pull rebble/pebble-sdk

# Build the app
docker run --rm -it -v "$(pwd):/pebble" rebble/pebble-sdk pebble build

# The build output will be in build/
# For Basalt (Pebble Time): build/pebfutar.pbw
```

### Install to Watch

```bash
# Install via Pebble phone app
# 1. Find the .pbw file in the build/ directory
# 2. Send it to your phone (AirDrop, email, etc.)
# 3. Open with the Pebble app (Rebble-enabled)
# 4. The app will install automatically
```

## Option 3: Install Pebble SDK Natively (Advanced)

For native installation on Mac, you'll need older Python and dependencies.

### Prerequisites

```bash
# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Python 2.7 (Pebble SDK requires it)
# Note: Python 2.7 is deprecated, use pyenv to install it safely
brew install pyenv
pyenv install 2.7.18
pyenv global 2.7.18

# Install required tools
brew install freetype
```

### Install Pebble SDK

```bash
# Create directory for SDK
mkdir -p ~/pebble-dev
cd ~/pebble-dev

# Download Pebble SDK (latest community version)
# Note: Official SDK is no longer available, use Rebble version
curl -O https://binaries.rebble.io/sdk-core/sdk-core-4.6-rc2-mac.tar.bz2

# Extract
tar -xjf sdk-core-4.6-rc2-mac.tar.bz2

# Add to PATH (add this to ~/.zshrc or ~/.bash_profile)
export PATH=~/pebble-dev/pebble-sdk-4.6-rc2-mac/bin:$PATH

# Install Python dependencies
pip install virtualenv
pip install --upgrade pip setuptools
```

### Build and Install

```bash
# Navigate to project
cd /path/to/bkk-futar-pebble

# Add your API key first!
# Edit src/js/app.js line 9

# Build
pebble build

# Install to connected phone
# Make sure Pebble app (Rebble) is running and watch is connected
pebble install --phone YOUR_PHONE_IP
```

## Quick Reference: File Structure

After building, you'll have:

```
bkk-futar-pebble/
├── build/
│   └── pebfutar.pbw          # Installable app package
├── src/
│   └── js/
│       └── app.js             # Main app (add API key here!)
├── resources/
│   └── images/
├── appinfo.json
└── README.md
```

## Troubleshooting

### "pebble command not found"
- Use Docker method instead
- Or ensure SDK bin directory is in your PATH

### "Connection failed"
- Ensure your phone has the Rebble Pebble app installed
- Enable "Developer Connection" in Pebble app settings
- Check that watch and phone are connected

### "Build failed - Python error"
- SDK requires Python 2.7, which is deprecated
- Use Docker method for modern Python compatibility

### API Key Issues
- Make sure you've replaced `YOUR_API_KEY_HERE` in `src/js/app.js`
- Verify your API key is valid at https://opendata.bkk.hu/

## Resources

- **Rebble Alliance**: https://rebble.io/
- **Rebble Discord**: https://discord.gg/aRUAYFN (Great for support!)
- **CloudPebble**: https://cloudpebble.net/
- **Pebble SDK Docker**: https://hub.docker.com/r/rebble/pebble-sdk

## Recommended: CloudPebble or Docker

For most Mac users, I recommend:
1. **CloudPebble** if you want the easiest option (no local setup)
2. **Docker** if you want to build locally without SDK installation hassles

Both methods work great on modern Macs including Apple Silicon (M1/M2/M3).
