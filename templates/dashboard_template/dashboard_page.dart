import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthbuxus/widgets/common/base_view.dart';
import 'controllers/dashboard_controller.dart';
import 'components/stats_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Scaffold(
        body: GetBuilder<DashboardController>(
          builder: (controller) => RefreshIndicator(
            onRefresh: controller.onRefresh,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 120.h,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.blue.shade700],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Dashboard',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(16.r),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      _buildStatsSection(controller),
                      SizedBox(height: 20.h),
                      _buildQuickActions(controller),
                      SizedBox(height: 20.h),
                      _buildRecentActivity(controller),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatsSection(DashboardController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12.h),
        Obx(() => GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 1.5,
          ),
          itemCount: controller.stats.length,
          itemBuilder: (context, index) {
            final stat = controller.stats[index];
            return StatsCard(
              title: stat.title,
              value: stat.value,
              icon: stat.icon,
              color: stat.color,
              onTap: () => controller.onStatTap(index),
            );
          },
        )),
      ],
    );
  }

  Widget _buildQuickActions(DashboardController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: controller.quickActions.length,
          itemBuilder: (context, index) {
            final action = controller.quickActions[index];
            return InkWell(
              onTap: () => controller.onQuickActionTap(index),
              child: Container(
                decoration: BoxDecoration(
                  color: action.color.withAlpha(25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(action.icon, color: action.color, size: 24),
                    const SizedBox(height: 4),
                    Text(
                      action.title,
                      style: const TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildRecentActivity(DashboardController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: controller.viewAllActivity,
              child: const Text('View All'),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.recentActivities.length,
              itemBuilder: (context, index) {
                final activity = controller.recentActivities[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 8.h),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: activity.color.withAlpha(25),
                      child: Icon(activity.icon, color: activity.color),
                    ),
                    title: Text(activity.title),
                    subtitle: Text(activity.subtitle),
                    trailing: Text(
                      activity.time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                );
              },
            ),
        ),
      ],
    );
  }
}