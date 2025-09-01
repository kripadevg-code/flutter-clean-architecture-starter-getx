# 🏆 Best Practices Guide

This guide outlines industry-standard best practices that are already implemented in this template and should be followed when extending it.

## 🏗️ Architecture Principles

### 1. Separation of Concerns
- **Controllers**: Handle business logic only
- **Pages**: Handle UI structure only  
- **Components**: Handle reusable UI pieces
- **Services**: Handle external integrations
- **Models**: Handle data structures

```dart
// ❌ Bad: Business logic in UI
class BadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Don't do API calls here
    final response = await http.get('api/users');
    return Scaffold(/* UI code */);
  }
}

// ✅ Good: Separation of concerns
class GoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (controller) => Scaffold(/* UI code */),
    );
  }
}
```

### 2. Dependency Injection
Always use GetX dependency injection for better testability:

```dart
// ✅ Good: Proper DI
class UserController extends GetxController {
  final UserService _userService = Get.find<UserService>();
  
  void loadUsers() {
    _userService.getUsers();
  }
}
```

### 3. Single Responsibility Principle
Each class should have one reason to change:

```dart
// ❌ Bad: Multiple responsibilities
class UserManager {
  void saveUser() { /* database logic */ }
  void validateUser() { /* validation logic */ }
  void sendEmail() { /* email logic */ }
}

// ✅ Good: Single responsibility
class UserRepository {
  void saveUser() { /* only database logic */ }
}

class UserValidator {
  bool validateUser() { /* only validation logic */ }
}

class EmailService {
  void sendEmail() { /* only email logic */ }
}
```

## 🎯 State Management Best Practices

### 1. Reactive Variables
Use `.obs` for reactive state:

```dart
class MyController extends GetxController {
  // ✅ Good: Reactive variables
  final RxString userName = ''.obs;
  final RxBool isLoading = false.obs;
  final RxList<User> users = <User>[].obs;
  
  // ❌ Bad: Non-reactive variables
  String badUserName = '';
  bool badIsLoading = false;
}
```

### 2. UI Updates
Use `Obx()` for reactive UI updates:

```dart
// ✅ Good: Reactive UI
Obx(() => Text(controller.userName.value))

// ✅ Good: Conditional reactive UI
Obx(() => controller.isLoading.value 
  ? CircularProgressIndicator()
  : UserList()
)

// ❌ Bad: Manual updates
Text(controller.userName.value) // Won't update automatically
```

### 3. Controller Lifecycle
Properly manage controller lifecycle:

```dart
class MyController extends GetxController {
  late StreamSubscription _subscription;
  
  @override
  void onInit() {
    super.onInit();
    // Initialize resources
    _subscription = someStream.listen(handleData);
  }
  
  @override
  void onClose() {
    // Clean up resources
    _subscription.cancel();
    super.onClose();
  }
}
```

## 🎨 UI/UX Best Practices

### 1. Responsive Design
Always use ScreenUtil for responsive design:

```dart
// ✅ Good: Responsive
Container(
  width: 200.w,
  height: 100.h,
  padding: EdgeInsets.all(16.r),
  child: Text(
    'Hello',
    style: TextStyle(fontSize: 16.sp),
  ),
)

// ❌ Bad: Fixed sizes
Container(
  width: 200, // Fixed size
  height: 100,
  padding: EdgeInsets.all(16),
)
```

### 2. Theme Consistency
Use app theme colors and text styles:

```dart
// ✅ Good: Using app theme
Container(
  color: AppColors.primary,
  child: Text(
    'Title',
    style: AppTextStyle.headlineLarge,
  ),
)

// ❌ Bad: Hardcoded colors
Container(
  color: Colors.blue, // Hardcoded
  child: Text(
    'Title',
    style: TextStyle(fontSize: 24, color: Colors.black),
  ),
)
```

### 3. Loading States
Always handle loading states:

```dart
// ✅ Good: Loading state handling
Obx(() {
  if (controller.isLoading.value) {
    return const CircularProgressIndicator();
  }
  
  if (controller.users.isEmpty) {
    return const EmptyStateWidget();
  }
  
  return ListView.builder(
    itemCount: controller.users.length,
    itemBuilder: (context, index) => UserTile(controller.users[index]),
  );
})
```

### 4. Error Handling
Implement proper error handling:

```dart
class ApiService {
  Future<List<User>> getUsers() async {
    try {
      final response = await _dio.get('/users');
      return (response.data as List)
          .map((json) => User.fromJson(json))
          .toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // Handle unauthorized
        Get.offAllNamed('/login');
      }
      throw ApiException('Failed to load users: ${e.message}');
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }
}
```

## 📁 File Organization

### 1. Naming Conventions
- **Files**: snake_case (e.g., `user_controller.dart`)
- **Classes**: PascalCase (e.g., `UserController`)
- **Variables**: camelCase (e.g., `userName`)
- **Constants**: UPPER_SNAKE_CASE (e.g., `API_BASE_URL`)

### 2. Folder Structure
Follow the established module structure:

```
lib/modules/feature_name/
├── bindings/
│   └── feature_binding.dart
├── controllers/
│   └── feature_controller.dart
├── components/
│   ├── feature_card.dart
│   └── feature_header.dart
├── models/
│   └── feature_model.dart
└── feature_page.dart
```

### 3. Import Organization
Organize imports in this order:

```dart
// 1. Dart imports
import 'dart:async';
import 'dart:convert';

// 2. Flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 3. Package imports
import 'package:get/get.dart';
import 'package:dio/dio.dart';

// 4. Local imports
import '../controllers/user_controller.dart';
import '../models/user_model.dart';
```

## 🔒 Security Best Practices

