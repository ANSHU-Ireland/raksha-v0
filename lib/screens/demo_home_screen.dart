import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoHomeScreen extends StatefulWidget {
  const DemoHomeScreen({super.key});

  @override
  State<DemoHomeScreen> createState() => _DemoHomeScreenState();
}

class _DemoHomeScreenState extends State<DemoHomeScreen> {
  bool _isRecording = false;
  bool _isSendingAlert = false;

  void _sendTextSOS() {
    setState(() => _isSendingAlert = true);
    
    // Simulate sending alert
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isSendingAlert = false);
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('🚨 Emergency alert sent to nearby users!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    });
  }

  void _toggleVoiceRecording() {
    setState(() => _isRecording = !_isRecording);
    
    if (!_isRecording) {
      // Simulate sending voice alert
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('🎤 Voice emergency alert sent!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raksha Ireland'),
        backgroundColor: const Color(0xFFE53E3E),
        foregroundColor: Colors.white,
        actions: [
          Row(
            children: [
              Text(
                'Demo User',
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(width: 8.w),
              PopupMenuButton<String>(
                icon: const Icon(Icons.account_circle),
                onSelected: (value) {
                  if (value == 'logout') {
                    Navigator.of(context).pushReplacementNamed('/auth');
                  }
                },
                itemBuilder: (context) => [
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
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Colors.green[200]!),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.shield,
                      size: 32.w,
                      color: Colors.green[600],
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'You are Protected',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Emergency services are ready to help you',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.green[600],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // Live Emergency Map Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.map,
                          size: 24.w,
                          color: Colors.blue[600],
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Live Emergency Map',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[700],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8.w,
                                height: 8.h,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'LIVE',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    
                    // Interactive Map Container
                    Container(
                      width: double.infinity,
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Stack(
                          children: [
                            // Map Background (Simulated)
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.blue[100]!,
                                    Colors.green[100]!,
                                  ],
                                ),
                              ),
                            ),
                            
                            // Grid lines for map effect
                            CustomPaint(
                              size: Size(double.infinity, 200.h),
                              painter: MapGridPainter(),
                            ),
                            
                            // Your Location Marker
                            Positioned(
                              left: 150.w,
                              top: 80.h,
                              child: Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.red.withOpacity(0.3),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person_pin_circle,
                                  color: Colors.white,
                                  size: 20.w,
                                ),
                              ),
                            ),
                            
                            // Nearby Help Markers
                            Positioned(
                              left: 80.w,
                              top: 50.h,
                              child: _buildHelpMarker('🚑', 'Ambulance\n0.8km'),
                            ),
                            Positioned(
                              right: 60.w,
                              top: 120.h,
                              child: _buildHelpMarker('👮', 'Garda\n1.2km'),
                            ),
                            Positioned(
                              left: 100.w,
                              bottom: 40.h,
                              child: _buildHelpMarker('🏥', 'Hospital\n2.1km'),
                            ),
                            
                            // Map Controls
                            Positioned(
                              top: 8.h,
                              right: 8.w,
                              child: Column(
                                children: [
                                  _buildMapButton(Icons.add, () {}),
                                  SizedBox(height: 4.h),
                                  _buildMapButton(Icons.remove, () {}),
                                  SizedBox(height: 4.h),
                                  _buildMapButton(Icons.my_location, () {}),
                                ],
                              ),
                            ),
                            
                            // Status Overlay
                            Positioned(
                              bottom: 8.h,
                              left: 8.w,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Text(
                                  'Dublin, Ireland • 3 helpers nearby',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 16.w,
                          color: Colors.blue[600],
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            'Emergency services and helpers within 3km radius',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.blue[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),

              // Emergency Buttons
              Text(
                'Emergency Actions',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 16.h),

              // Text SOS Button
              SizedBox(
                width: double.infinity,
                height: 60.h,
                child: ElevatedButton.icon(
                  onPressed: _isSendingAlert ? null : _sendTextSOS,
                  icon: _isSendingAlert 
                      ? SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.message),
                  label: Text(
                    _isSendingAlert ? 'Sending Alert...' : 'Send Text SOS',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Voice SOS Button
              SizedBox(
                width: double.infinity,
                height: 60.h,
                child: ElevatedButton.icon(
                  onPressed: _toggleVoiceRecording,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isRecording ? Colors.red[700] : const Color(0xFFE53E3E),
                  ),
                  icon: Icon(_isRecording ? Icons.stop : Icons.mic),
                  label: Text(
                    _isRecording ? 'Stop & Send Voice SOS' : 'Record Voice SOS',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(height: 32.h),

              // Demo Emergency Alerts
              Text(
                'Demo Emergency Alerts',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 16.h),

              // Sample Alert
              Container(
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
                            'Demo User needs help!',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[700],
                            ),
                          ),
                        ),
                        Text(
                          '2m ago',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Emergency assistance needed near Temple Bar area',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Location: Dublin City Centre (Demo)',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 36.h,
                            child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Demo: Response sent!'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[600],
                              ),
                              child: Text(
                                'Respond',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: SizedBox(
                            height: 36.h,
                            child: OutlinedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Demo: Emergency services called!'),
                                    backgroundColor: Colors.blue,
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.red[600]!),
                              ),
                              child: Text(
                                'Call 999',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.red[600],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

  // Helper method to build map control buttons
  Widget _buildMapButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 32.w,
      height: 32.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 16.w),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }

  // Helper method to build emergency service markers
  Widget _buildHelpMarker(String emoji, String label) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('📞 Contacting $label'),
            backgroundColor: Colors.blue,
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.blue[300]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 2.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for map grid lines
class MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 1.0;

    // Draw vertical lines
    for (int i = 0; i < 6; i++) {
      final x = (size.width / 5) * i;
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    // Draw horizontal lines
    for (int i = 0; i < 4; i++) {
      final y = (size.height / 3) * i;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}