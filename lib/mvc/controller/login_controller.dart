import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:interview_practice/routes/app_routes.dart';

import '../../utils/apis.dart';

class LoginController extends GetxController {
  //declare two controller
  TextEditingController userMailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

  //variable
  var loginDetailTxt = 'Login Details';
  var userHint = 'Username, email & phone number';
  var passwordHint = 'Password';
  var forgetPassTxt = 'Forgot Password ?';
  var loginBtnTxt = 'Login';
  var signupWithTxt = 'Or Sign up With';
  var userValidMail = 'eve.holt@reqres.in';
  var errorMailTxt = "Please enter valid email !";
  var errorPasswordTxt = "Please enter any password !";
  var isShowError = false.obs;
  // var isLoading = false.obs;

  @override
  void onInit() {
    userLogin();
    super.onInit();
  }

  void userLogin() async {
    try {
      // isLoading(true);
      //response data from server
      var response = await post(Uri.parse(Apis.baseUrl + Apis.loginPostPath),
          body: {
            'email': userMailController.text,
            'password': userPasswordController.text
          });

      if (response.statusCode == 200) {
        // var data = jsonDecode(response.body.toString());
        // debugPrint(data['token']);
        Get.offNamedUntil(AppRoutes.userList, (route) => false);
      }
    } catch (e) {
      debugPrint('$e');
    } finally {
      // isLoading(false);
    }
  }
}
