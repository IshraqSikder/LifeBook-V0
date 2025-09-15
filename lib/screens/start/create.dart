import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/screens/start/tutorial.dart';
import 'package:life_book/theme.dart';

class CreateCharacterScreen extends StatefulWidget {
  final Function(String name, String gender) onCharacterCreated;

  const CreateCharacterScreen({super.key, required this.onCharacterCreated});

  @override
  State<CreateCharacterScreen> createState() => _CreateCharacterScreenState();
}

class _CreateCharacterScreenState extends State<CreateCharacterScreen> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedGender = 'Male';

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32.r),
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.hardLight,
          color: Colors.black54,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24.h,
          children: [
            Column(
              spacing: 5.h,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5.w,
                  children: [
                    Image.asset(
                      'assets/images/world.png',
                      width: 16.w,
                      height: 16.h,
                    ),

                    Text(
                      'Become someone else in LifeBook',
                      style: TextStyle(
                        color: AppColors.yellowColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Start a new life!',
                  style: TextStyle(
                    color: AppColors.yellowColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            // Full Name Label
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.h,
              children: [
                Text(
                  'Full Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Name Input Field
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE2FFE7),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: TextField(
                    controller: _nameController,
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      hintStyle: GoogleFonts.inter(
                        color: Color(0xFF716D7C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 16.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // SizedBox(height: 20),

            // Select Gender Label
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12.h,
              children: [
                Text(
                  'Select Gender',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // Gender Selection Buttons
                Row(
                  spacing: 24.w,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedGender = 'Male';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.w),
                          decoration: BoxDecoration(
                            color: _selectedGender == 'Male'
                                ? AppColors.greenColor
                                : Color(0xFFE2FFE7),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            'Male',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _selectedGender == 'Male'
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedGender = 'Female';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.r),
                          decoration: BoxDecoration(
                            color: _selectedGender == 'Female'
                                ? AppColors.greenColor
                                : Color(0xFFE2FFE7),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            'Female',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _selectedGender == 'Female'
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Start Life Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_nameController.text.trim().isNotEmpty) {
                    widget.onCharacterCreated(
                      _nameController.text.trim(),
                      _selectedGender,
                    );
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TutorialScreen()),
                    );
                  } else {
                    // Show error message or highlight the field
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter your name'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE2FFE7),
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Start life!',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showCreateCharacterScreen(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return CreateCharacterScreen(
        onCharacterCreated: (String name, String gender) {
          print('Character created: $name, $gender');
        },
      );
    },
  );
}
