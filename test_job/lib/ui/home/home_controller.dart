import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_job/Const/app_constant.dart';
import 'package:test_job/ui/home/home_list_provider.dart';
import 'package:test_job/ui/home/home_model.dart';
import 'package:test_job/widget/progress_dialog_utils.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getHomeListData();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Rx<RxList<Result>> resultList = RxList<Result>.empty().obs;
  RxBool isDataLoad = false.obs;

  Future<Result?> getHomeListData() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ProgressDialogUtils.showProgressDialog(Get.context);
    });

    Map<String, dynamic> queryRequest = {
      'search': 'chaise',
      'lat': '48.8300329',
      'lon': '2.3266277',
      'device_id': 'xxxxxxxxx',
      'from': '0',
      'size': '20',
    };
    Map<String, String> headers = {};

    HomeListProvider().callHomeList(queryRequest: queryRequest).then((getValue) async {
            if (getValue != null) {
              final getHomeData = homeDataFromJson(getValue);
              resultList.value.clear();
              if (getHomeData.result!.isNotEmpty) {
                resultList.value.addAll(getHomeData.result!);
                debugPrint('getData  : $resultList');
              }
              if (resultList.value.isEmpty) {
                isDataLoad.value = true;
              }
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ProgressDialogUtils.hideProgressDialog();
              });
            }

    }, onError: (error) {
            debugPrint('getProfileData ERROR : $error');
            // Const().toast(error['message']);
            Const().toast(error.toString());
            ProgressDialogUtils.hideProgressDialog();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ProgressDialogUtils.hideProgressDialog();
            });
    });
    update();
  }
}
