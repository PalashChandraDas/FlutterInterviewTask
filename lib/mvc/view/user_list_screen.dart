import 'package:flutter/material.dart';
import 'package:interview_practice/mvc/controller/all_controller.dart';
import 'package:get/get.dart';
import 'package:interview_practice/utils/app_constant.dart';

class UserListScreen extends StatelessWidget {
  UserListScreen({super.key});
  final UserListController _userListController = Get.put(UserListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: RefreshIndicator (
        onRefresh: () async {
          _userListController.fetchUserDataList();
        },
        child: FutureBuilder(
          future: AppConstant.checkNet(),
          builder: (_, snap) {
            if (snap.data == true) {
              return Obx(() {
                if (_userListController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (_userListController.userDataList.value.data!.isNotEmpty) {
                    return _bodyWidget();
                  } else {
                    return const Center(
                      child: Text(AppConstant.noData),
                    );
                  }
                }
              });
            }
            return const Center(
              child: Text(AppConstant.offline),
            );
          },
        ),
      ),
    );
  }

  _appBarWidget() {
    return AppBar(
      elevation: 2,
      title: Text(_userListController.appBarTitle),
      centerTitle: true,
    );
  }

  _bodyWidget() {
    return GridView.builder(
      itemCount: _userListController.userDataList.value.data!.length,
      padding: const EdgeInsets.all(15),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 205,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
      ),
      itemBuilder: (_, i) {
        return Card(
          elevation: 2,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            _userListController
                                .userDataList.value.data![i].avatar
                                .toString(),
                          ))),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  _userListController.userDataList.value.data![i].firstName
                      .toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppConstant.primaryTextColor(),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  _userListController.userDataList.value.data![i].email
                      .toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppConstant.primaryTextColor(),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  // style: TextStyle(s),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
