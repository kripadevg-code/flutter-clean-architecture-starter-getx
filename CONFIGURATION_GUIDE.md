# ⚙️ Configuration Guide

This guide helps you customize the template for your specific project needs.

## 🎯 Project Setup

### 1. Update Project Identity

#### Change App Name
1. **Update pubspec.yaml**
   ```yaml
   name: your_app_name
   description: "Your app description"
   ```

2. **Update main.dart**
   ```dart
   title: 'Your App Title', // Line 67
   ```

3. **Update Android**
   ```xml
   <!-- android/app/src/main/AndroidManifest.xml -->
   <application android:label="Your App Name">
   ```

4. **Update iOS**
   ```xml
   <!-- ios/Runner/Info.plist -->
   <key>CFBundleDisplayName</key>
   <string>Your App Name</string>
   ```

#### Change Package Name
1. **Android**: Update `android/app/build.gradle`
   ```gradle
   applicationId "com.yourcompany.yourapp"
   ```

2. **iOS**: Update bundle identifier in Xcode

### 2. App Icon and Splash Screen

#### App Icon
1. Replace icons in:
   - `android/app/src/main/res/mipmap-*/`
   - `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
   - `web/icons/`

#### Splash Screen
1. Replace `assets/images/splash/app_launch.png`
2. Update splash configuration if needed

## 🎨 Theme Customization

### 1. Colors
Edit `lib/utils/app_colors.dart`:
```dart
class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF6366F1);
  static const Color primaryVariant = Color(0xFF4F46E5);
  
  // Add your brand colors
  static const Color brandPrimary = Color(0xFF1234AB);
  static const Color brandSecondary = Color(0xFF5678CD);
}
```

### 2. Typography
Edit `lib/utils/styles/app_text_style.dart`:
```dart
class AppTextStyle {
  static TextStyle get headlineLarge => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'YourCustomFont', // Add custom font
  );
}
```

### 3. Custom Fonts
1. Add fonts to `assets/fonts/`
2. Update `pubspec.yaml`:
   ```yaml
   fonts:
     - family: YourCustomFont
       fonts:
         - asset: assets/fonts/YourFont-Regular.ttf
         - asset: assets/fonts/YourFont-Bold.ttf
           weight: 700
   ```

## 🌐 Environment Configuration

### 1. Create Environment Files
```bash
# Create environment files
touch lib/config/dev_config.dart
touch lib/config/prod_config.dart
```

### 2. Development Config
```dart
// lib/config/dev_config.dart
class DevConfig {
  static const String baseUrl = 'https://dev-api.yourapp.com';
  static const String apiKey = 'dev_api_key';
  static const bool enableLogging = true;
}
```

### 3. Production Config
```dart
// lib/config/prod_config.dart
class ProdConfig {
  static const String baseUrl = 'https://api.yourapp.com';
  static const String apiKey = 'prod_api_key';
  static const bool enableLogging = false;
}
```

### 4. Environment Manager
```dart
// lib/config/app_config.dart
import 'dev_config.dart';
import 'prod_config.dart';

class AppConfig {
  static bool get isProduction => const bool.fromEnvironment('dart.vm.product');
  
  static String get baseUrl => isProduction 
    ? ProdConfig.baseUrl 
    : DevConfig.baseUrl;
    
  static String get apiKey => isProduction 
    ? ProdConfig.apiKey 
    : DevConfig.apiKey;
}
```

## 🔐 Authentication Setup

### 1. Configure Auth Service
```dart
// lib/services/post_app_services/auth_service.dart
class AuthService extends GetxService {
  static AuthService get instance => Get.find();
  
  final String _baseUrl = AppConfig.baseUrl;
  
  Future<bool> login(String email, String password) async {
    // Your login logic
    return true;
  }
  
  Future<bool> register(Map<String, dynamic> userData) async {
    // Your registration logic
    return true;
  }
}
```

### 2. Update Dependencies
```dart
// lib/dependencies/app_dependencies.dart
static Future<void> initializeDependencies() async {
  Get.lazyPut(() => AppThemeController(), fenix: true);
  Get.lazyPut(() => AuthService(), fenix: true);
}
```

## 📡 API Integration

### 1. HTTP Client Setup
```dart
// lib/services/post_app_services/http_service.dart
import 'package:dio/dio.dart';

class HttpService extends GetxService {
  static HttpService get instance => Get.find();
  
  late Dio _dio;
  
  @override
  void onInit() {
    super.onInit();
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
    
    _setupInterceptors();
  }
  
  void _setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer ${getToken()}';
        handler.next(options);
      },
      onError: (error, handler) {
        _handleError(error);
        handler.next(error);
      },
    ));
  }
}
```

### 2. Repository Pattern
```dart
// lib/repositories/user_repository.dart
class UserRepository {
  final HttpService _httpService = HttpService.instance;
  
  Future<User> getProfile() async {
    final response = await _httpService.get('/user/profile');
    return User.fromJson(response.data);
  }
  
