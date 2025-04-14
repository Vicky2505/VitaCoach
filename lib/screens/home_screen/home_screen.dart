import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '👋 Hello, Steve!',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Your Wellness Dashboard',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 96.w),
                  CircleAvatar(
                    radius: 25.sp,
                    backgroundImage: AssetImage(
                      'images/profile_assets/default_profile.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              _buildHealthOverview(),
              SizedBox(height: 30.h),
              Text(
                'Latest Health Reports',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10.h),
              _buildReportTile('General Health Report', 'Jul 10, 2023'),
              SizedBox(height: 5.h),
              _buildReportTile('Blood Pressure Report', 'Jul 5, 2023'),
              SizedBox(height: 5.h),
              _buildReportTile('Cholesterol Report', 'Jun 20, 2023'),
              SizedBox(height: 4.h),
              // Center(
              //   child: ElevatedButton.icon(
              //     onPressed: () {},
              //     icon: Icon(Icons.play_arrow, size: 20.sp),
              //     label: Text(
              //       'Start Wellness Tasks',
              //       style: TextStyle(fontSize: 16.sp),
              //     ),
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.green,
              //       foregroundColor: Colors.white,
              //       padding: EdgeInsets.symmetric(
              //         horizontal: 30.w,
              //         vertical: 15.h,
              //       ),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12.r),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }

  //health overview section
  Widget _buildHealthOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLargeHeartCard(),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildInfoCard(
              title: 'Blood Group',
              value: 'A+',
              icon: Icons.bloodtype,
              background: Color(0xFFA76686),
              iconColor: Colors.deepPurple.shade900,
            ),
            _buildInfoCard(
              title: 'Weight',
              value: '103lbs',
              icon: Icons.fitness_center,
              background: Color(0xFFF8EDD7),
              iconColor: Colors.brown.shade400,
            ),
          ],
        ),
      ],
    );
  }

  // Large heart card with graph
  Widget _buildLargeHeartCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(16.r),
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Heart rate',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '97',
                    style: TextStyle(
                      fontSize: 48.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Text(
                      'bpm',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            'images/home_assets/heart_graph.png',
            width: 150.w,
            height: 90.h,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  // Info card for health metrics
  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required Color background,
    required Color iconColor,
  }) {
    return Container(
      width: 140.w,
      height: 136.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24.sp, color: iconColor),
          SizedBox(height: 12.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  //Report card for health reports
  Widget _buildReportTile(String title, String date) {
    return Container(
      width: double.infinity,
      height: 90.h,
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        leading: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(Icons.description, color: Colors.blue, size: 24.sp),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Text(
            date,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
          ),
        ),
        trailing: Icon(
          Icons.more_vert,
          size: 22.sp,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
