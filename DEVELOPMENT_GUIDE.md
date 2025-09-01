# 📚 Development Guide for Freshers

This guide will help you understand how to work with this Flutter startup template and build your own features.

## 🎯 Understanding the Architecture

### 1. Module-Based Structure
Each feature in the app is organized as a **module**. For example:
- `auth/` - Handles login, signup, forgot password
- `splash/` - App startup screen
- `welcome/` - Onboarding screens

### 2. GetX Pattern
We use GetX for state management with this pattern:
- **Controller**: Business logic and state management
- **Binding**: Dependency injection setup
- **Page**: UI components
- **Components**: Reusable UI widgets

## 🛠️ Step-by-Step: Creating Your First Feature

Let's create a **Profile** module from scratch:

### Step 1: Create Folder Structure
```
lib/modules/profile/
├── bindings/
│   └── profile_binding.dart
├── controllers/
│   └── profile_controller.dart
├── components/
│   ├── profile_header.dart
│   └── profile_menu_item.dart
└── profile_page.dart
```

### Step 2: Create the Controller
```dart
// lib/modules/profile/controllers/profile_controller.dart
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Observable variables (reactive)
  final RxString userName = 'John Doe'.obs;
  final RxString userEmail = 'john@example.com'.obs;
  final RxBool isLoading = false.obs;

  // Methods
  void updateProfile(String name, String email) {
    isLoading.value = true;
    
    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      userName.value = name;
      userEmail.value = email;
      isLoading.value = false;
      
      Get.snackbar('Success', 'Profile updated successfully');
    });
  }

  void logout() {
    // Clear user data and navigate to login
    Get.offAllNamed('/signin_page');
  }
}
```

### Step 3: Create the Binding
```dart
// lib/modules/profile/bindings/profile_binding.dart
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
```

### Step 4: Create UI Components
```dart
// lib/modules/profile/components/profile_header.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),
            Obx(() => Text(
              controller.userName.value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
            Obx(() => Text(
              controller.userEmail.value,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            )),
          ],
        ),
      ),
    );
  }
}
```

### Step 5: Create the Main Page
```dart
// lib/modules/profile/profile_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthbuxus/widgets/common/base_view.dart';
import 'controllers/profile_controller.dart';
import 'components/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: GetBuilder<ProfileController>(
          builder: (controller) => Column(
            children: [
              const ProfileHeader(),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text('Edit Profile'),
                      onTap: () => _showEditDialog(controller),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: controller.logout,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditDialog(ProfileController controller) {
    final nameController = TextEditingController(text: controller.userName.value);
    final emailController = TextEditingController(text: controller.userEmail.value);

    Get.dialog(
      AlertDialog(
        title: const Text('Edit Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              controller.updateProfile(
                nameController.text,
                emailController.text,
              );
              Get.back();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
```

### Step 6: Add Routes
```dart
// In lib/routes/app_routes.dart
static const profilePage = _Routes.profile;

// In _Routes class:
static const profile = '/profile';
```

### Step 7: Register the Page
```dart
// In lib/routes/app_pages.dart
GetPage(
  name: _Routes.profile,
  page: () => const ProfilePage(),
  binding: ProfileBinding(),
),
```

## 🎨 Working with Themes and Styles

### Using App Colors
```dart
import 'package:healthbuxus/utils/app_colors.dart';

Container(
  color: AppColors.primary,
  child: Text(
    'Hello',
    style: TextStyle(color: AppColors.onPrimary),
  ),
)
```

### Using Text Styles
```dart
import 'package:healthbuxus/utils/styles/app_text_style.dart';

Text(
  'Title',
  style: AppTextStyle.headlineLarge,
)
```

### Responsive Design
```dart
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container(
  width: 200.w,  // Responsive width
  height: 100.h, // Responsive height
  padding: EdgeInsets.all(16.r), // Responsive padding
)
```

## 🔧 Working with Services

### Creating a New Service
```dart
// lib/services/post_app_services/user_service.dart
import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find();

  Future<Map<String, dynamic>> getUserProfile() async {
    // API call logic
    return {};
  }

  Future<bool> updateUserProfile(Map<String, dynamic> data) async {
    // API call logic
    return true;
  }
}
```

### Register Service in Dependencies
```dart
// lib/dependencies/app_dependencies.dart
static Future<void> initializeDependencies() async {
  Get.lazyPut(() => AppThemeController(), fenix: true);
  Get.lazyPut(() => UserService(), fenix: true); // Add this
}
```

### Use Service in Controller
```dart
class ProfileController extends GetxController {
  final UserService _userService = UserService.instance;

  Future<void> loadUserData() async {
    final userData = await _userService.getUserProfile();
    // Update UI with data
  }
}
```

## 📱 Common UI Patterns

### Loading States
```dart
Obx(() => controller.isLoading.value
  ? const CircularProgressIndicator()
  : YourContentWidget()
)
```

### Error Handling
```dart
void handleError(String error) {
  Get.snackbar(
    'Error',
    error,
    backgroundColor: Colors.red,
    colorText: Colors.white,
  );
}
```

### Navigation
```dart
// Navigate to new page
Get.toNamed('/profile');

// Replace current page
Get.offNamed('/dashboard');

// Clear stack and navigate
Get.offAllNamed('/login');

// Go back
Get.back();
```

## 🧪 Testing Your Features

### Basic Controller Test
```dart
// test/modules/profile/profile_controller_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:healthbuxus/modules/profile/controllers/profile_controller.dart';

void main() {
  group('ProfileController', () {
    late ProfileController controller;

    setUp(() {
      controller = ProfileController();
    });

    test('should update user name', () {
      controller.updateProfile('New Name', 'new@email.com');
      expect(controller.userName.value, 'New Name');
    });
  });
}
```

## 📋 Best Practices Checklist

### ✅ Code Organization
- [ ] One feature per module
- [ ] Separate UI from business logic
- [ ] Use meaningful file and class names
- [ ] Keep components small and focused

### ✅ State Management
- [ ] Use `.obs` for reactive variables
- [ ] Use `Obx()` for reactive UI updates
- [ ] Keep controllers lightweight
- [ ] Handle loading and error states

### ✅ UI/UX
- [ ] Use responsive design (ScreenUtil)
- [ ] Follow app theme and colors
- [ ] Add loading indicators
- [ ] Handle empty states
- [ ] Provide user feedback

### ✅ Performance
- [ ] Use `Get.lazyPut()` for dependencies
- [ ] Dispose controllers properly
- [ ] Optimize image loading
- [ ] Minimize widget rebuilds

## 🚀 Next Steps

1. **Practice**: Create a simple feature like "Settings" or "About"
2. **Explore**: Look at existing modules to understand patterns
3. **Experiment**: Try different GetX features like GetxService
4. **Learn**: Study Flutter and Dart documentation
5. **Build**: Start working on your own app idea!

## 🆘 Common Issues and Solutions

### Issue: Controller not found
**Solution**: Make sure you've added the binding to your route

### Issue: UI not updating
**Solution**: Use `Obx()` or `GetBuilder()` for reactive updates

### Issue: Navigation not working
**Solution**: Check route names match exactly in app_routes.dart

### Issue: Assets not loading
**Solution**: Verify asset paths in pubspec.yaml and asset constants

---

**Remember**: The best way to learn is by doing. Start small, experiment, and gradually build more complex features! 🎯