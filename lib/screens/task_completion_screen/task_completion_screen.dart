import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskCompletionScreen extends StatefulWidget {
  const TaskCompletionScreen({super.key});

  @override
  State<TaskCompletionScreen> createState() => _TaskCompletionScreenState();
}

class _TaskCompletionScreenState extends State<TaskCompletionScreen> {
  final List<String> _tasks = [
    'Eat more vegetables with meals',
    'Go for a brisk walk',
    'Avoid screens before bedtime',
    'Practice deep breathing',
    'Drink more water throughout the day',
    'Take a break from social media',
  ];

  late List<bool> _taskCompletion;

  int get completedTasks =>
      _taskCompletion.where((completed) => completed).length;

  @override
  void initState() {
    super.initState();
    _taskCompletion = List<bool>.filled(_tasks.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        title: Text(
          'Daily Tasks',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Color(0xFFF6F6F6),
        foregroundColor: Colors.black87,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's Suggestions",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder:
                    (context, index) => _buildTaskCard(_tasks[index], index),
              ),
            ),
            SizedBox(height: 20.h),
            _buildPointsCard(),
          ],
        ),
      ),
    );
  }

  // Widget to build each task card
  Widget _buildTaskCard(String task, int index) {
    final completed = _taskCompletion[index];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          color: completed ? Colors.green.shade50 : Colors.white,
          elevation: 0,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            leading: Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: completed ? Colors.green : Colors.grey.shade400,
              ),
              child: Icon(
                completed ? Icons.check : Icons.circle_outlined,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
            title: Text(
              task,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: completed ? Colors.green.shade800 : Colors.black87,
                decoration:
                    completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
              ),
            ),
            trailing: Switch(
              value: completed,
              onChanged: (val) {
                setState(() => _taskCompletion[index] = val);
              },
              activeColor: Colors.green,
            ),
          ),
        ),
      ),
    );
  }

  // Widget to build the points card
  Widget _buildPointsCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Center(
        child: Text(
          '🎯 Points Earned: ${completedTasks * 5}',
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
