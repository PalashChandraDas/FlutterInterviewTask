import 'package:get/get.dart';
import 'package:interview_practice/mvc/view/login_screen.dart';
import 'package:interview_practice/mvc/view/user_list_screen.dart';
import 'package:interview_practice/routes/app_routes.dart';

class AppPages {
  static var pageList = [
    GetPage(name: AppRoutes.login, page: () => LoginScreen(),),
    GetPage(name: AppRoutes.userList, page: () => UserListScreen(),),
  ];
}
