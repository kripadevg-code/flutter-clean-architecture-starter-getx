import 'package:flutter/material.dart';

class StatItem {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  StatItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
}

class QuickAction {
  final String title;
  final IconData icon;
  final Color color;

  QuickAction({
    required this.title,
    required this.icon,
    required this.color,
  });
}

class ActivityItem {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;
  final Color color;

  ActivityItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    required this.color,
  });
}

class DashboardData {
  final List<StatItem> stats;
  final List<QuickAction> quickActions;
  final List<ActivityItem> recentActivities;

  DashboardData({
    required this.stats,
    required this.quickActions,
    required this.recentActivities,
  });

  // Factory method for creating from API response
  factory DashboardData.empty() {
    return DashboardData(
      stats: [],
      quickActions: [],
      recentActivities: [],
    );
  }


}