#!/bin/bash

# Vercel build script for Flutter web app
echo "🚀 Building Raksha Ireland for Vercel deployment..."

# Install Flutter if not available
if ! command -v flutter &> /dev/null; then
    echo "📦 Installing Flutter..."
    git clone https://github.com/flutter/flutter.git -b stable
    export PATH="$PATH:`pwd`/flutter/bin"
fi

# Get Flutter version
flutter --version

# Enable web support
flutter config --enable-web

# Get dependencies
echo "📦 Installing dependencies..."
flutter pub get

# Build for web
echo "🔨 Building Flutter web app..."
flutter build web --release

echo "✅ Build complete! Output in build/web/"