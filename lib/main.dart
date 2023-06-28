import 'package:flutter/material.dart';
import 'package:interview_practice/routes/app_pages.dart';
import 'package:interview_practice/theme/app_theme.dart';
import 'package:interview_practice/utils/app_constant.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstant.appName,
      theme: AppTheme.myAppTheme,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pageList,
    );
  }
}
