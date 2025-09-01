# 🚀 Flutter Startup Template

A production-ready Flutter boilerplate designed for startups and freshers to quickly build scalable mobile applications.

## ✨ Features

- 🏗️ **Clean Architecture** - Modular structure with separation of concerns
- 🎨 **Theme Management** - Light/Dark theme support with easy customization
- 🌐 **Internationalization** - Multi-language support ready
- 📱 **Responsive Design** - Works on all screen sizes
- 🔐 **Authentication Flow** - Complete auth module with login/signup
- 🗂️ **State Management** - GetX for efficient state management
- 💾 **Local Storage** - Hive for fast local data storage
- 🌐 **Network Layer** - HTTP client with error handling
- 🎯 **Dependency Injection** - Clean DI pattern
- 📋 **Form Validation** - Ready-to-use form components

## 🏁 Quick Start

### Prerequisites
- Flutter SDK (>=3.2.4)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd StartupAppTemplate
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── assets/                 # Asset path constants
├── constants/             # App-wide constants
├── dependencies/          # Dependency injection setup
├── enums/                # Enum definitions
├── extensions/           # Dart extensions
├── global/               # Global configurations
├── modules/              # Feature modules
│   ├── auth/            # Authentication module
│   ├── splash/          # Splash screen
│   └── welcome/         # Welcome screens
├── routes/               # App routing
├── services/            # Business logic services
├── themes/              # Theme management
├── translation/         # Internationalization
├── utils/               # Utility functions
└── widgets/             # Reusable widgets
```

## 🛠️ How to Add New Features

### Creating a New Module (e.g., Dashboard)

1. **Create module folder structure**
   ```
   lib/modules/dashboard/
   ├── bindings/
   │   └── dashboard_binding.dart
   ├── controllers/
   │   └── dashboard_controller.dart
   ├── components/
   │   └── dashboard_card.dart
   └── dashboard_page.dart
   ```

2. **Create the controller**
   ```dart
   // lib/modules/dashboard/controllers/dashboard_controller.dart
   import 'package:get/get.dart';
   
   class DashboardController extends GetxController {
     // Your business logic here
   }
   ```

3. **Create the binding**
   ```dart
   // lib/modules/dashboard/bindings/dashboard_binding.dart
   import 'package:get/get.dart';
   import '../controllers/dashboard_controller.dart';
   
   class DashboardBinding extends Bindings {
     @override
     void dependencies() {
       Get.lazyPut(() => DashboardController());
     }
   }
   ```

4. **Add route in app_routes.dart**
   ```dart
   static const dashboardPage = _Routes.dashboard;
   // In _Routes class:
   static const dashboard = '/dashboard';
   ```

5. **Add page in app_pages.dart**
   ```dart
   GetPage(
     name: _Routes.dashboard,
     page: () => const DashboardPage(),
     binding: DashboardBinding(),
   ),
   ```

## 🎨 Customization Guide

### Changing App Theme
1. Edit colors in `lib/utils/app_colors.dart`
2. Modify text styles in `lib/utils/styles/app_text_style.dart`
3. Update theme configurations in `lib/themes/`

### Adding New Assets
1. Place assets in `assets/` folder
2. Update `pubspec.yaml`
3. Add constants in `lib/assets/`

### Environment Configuration
1. Create `.env` files for different environments
2. Update configurations in `lib/constants/`

## 📚 Documentation

| Document | Description |
|----------|-------------|
| [📋 Project Overview](PROJECT_OVERVIEW.md) | Complete architecture and technology overview |
| [🚀 Development Guide](DEVELOPMENT_GUIDE.md) | Step-by-step guide for freshers |
| [⚙️ Configuration Guide](CONFIGURATION_GUIDE.md) | Customize the template for your needs |
| [🏆 Best Practices](BEST_PRACTICES.md) | Industry-standard coding practices |
| [📋 Templates](templates/README.md) | Ready-to-use feature templates |

## 📚 Key Concepts for Freshers

### State Management with GetX
- **Controllers**: Handle business logic and state
- **Bindings**: Manage dependency injection
- **GetX Widgets**: Reactive UI updates

### Project Architecture
- **Modules**: Feature-based organization
- **Services**: Shared business logic
- **Utils**: Helper functions and constants
- **Widgets**: Reusable UI components

### Best Practices Implemented
- Separation of concerns
- Dependency injection
- Reactive programming
- Clean code principles
- Scalable folder structure

## 🔧 Available Scripts

```bash
# Quick setup (run once after cloning)
./scripts/setup.sh

# Create new module
dart scripts/create_module.dart <module_name>

# Run the app
flutter run

# Build for production
flutter build apk --release
flutter build ios --release

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
dart format .
```

## 📦 Dependencies

### Core Dependencies
- `get`: State management and routing
- `flutter_screenutil`: Responsive design
- `hive`: Local storage
- `connectivity_plus`: Network connectivity

### UI Dependencies
- `flutter_svg`: SVG support
- `pinput`: OTP input
- `country_picker`: Country selection

### Development Dependencies
- `flutter_lints`: Code linting
- `talker_flutter`: Logging

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

If you have any questions or need help:
1. Check the documentation
2. Look at existing modules for examples
3. Create an issue on GitHub

---

**Happy Coding! 🎉**
