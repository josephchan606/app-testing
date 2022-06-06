
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:test_job/API/api_url.dart';
import 'package:test_job/Const/app_constant.dart';
import 'package:test_job/widget/progress_dialog_utils.dart';
import 'package:http/http.dart' as http;


class HomeListProvider {

  Future<dynamic> callHomeList({Map<String, dynamic>? queryRequest,Map<String, String>? headers}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    debugPrint('connectivityResult : ${connectivityResult.toString()}');
    if(connectivityResult == ConnectivityResult.none || connectivityResult == ConnectivityResult.bluetooth){
      ProgressDialogUtils.hideProgressDialog();
      Const().toast(Const.noInternet);
      return;
    }
    var client = http.Client();
    final response = await client.post(Uri.parse(Api.listUrl), body: queryRequest);
    debugPrint('callDriverList => response.body : '+ response.body.toString());
    if(response.statusCode!=200) {
      debugPrint('callDriverList => response.statusText : ${response.body}');
      return Future.error(response.body);
    } else {
      return response.body;
    }
  }

}