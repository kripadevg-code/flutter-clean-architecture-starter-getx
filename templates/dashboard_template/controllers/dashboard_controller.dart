import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/dashboard_models.dart';

class DashboardController extends GetxController {
  // Observable variables
  final RxBool isLoading = false.obs;
  final RxList<StatItem> stats = <StatItem>[].obs;
  final RxList<QuickAction> quickActions = <QuickAction>[].obs;
  final RxList<ActivityItem> recentActivities = <ActivityItem>[].obs;
  final RxString userName = 'John Doe'.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeData();
    _loadDashboardData();
  }

  void _initializeData() {
    // Initialize stats
    stats.addAll([
      StatItem(
        title: 'Total Sales',
        value: '\$12,345',
        icon: Icons.trending_up,
        color: Colors.green,
      ),
      StatItem(
        title: 'Orders',
        value: '156',
        icon: Icons.shopping_cart,
        color: Colors.blue,
      ),
      StatItem(
        title: 'Customers',
        value: '1,234',
        icon: Icons.people,
        color: Colors.orange,
      ),
      StatItem(
        title: 'Revenue',
        value: '\$8,901',
        icon: Icons.attach_money,
        color: Colors.purple,
      ),
    ]);

    // Initialize quick actions
    quickActions.addAll([
      QuickAction(
        title: 'Add Product',
        icon: Icons.add_box,
        color: Colors.blue,
      ),
      QuickAction(
        title: 'View Orders',
        icon: Icons.list_alt,
        color: Colors.green,
      ),
      QuickAction(
        title: 'Analytics',
        icon: Icons.analytics,
        color: Colors.purple,
      ),
      QuickAction(
        title: 'Settings',
        icon: Icons.settings,
        color: Colors.grey,
      ),
    ]);
  }

  Future<void> _loadDashboardData() async {
    isLoading.value = true;
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Load recent activities
      recentActivities.addAll([
        ActivityItem(
          title: 'New order received',
          subtitle: 'Order #12345 from John Smith',
          time: '2 min ago',
          icon: Icons.shopping_bag,
          color: Colors.green,
        ),
        ActivityItem(
          title: 'Payment processed',
          subtitle: 'Payment of \$299.99 completed',
          time: '15 min ago',
          icon: Icons.payment,
          color: Colors.blue,
        ),
        ActivityItem(
          title: 'Product updated',
          subtitle: 'iPhone 15 Pro stock updated',
          time: '1 hour ago',
          icon: Icons.inventory,
          color: Colors.orange,
        ),
        ActivityItem(
          title: 'New customer',
          subtitle: 'Sarah Johnson joined',
          time: '2 hours ago',
          icon: Icons.person_add,
          color: Colors.purple,
        ),
      ]);
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load dashboard data',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> onRefresh() async {
    recentActivities.clear();
    await _loadDashboardData();
    Get.snackbar(
      'Success',
      'Dashboard refreshed',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  void onStatTap(int index) {
    final stat = stats[index];
    Get.snackbar(
      stat.title,
      'Viewing ${stat.title.toLowerCase()} details',
      backgroundColor: stat.color,
      colorText: Colors.white,
    );
    
    // Navigate to specific stat page
    switch (index) {
      case 0:
        // Navigate to sales page
        break;
      case 1:
        // Navigate to orders page
        break;
      case 2:
        // Navigate to customers page
        break;
      case 3:
        // Navigate to revenue page
        break;
    }
  }

  void onQuickActionTap(int index) {
    final action = quickActions[index];
    Get.snackbar(
      action.title,
      'Opening ${action.title.toLowerCase()}...',
      backgroundColor: action.color,
      colorText: Colors.white,
    );
    
    // Handle quick action navigation
    switch (index) {
      case 0:
        // Navigate to add product
        break;
      case 1:
        // Navigate to orders
        break;
      case 2:
        // Navigate to analytics
        break;
      case 3:
        // Navigate to settings
        break;
    }
  }

  void viewAllActivity() {
    Get.snackbar(
      'Activity',
      'Opening activity history...',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
    // Navigate to activity page
  }

  void onNotificationTap() {
    Get.snackbar(
      'Notifications',
      'Opening notifications...',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
    // Navigate to notifications
  }

  void onProfileTap() {
    Get.snackbar(
      'Profile',
      'Opening profile...',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
    // Navigate to profile
  }
}