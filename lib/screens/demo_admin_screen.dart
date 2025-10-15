import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoAdminScreen extends StatefulWidget {
  const DemoAdminScreen({super.key});

  @override
  State<DemoAdminScreen> createState() => _DemoAdminScreenState();
}

class _DemoAdminScreenState extends State<DemoAdminScreen> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: const Color(0xFFE53E3E),
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.account_circle),
            onSelected: (value) {
              if (value == 'logout') {
                Navigator.of(context).pushReplacementNamed('/auth');
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'profile',
                child: Text('Admin: Demo User'),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.pending_actions), text: 'Pending'),
            Tab(icon: Icon(Icons.people), text: 'Users'),
            Tab(icon: Icon(Icons.emergency), text: 'Alerts'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPendingUsersTab(),
          _buildApprovedUsersTab(),
          _buildActiveAlertsTab(),
        ],
      ),
    );
  }

  Widget _buildPendingUsersTab() {
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: 3,
      itemBuilder: (context, index) {
        final users = [
          {'name': 'John Doe', 'email': 'john@example.com', 'phone': '+353 87 123 4567', 'age': '28', 'sex': 'Male'},
          {'name': 'Maria Silva', 'email': 'maria@example.com', 'phone': '+353 85 987 6543', 'age': '34', 'sex': 'Female'},
          {'name': 'Ahmed Hassan', 'email': 'ahmed@example.com', 'phone': '+353 86 456 7890', 'age': '25', 'sex': 'Male'},
        ];
        
        final user = users[index];
        
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.orange[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 24.w,
                      color: Colors.orange[600],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user['name']!,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          user['email']!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      'PENDING',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[700],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              
              // User Details
              Row(
                children: [
                  _buildDetailItem('Phone', user['phone']!),
                  SizedBox(width: 24.w),
                  _buildDetailItem('Age', user['age']!),
                  SizedBox(width: 24.w),
                  _buildDetailItem('Sex', user['sex']!),
                ],
              ),
              SizedBox(height: 16.h),
              
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${user['name']} approved! Approval email sent.'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[600],
                        ),
                        child: const Text('Approve'),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: SizedBox(
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${user['name']} registration rejected.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[600],
                        ),
                        child: const Text('Reject'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey[500],
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildApprovedUsersTab() {
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: 5,
      itemBuilder: (context, index) {
        final users = [
          {'name': 'Sarah O\'Connor', 'email': 'sarah@example.com', 'online': true},
          {'name': 'Michael Ryan', 'email': 'michael@example.com', 'online': false},
          {'name': 'Elena Popov', 'email': 'elena@example.com', 'online': true},
          {'name': 'David Chen', 'email': 'david@example.com', 'online': true},
          {'name': 'Lisa Murphy', 'email': 'lisa@example.com', 'online': false},
        ];
        
        final user = users[index];
        
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: user['online'] as bool ? Colors.green[100] : Colors.grey[100],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Icon(
                  Icons.person,
                  size: 20.w,
                  color: user['online'] as bool ? Colors.green[600] : Colors.grey[600],
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user['name'] as String,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      user['email'] as String,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: user['online'] as bool ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActiveAlertsTab() {
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: 2,
      itemBuilder: (context, index) {
        final alerts = [
          {
            'name': 'Emergency Alert',
            'user': 'Sarah O\'Connor',
            'message': 'Need immediate help near Grafton Street',
            'location': 'Dublin City Centre',
            'time': '5 minutes ago',
          },
          {
            'name': 'Voice Alert',
            'user': 'Michael Ryan',
            'message': 'Voice message recorded',
            'location': 'Temple Bar Area',
            'time': '12 minutes ago',
          },
        ];
        
        final alert = alerts[index];
        
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.red[50],
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.red[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.emergency,
                    color: Colors.red[600],
                    size: 20.w,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      '${alert['user']} - ${alert['name']}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[700],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'Message: ${alert['message']}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Location: ${alert['location']}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Time: ${alert['time']}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}