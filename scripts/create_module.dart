#!/usr/bin/env dart

import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('❌ Please provide a module name');
    print('Usage: dart scripts/create_module.dart <module_name>');
    print('Example: dart scripts/create_module.dart dashboard');
    exit(1);
  }

  final moduleName = arguments[0].toLowerCase();
  final className = _toPascalCase(moduleName);
  
  print('🚀 Creating module: $moduleName');
  
  try {
    _createModuleStructure(moduleName, className);
    _updateRoutes(moduleName, className);
    print('✅ Module "$moduleName" created successfully!');
    print('');
    print('📝 Next steps:');
    print('1. Add your route to app_pages.dart');
    print('2. Implement your business logic in ${className}Controller');
    print('3. Design your UI in ${className}Page');
    print('4. Test your module');
  } catch (e) {
    print('❌ Error creating module: $e');
    exit(1);
  }
}

void _createModuleStructure(String moduleName, String className) {
  final moduleDir = Directory('lib/modules/$moduleName');
  
  // Create directories
  moduleDir.createSync(recursive: true);
  Directory('${moduleDir.path}/bindings').createSync();
  Directory('${moduleDir.path}/controllers').createSync();
  Directory('${moduleDir.path}/components').createSync();
  
  // Create binding file
  final bindingContent = '''import 'package:get/get.dart';
import '../controllers/${moduleName}_controller.dart';

class ${className}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ${className}Controller());
  }
}
''';
  
  File('${moduleDir.path}/bindings/${moduleName}_binding.dart')
      .writeAsStringSync(bindingContent);
  
  // Create controller file
  final controllerContent = '''import 'package:get/get.dart';

class ${className}Controller extends GetxController {
  // Observable variables
  final RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    // Initialize your controller
    _loadData();
  }
  
  void _loadData() {
    // Load initial data
  }
  
  // Add your methods here
  void onRefresh() {
    // Handle refresh
  }
}
''';
  
  File('${moduleDir.path}/controllers/${moduleName}_controller.dart')
      .writeAsStringSync(controllerContent);
  
  // Create page file
  final pageContent = '''import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthbuxus/widgets/common/base_view.dart';
import 'controllers/${moduleName}_controller.dart';

class ${className}Page extends StatelessWidget {
  const ${className}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('$className'),
          centerTitle: true,
        ),
        body: GetBuilder<${className}Controller>(
          builder: (controller) => Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _buildContent(controller),
          ),
        ),
      ),
    );
  }
  
  Widget _buildContent(${className}Controller controller) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.construction, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            '$className Page',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Start building your UI here!',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
''';
  
  File('${moduleDir.path}/${moduleName}_page.dart')
      .writeAsStringSync(pageContent);
  
  // Create sample component
  final componentContent = '''import 'package:flutter/material.dart';

class ${className}Card extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  
  const ${className}Card({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onTap,
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
''';
  
  File('${moduleDir.path}/components/${moduleName}_card.dart')
      .writeAsStringSync(componentContent);
}

void _updateRoutes(String moduleName, String className) {
  // Read current app_routes.dart
  final routesFile = File('lib/routes/app_routes.dart');
  if (!routesFile.existsSync()) {
    print('⚠️  app_routes.dart not found. Please add routes manually.');
    return;
  }
  
  final routesContent = routesFile.readAsStringSync();
  
  // Add new route constant
  final newRouteConstant = '  static const ${moduleName}Page = _Routes.$moduleName;';
  final newPrivateRoute = '  static const $moduleName = \'/$moduleName\';';
  
  // Find insertion points
  final publicRoutesEnd = routesContent.indexOf('}\n\nabstract class _Routes');
  final privateRoutesEnd = routesContent.lastIndexOf('}');
  
  if (publicRoutesEnd == -1 || privateRoutesEnd == -1) {
    print('⚠️  Could not update routes automatically. Please add manually:');
    print('Public route: $newRouteConstant');
    print('Private route: $newPrivateRoute');
    return;
  }
  
  // Insert new routes
  final updatedContent = routesContent.substring(0, publicRoutesEnd) +
      '\n$newRouteConstant' +
      routesContent.substring(publicRoutesEnd, privateRoutesEnd) +
      '\n$newPrivateRoute' +
      routesContent.substring(privateRoutesEnd);
  
  routesFile.writeAsStringSync(updatedContent);
  
  print('📝 Routes updated in app_routes.dart');
  print('💡 Don\'t forget to add the GetPage in app_pages.dart:');
  print('''
GetPage(
  name: _Routes.$moduleName,
  page: () => const ${className}Page(),
  binding: ${className}Binding(),
),''');
}

String _toPascalCase(String input) {
  return input
      .split('_')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join('');
}