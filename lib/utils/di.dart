import 'package:get/get.dart';
import 'package:interview_practice/mvc/controller/all_controller.dart';

class MyDI extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => UserListController());
  }
}
