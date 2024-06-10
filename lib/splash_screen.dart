import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inner_journal_app/utils/app_colors.dart';
import 'package:inner_journal_app/utils/app_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text('Hello', style: AppStyles.appBarHeadingTextStyle().copyWith(
                fontSize: 100.sp,
                fontWeight: FontWeight.w700
              ),),
            )
          ],
        ),
      ),
    );
  }
}