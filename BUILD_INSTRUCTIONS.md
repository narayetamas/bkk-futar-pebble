# Building PebFUTÁR on Mac

Since Pebble is no longer officially supported, you'll need to use community-maintained tools. Here are your options:

## Option 1: GitHub Codespaces (✨ RECOMMENDED - Best Experience!)

**Build in the cloud with everything pre-configured!**

GitHub Codespaces provides a complete Pebble development environment in your browser with zero setup required.

### Quick Start

1. **Open in Codespaces**:
   - Go to https://github.com/YOUR_USERNAME/bkk-futar-pebble
   - Click the green "Code" button
   - Select "Codespaces" tab
   - Click "Create codespace on claude/initial-repo-review-011CUScUJUMkJA3qYGNWnJyX"

2. **Add Your API Key**:
   - Edit `src/js/app.js` in the VS Code editor
   - Replace `YOUR_API_KEY_HERE` on line 9 with your actual BKK API key

3. **Build the App**:
   ```bash
   pebble build
   ```

4. **Test in Emulator** (optional):
   ```bash
   pebble install --emulator basalt
   ```

5. **Download the Build**:
   - Find `build/pebfutar.pbw` in the file explorer
   - Right-click → Download
   - Transfer to your phone and open with Pebble app

### Advantages
- ✅ Nothing to install locally
- ✅ Full Pebble SDK pre-configured
- ✅ VS Code editor in browser
- ✅ Built-in emulator support
- ✅ Works on any Mac (including Apple Silicon)
- ✅ Free for GitHub users (60 hours/month)

## Option 2: CloudPebble (Simple Alternative)

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

## Option 3: Pebble SDK via Docker (Good for Local Builds)

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

## Option 4: Install Pebble SDK Natively (Advanced)

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

## 🎯 Recommendation by Use Case

Choose the best option for your needs:

1. **GitHub Codespaces** ⭐ - Best overall experience
   - Full VS Code environment in browser
   - Emulator support for testing
   - Perfect for development and debugging
   - Free for GitHub users (60 hours/month)

2. **CloudPebble** - Quickest for simple builds
   - Fastest if you just need to build and install
   - No GitHub account needed
   - Limited editor features

3. **Docker** - Best for local/offline builds
   - Build without internet after initial setup
   - Full control over build process
   - Requires Docker Desktop

4. **Native SDK** - Only if you need deep integration
   - Most complex setup
   - Python 2.7 compatibility issues on modern Macs
   - Not recommended unless necessary

**For most Mac users (including Apple Silicon), I recommend GitHub Codespaces or CloudPebble.**