  Future<bool> updateProfile(User user) async {
    final response = await _httpService.put('/user/profile', user.toJson());
    return response.statusCode == 200;
  }
}
```

## 💾 Database Configuration

### 1. Hive Setup (Local Storage)
```dart
// lib/services/pre_app_services/database_service.dart
class DatabaseService {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    
    // Register adapters
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(SettingsAdapter());
    
    // Open boxes
    await Hive.openBox<User>('users');
    await Hive.openBox<Settings>('settings');
  }
}
```

### 2. Create Data Models
```dart
// lib/models/user.dart
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String id;
  
  @HiveField(1)
  String name;
  
  @HiveField(2)
  String email;
  
  User({required this.id, required this.name, required this.email});
}
```

## 🌍 Internationalization

### 1. Add Languages
```dart
// lib/translation/app_translations.dart
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'welcome': 'Welcome',
      'login': 'Login',
      'signup': 'Sign Up',
    },
    'es_ES': {
      'welcome': 'Bienvenido',
      'login': 'Iniciar Sesión',
      'signup': 'Registrarse',
    },
    'fr_FR': {
      'welcome': 'Bienvenue',
      'login': 'Connexion',
      'signup': 'S\'inscrire',
    },
  };
}
```

### 2. Use Translations
```dart
Text('welcome'.tr) // Displays translated text
```

## 🔔 Push Notifications

### 1. Add Firebase
1. Add Firebase to your project
2. Download config files:
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`

### 2. Configure Notifications
```dart
// lib/services/post_app_services/notification_service.dart
class NotificationService extends GetxService {
  static NotificationService get instance => Get.find();
  
  Future<void> initialize() async {
    await FirebaseMessaging.instance.requestPermission();
    
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  }
  
  void _handleForegroundMessage(RemoteMessage message) {
    // Handle foreground notifications
  }
  
  static Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    // Handle background notifications
  }
}
```

## 📊 Analytics Setup

### 1. Firebase Analytics
```dart
// lib/services/post_app_services/analytics_service.dart
class AnalyticsService extends GetxService {
  static AnalyticsService get instance => Get.find();
  
  late FirebaseAnalytics _analytics;
  
  @override
  void onInit() {
    super.onInit();
    _analytics = FirebaseAnalytics.instance;
  }
  
  Future<void> logEvent(String name, Map<String, dynamic> parameters) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }
  
  Future<void> setUserProperty(String name, String value) async {
    await _analytics.setUserProperty(name: name, value: value);
  }
}
```

## 🧪 Testing Configuration

### 1. Unit Tests
```dart
// test/controllers/auth_controller_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('AuthController Tests', () {
    late AuthController controller;
    
    setUp(() {
      Get.testMode = true;
      controller = AuthController();
    });
    
    test('should validate email correctly', () {
      expect(controller.isValidEmail('test@example.com'), true);
      expect(controller.isValidEmail('invalid-email'), false);
    });
  });
}
```

### 2. Widget Tests
```dart
// test/widgets/custom_button_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomButton should display text and handle tap', (tester) async {
    bool tapped = false;
    
    await tester.pumpWidget(
      MaterialApp(
        home: CustomButton(
          text: 'Test Button',
          onPressed: () => tapped = true,
        ),
      ),
    );
    
    expect(find.text('Test Button'), findsOneWidget);
    
    await tester.tap(find.byType(CustomButton));
    expect(tapped, true);
  });
}
```

## 🚀 Build Configuration

### 1. Build Scripts
Create `scripts/build.sh`:
```bash
#!/bin/bash

echo "🚀 Building Flutter App..."

# Clean
flutter clean
flutter pub get

# Build for different platforms
echo "📱 Building Android APK..."
flutter build apk --release

echo "🍎 Building iOS..."
flutter build ios --release

echo "🌐 Building Web..."
flutter build web --release

echo "✅ Build completed!"
```

### 2. CI/CD Configuration
Create `.github/workflows/build.yml`:
```yaml
name: Build and Test

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.16.0'
    - run: flutter pub get
    - run: flutter test
    - run: flutter analyze
```

## 📋 Checklist

### ✅ Basic Setup
- [ ] Update app name and package
- [ ] Replace app icon and splash screen
- [ ] Configure theme colors and fonts
- [ ] Set up environment configurations

### ✅ Services Setup
- [ ] Configure authentication service
- [ ] Set up HTTP client and repositories
- [ ] Initialize local database
- [ ] Add internationalization

### ✅ Advanced Features
- [ ] Configure push notifications
- [ ] Set up analytics
- [ ] Add crash reporting
- [ ] Configure deep linking

### ✅ Testing & Deployment
- [ ] Write unit tests
- [ ] Write widget tests
- [ ] Set up CI/CD pipeline
- [ ] Configure app signing

---

**Need help?** Check the [Development Guide](DEVELOPMENT_GUIDE.md) or create an issue on GitHub! 🚀