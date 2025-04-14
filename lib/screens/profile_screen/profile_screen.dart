import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitacoach/get_start_screen/get_start_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 70.h),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: AssetImage(
                      'images/profile_assets/default_profile.png',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Steve',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem('Heart rate', '215bpm', Icons.favorite),
                _buildStatItem(
                  'Calories',
                  '756cal',
                  Icons.local_fire_department,
                ),
                _buildStatItem('Weight', '103lbs', Icons.monitor_weight),
              ],
            ),
            SizedBox(height: 30.h),
            _buildListItem(Icons.favorite_border, 'My Saved', () {}),
            _buildListItem(Icons.event_note, 'Appointment', () {}),
            _buildListItem(Icons.question_answer, 'FAQs', () {}),
            _buildListItem(Icons.logout, 'Logout', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetStartScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  //main widget for the stats
  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 30.sp),
        SizedBox(height: 8.h),
        Text(
          label,
          style: TextStyle(color: Colors.blueAccent, fontSize: 14.sp),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  //user card list item widget
  Widget _buildListItem(IconData icon, String text, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Card(
        color: Colors.white,
        elevation: 2,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 10.h,
          ),
          leading: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.blue, size: 20.sp),
          ),
          title: Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            color: Colors.grey[500],
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
