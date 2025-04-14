import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitacoach/screens/bottom_nav.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String gender = 'Male';
  String selectedLifestyle = 'Active';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController sleepController = TextEditingController();

  final List<String> lifestyles = ['Active', 'Moderate', 'Sedentary'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF6F6F6),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Personalized Wellness Coach',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              _buildTextField(
                controller: nameController,
                hintText: 'Enter your name',
                icon: Icons.person,
              ),
              SizedBox(height: 15.h),
              _buildTextField(
                controller: ageController,
                hintText: 'Enter your age',
                icon: Icons.cake,
              ),
              SizedBox(height: 15.h),
              _buildTextField(
                controller: weightController,
                hintText: 'Enter your weight (kg)',
                icon: Icons.monitor_weight,
              ),
              SizedBox(height: 15.h),
              _buildTextField(
                controller: sleepController,
                hintText: 'Enter your sleep hours',
                icon: Icons.bedtime,
              ),
              SizedBox(height: 25.h),
              Text(
                "Gender",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.h),
              Row(
                children:
                    ['Male', 'Female', 'Others']
                        .map(
                          (e) => Expanded(
                            child: RadioListTile<String>(
                              title: Text(e, style: TextStyle(fontSize: 14.sp)),
                              value: e,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        )
                        .toList(),
              ),
              SizedBox(height: 25.h),
              Text(
                "Lifestyle",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: DropdownButton<String>(
                  value: selectedLifestyle,
                  isExpanded: true,
                  underline: SizedBox(),
                  items:
                      lifestyles.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(fontSize: 14.sp)),
                        );
                      }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedLifestyle = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 60.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavBar(),
                      ),
                    );
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  //textfield widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, size: 20.sp),
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        ),
        keyboardType:
            hintText.contains('age') ||
                    hintText.contains('weight') ||
                    hintText.contains('sleep')
                ? TextInputType.number
                : TextInputType.text,
      ),
    );
  }
}
