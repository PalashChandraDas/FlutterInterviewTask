import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utils/apis.dart';
import '../model/user_list/UserListModel.dart';

class UserListController extends GetxController {
  var appBarTitle = 'User List';
  var isLoading = false.obs;

  //userList
  RxObjectMixin<UserListModel> userDataList = UserListModel().obs;

  @override
  void onInit() {
    fetchUserDataList();
    super.onInit();
  }

  void fetchUserDataList() async {
    Dio dio = Dio(BaseOptions(baseUrl: Apis.baseUrl));
    try {
      isLoading(true);
      var response = await dio.get(Apis.userListGetPath, queryParameters: {'page': 2});
      if (response.statusCode == 200) {
        var myGetData = response.data;
        // debugPrint('$myGetData');
        userDataList.value = UserListModel.fromJson(myGetData);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally{
      isLoading(false);
    }
  }
}
