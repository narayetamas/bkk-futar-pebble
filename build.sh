#!/bin/bash
# Quick build script for PebFUTÁR using Docker

set -e

echo "🔨 Building PebFUTÁR for Pebble..."
echo ""

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed!"
    echo "Please install Docker Desktop from: https://www.docker.com/products/docker-desktop"
    exit 1
fi

# Check if API key has been set
if grep -q "YOUR_API_KEY_HERE" src/js/app.js; then
    echo "⚠️  WARNING: API key not configured!"
    echo ""
    echo "Please edit src/js/app.js and replace 'YOUR_API_KEY_HERE' with your actual API key."
    echo "Get your key from: https://opendata.bkk.hu/"
    echo ""
    read -p "Do you want to continue anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

echo "📦 Pulling Pebble SDK Docker image..."
docker pull rebble/pebble-sdk

echo ""
echo "🔧 Building app..."
docker run --rm -it -v "$(pwd):/pebble" rebble/pebble-sdk pebble build

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Build successful!"
    echo ""
    echo "📱 Install file created: build/pebfutar.pbw"
    echo ""
    echo "To install on your watch:"
    echo "1. Transfer build/pebfutar.pbw to your phone (AirDrop, email, etc.)"
    echo "2. Open the file with the Pebble app (Rebble-enabled)"
    echo "3. The app will install automatically"
    echo ""
    echo "Or use: pebble install --phone YOUR_PHONE_IP"
else
    echo ""
    echo "❌ Build failed!"
    echo "Check the error messages above for details."
    exit 1
fi
