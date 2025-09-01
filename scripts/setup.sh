#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Welcome message
echo -e "${BLUE}"
echo "🚀 Flutter Startup Template Setup"
echo "=================================="
echo -e "${NC}"

# Check Flutter installation
print_status "Checking Flutter installation..."
if command_exists flutter; then
    FLUTTER_VERSION=$(flutter --version | head -n 1)
    print_success "Flutter found: $FLUTTER_VERSION"
else
    print_error "Flutter is not installed. Please install Flutter first."
    echo "Visit: https://docs.flutter.dev/get-started/install"
    exit 1
fi

# Check Dart installation
print_status "Checking Dart installation..."
if command_exists dart; then
    DART_VERSION=$(dart --version)
    print_success "Dart found: $DART_VERSION"
else
    print_error "Dart is not installed. Please install Dart first."
    exit 1
fi

# Flutter doctor check
print_status "Running Flutter doctor..."
flutter doctor

# Get dependencies
print_status "Getting Flutter dependencies..."
flutter pub get

if [ $? -eq 0 ]; then
    print_success "Dependencies installed successfully"
else
    print_error "Failed to install dependencies"
    exit 1
fi

# Generate necessary files
print_status "Generating necessary files..."

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    print_status "Creating .env file..."
    cat > .env << EOL
# Environment Configuration
APP_NAME=Your App Name
APP_VERSION=1.0.0
API_BASE_URL=https://api.yourapp.com
API_KEY=your_api_key_here
ENABLE_LOGGING=true
EOL
    print_success ".env file created"
else
    print_warning ".env file already exists"
fi

# Create launch.json for VS Code if .vscode directory exists
if [ -d ".vscode" ]; then
    print_status "Creating VS Code launch configuration..."
    mkdir -p .vscode
    cat > .vscode/launch.json << EOL
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Debug",
            "request": "launch",
            "type": "dart",
            "program": "lib/main.dart",
            "args": ["--flavor", "dev"]
        },
        {
            "name": "Profile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile",
            "program": "lib/main.dart"
        },
        {
            "name": "Release",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release",
            "program": "lib/main.dart"
        }
    ]
}
EOL
    print_success "VS Code launch configuration created"
fi

# Make scripts executable
print_status "Making scripts executable..."
chmod +x scripts/*.sh
chmod +x scripts/*.dart
print_success "Scripts are now executable"

# Project customization prompts
echo ""
echo -e "${YELLOW}📝 Project Customization${NC}"
echo "========================="

read -p "Enter your app name (default: Your App Name): " APP_NAME
APP_NAME=${APP_NAME:-"Your App Name"}

read -p "Enter your package name (default: com.example.yourapp): " PACKAGE_NAME
PACKAGE_NAME=${PACKAGE_NAME:-"com.example.yourapp"}

read -p "Enter your app description (default: A Flutter startup template): " APP_DESCRIPTION
APP_DESCRIPTION=${APP_DESCRIPTION:-"A Flutter startup template"}

# Update pubspec.yaml
print_status "Updating pubspec.yaml..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i '' "s/name: healthbuxus/name: ${PACKAGE_NAME##*.}/" pubspec.yaml
    sed -i '' "s/description: \"A new Flutter project.\"/description: \"$APP_DESCRIPTION\"/" pubspec.yaml
else
    # Linux
    sed -i "s/name: healthbuxus/name: ${PACKAGE_NAME##*.}/" pubspec.yaml
    sed -i "s/description: \"A new Flutter project.\"/description: \"$APP_DESCRIPTION\"/" pubspec.yaml
fi

# Update main.dart
print_status "Updating main.dart..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/title: 'Your App Title',/title: '$APP_NAME',/" lib/main.dart
else
    sed -i "s/title: 'Your App Title',/title: '$APP_NAME',/" lib/main.dart
fi

print_success "Project configuration updated"

# Clean and get dependencies again
print_status "Cleaning and rebuilding..."
flutter clean
flutter pub get

# Final checks
print_status "Running final checks..."
flutter analyze

if [ $? -eq 0 ]; then
    print_success "Code analysis passed"
else
    print_warning "Code analysis found some issues. Please review them."
fi

# Success message
echo ""
echo -e "${GREEN}🎉 Setup Complete!${NC}"
echo "==================="
echo ""
echo "Your Flutter startup template is ready to use!"
echo ""
echo "Next steps:"
echo "1. Run 'flutter run' to start the app"
echo "2. Read DEVELOPMENT_GUIDE.md to learn how to add features"
echo "3. Check CONFIGURATION_GUIDE.md for advanced setup"
echo "4. Follow BEST_PRACTICES.md for coding standards"
echo ""
echo "Quick commands:"
echo "• Create new module: dart scripts/create_module.dart <module_name>"
echo "• Run tests: flutter test"
echo "• Build APK: flutter build apk --release"
echo ""
echo -e "${BLUE}Happy coding! 🚀${NC}"