# 📋 Templates

This folder contains ready-to-use templates for common features that freshers can copy and customize.

## Available Templates

### 1. 📊 Dashboard Module
- Complete dashboard with cards, charts, and statistics
- Responsive design with grid layout
- Pull-to-refresh functionality

### 2. 👤 Profile Module  
- User profile with avatar, info, and settings
- Edit profile functionality
- Logout and account management

### 3. 📝 Settings Module
- App settings with toggles and preferences
- Theme switching
- Language selection
- Notification preferences

### 4. 📋 List Module
- Generic list with search and filter
- Pagination support
- Empty state handling
- Pull-to-refresh

### 5. 📄 Form Module
- Complete form with validation
- Different input types
- Error handling
- Submit functionality

## How to Use Templates

1. **Copy the template folder** to `lib/modules/`
2. **Rename files** to match your feature name
3. **Update class names** throughout the files
4. **Add routes** in `app_routes.dart` and `app_pages.dart`
5. **Customize** the UI and logic for your needs

## Template Structure

Each template follows this structure:
```
template_name/
├── bindings/
│   └── template_binding.dart
├── controllers/
│   └── template_controller.dart
├── components/
│   ├── template_card.dart
│   └── template_header.dart
├── models/
│   └── template_model.dart
└── template_page.dart
```

## Quick Start Commands

Use our module generator script:
```bash
# Generate from template
dart scripts/create_module.dart dashboard

# Or create manually
cp -r templates/dashboard_template lib/modules/dashboard
```

Then follow the customization steps in each template's README file.