### 1. API Keys and Secrets
Never hardcode sensitive information:

```dart
// ❌ Bad: Hardcoded secrets
const String apiKey = 'sk-1234567890abcdef';

// ✅ Good: Environment variables
class AppConfig {
  static const String apiKey = String.fromEnvironment('API_KEY');
}
```

### 2. Input Validation
Always validate user input:

```dart
class FormValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email';
    }
    
    return null;
  }
  
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    
    return null;
  }
}
```

### 3. Secure Storage
Use secure storage for sensitive data:

```dart
class SecureStorageService {
  static const _storage = FlutterSecureStorage();
  
  static Future<void> storeToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }
  
  static Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }
  
  static Future<void> clearToken() async {
    await _storage.delete(key: 'auth_token');
  }
}
```

## 🚀 Performance Best Practices

### 1. Lazy Loading
Use lazy loading for dependencies:

```dart
// ✅ Good: Lazy loading
Get.lazyPut(() => UserController());

// ❌ Bad: Eager loading (unless needed immediately)
Get.put(UserController());
```

### 2. Image Optimization
Optimize images and use caching:

```dart
// ✅ Good: Cached network image
CachedNetworkImage(
  imageUrl: user.avatarUrl,
  placeholder: (context, url) => const CircularProgressIndicator(),
  errorWidget: (context, url, error) => const Icon(Icons.error),
  width: 50.w,
  height: 50.h,
  fit: BoxFit.cover,
)
```

### 3. List Performance
Use proper list widgets for performance:

```dart
// ✅ Good: ListView.builder for large lists
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ItemTile(items[index]),
)

// ❌ Bad: Column with many children
Column(
  children: items.map((item) => ItemTile(item)).toList(),
)
```

## 🧪 Testing Best Practices

### 1. Unit Tests
Test business logic in controllers:

```dart
void main() {
  group('UserController', () {
    late UserController controller;
    late MockUserService mockUserService;
    
    setUp(() {
      mockUserService = MockUserService();
      Get.put<UserService>(mockUserService);
      controller = UserController();
    });
    
    test('should load users successfully', () async {
      // Arrange
      final users = [User(id: '1', name: 'John')];
      when(mockUserService.getUsers()).thenAnswer((_) async => users);
      
      // Act
      await controller.loadUsers();
      
      // Assert
      expect(controller.users.length, 1);
      expect(controller.users.first.name, 'John');
    });
  });
}
```

### 2. Widget Tests
Test UI components:

```dart
void main() {
  testWidgets('UserTile should display user name', (tester) async {
    // Arrange
    final user = User(id: '1', name: 'John Doe');
    
    // Act
    await tester.pumpWidget(
      MaterialApp(home: UserTile(user: user)),
    );
    
    // Assert
    expect(find.text('John Doe'), findsOneWidget);
  });
}
```

## 📊 Code Quality

### 1. Code Documentation
Document complex logic:

```dart
/// Calculates the user's subscription renewal date based on their plan type.
/// 
/// Returns null if the user doesn't have an active subscription.
/// Throws [InvalidPlanException] if the plan type is not recognized.
DateTime? calculateRenewalDate(User user) {
  if (!user.hasActiveSubscription) return null;
  
  switch (user.planType) {
    case PlanType.monthly:
      return user.subscriptionStart.add(const Duration(days: 30));
    case PlanType.yearly:
      return user.subscriptionStart.add(const Duration(days: 365));
    default:
      throw InvalidPlanException('Unknown plan type: ${user.planType}');
  }
}
```

### 2. Error Messages
Provide meaningful error messages:

```dart
// ✅ Good: Descriptive error
throw ApiException(
  'Failed to update user profile. Please check your internet connection and try again.',
);

// ❌ Bad: Generic error
throw Exception('Error');
```

### 3. Constants
Use constants for magic numbers and strings:

```dart
class AppConstants {
  static const int maxRetryAttempts = 3;
  static const Duration requestTimeout = Duration(seconds: 30);
  static const String defaultAvatarUrl = 'https://example.com/default-avatar.png';
}
```

## 🔄 Git Best Practices

### 1. Commit Messages
Use conventional commit messages:

```bash
# ✅ Good commit messages
feat: add user profile editing functionality
fix: resolve login button not responding on iOS
docs: update API integration guide
refactor: extract user validation logic to separate service

# ❌ Bad commit messages
update
fix bug
changes
```

### 2. Branch Naming
Use descriptive branch names:

```bash
# ✅ Good branch names
feature/user-profile-editing
bugfix/login-button-ios
hotfix/critical-auth-issue
refactor/user-service-cleanup

# ❌ Bad branch names
fix
update
new-feature
```

## 📋 Code Review Checklist

### ✅ Functionality
- [ ] Code works as expected
- [ ] Edge cases are handled
- [ ] Error handling is implemented
- [ ] Loading states are managed

### ✅ Code Quality
- [ ] Code follows naming conventions
- [ ] No code duplication
- [ ] Functions are small and focused
- [ ] Comments explain complex logic

### ✅ Performance
- [ ] No unnecessary rebuilds
- [ ] Proper use of lazy loading
- [ ] Images are optimized
- [ ] Lists use builders when appropriate

### ✅ Security
- [ ] No hardcoded secrets
- [ ] Input validation is implemented
- [ ] Sensitive data is stored securely
- [ ] API calls are authenticated

### ✅ Testing
- [ ] Unit tests cover business logic
- [ ] Widget tests cover UI components
- [ ] Integration tests cover user flows
- [ ] All tests pass

---

**Remember**: These practices are guidelines, not rigid rules. Use your judgment and adapt them to your specific needs while maintaining code quality and consistency! 🎯