import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interview_practice/mvc/controller/all_controller.dart';
import 'package:get/get.dart';
import 'package:interview_practice/utils/app_constant.dart';
import 'package:interview_practice/utils/app_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _loginController.loginFormKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 25,
                  left: 25,
                  right: 25,
                ),
                child: Column(
                  children: [
                    _loginTopImgWidget(),
                    AppConstant.maxSizeBox,
                    _loginDetailTxtWidget(),
                    const SizedBox(
                      height: 30,
                    ),
                    _userMailFieldWidget(),
                    AppConstant.minSizeBox,
                    _userPasswordFieldWidget(),
                    AppConstant.minSizeBox,
                    _forgetPasswordWidget(),
                    AppConstant.maxSizeBox,
                    _loginButtonWidget(),
                    AppConstant.maxSizeBox,
                    _singUpWidget(),
                    AppConstant.maxSizeBox,
                  ],
                ),
              ),
            ),
            _myStackWidget()
          ],
        ),
      ),
    );
  }

  _loginTopImgWidget() {
    return Image.asset(_loginController.isShowError.value
        ? AppImage.loginTopImgError
        : AppImage.loginTopImg);
  }

  _loginDetailTxtWidget() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          _loginController.loginDetailTxt,
          style: TextStyle(
              color: AppConstant.primaryTextColor(),
              fontWeight: FontWeight.w500,
              fontSize: 24),
        ));
  }

  _userMailFieldWidget() {
    return TextFormField(
      controller: _loginController.userMailController,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      decoration: InputDecoration(
          hintText: _loginController.userHint,
          border: const OutlineInputBorder(),
          errorStyle:
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
      validator: (v) {
        if (v != _loginController.userValidMail) {
          setState(() {});
          _loginController.isShowError.value = true;
          return _loginController.errorMailTxt;
        }
        return null;
      },
    );
  }

  _userPasswordFieldWidget() {
    return TextFormField(
      controller: _loginController.userPasswordController,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      decoration: InputDecoration(
        hintText: _loginController.passwordHint,
        border: const OutlineInputBorder(),
      ),
    );
  }

  _forgetPasswordWidget() {
    return Align(
        alignment: Alignment.centerRight,
        child: Text(
          _loginController.forgetPassTxt,
          style: TextStyle(
              color: AppConstant.textBorderColor(),
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ));
  }

  _loginButtonWidget() {
    return InkWell(
      onTap: () async {
        //check network
        final connectivityResult = await (Connectivity().checkConnectivity());
        const noCon = ConnectivityResult.none;
        if(connectivityResult == noCon){
          Fluttertoast.showToast(msg: AppConstant.offline);
        } else if(_loginController.loginFormKey.currentState!.validate()){
          _loginController.userLogin();
        }
      },
      child: Container(
        height: 60,
        width: 330,
        decoration: BoxDecoration(
            color: _loginController.isShowError.value == false
                ? AppConstant.loginBtnBgColor()
                : AppConstant.loginBtnBgColor().withOpacity(.3),
            borderRadius: BorderRadius.circular(5)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            _loginController.loginBtnTxt,
            style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  _singUpWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 3,
          width: 85,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white,
            AppConstant.loginBtnBgColor(),
          ])),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Text(
            _loginController.signupWithTxt,
            style: TextStyle(
                color: AppConstant.primaryTextColor(),
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ),
        Container(
          height: 3,
          width: 85,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              AppConstant.loginBtnBgColor(),
              Colors.white,
            ],
          )),
        ),
      ],
    );
  }

  _myStackWidget() {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 52,
              width: 52,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: AppConstant.googleBgColor(),
                border: Border.all(
                    color: AppConstant.googleBgBorderColor(), width: .4),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(AppImage.googleLogo),
              ),
            ),
            Container(
              height: 52,
              width: 52,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: AppConstant.googleBgColor(),
                border: Border.all(
                    color: AppConstant.googleBgBorderColor(), width: .4),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(AppImage.fbLogo),
              ),
            ),
            Container(
              height: 52,
              width: 52,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: AppConstant.googleBgColor(),
                border: Border.all(
                    color: AppConstant.googleBgBorderColor(), width: .4),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(AppImage.appleLogo),
              ),
            ),
          ],
        ),
        Image.asset(
          AppImage.bottomCurveImg,
        )
      ],
    );
  }


}
