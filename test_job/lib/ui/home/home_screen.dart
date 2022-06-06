
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_job/Const/Colors.dart';
import 'package:test_job/ui/home/home_controller.dart';
import 'package:test_job/widget/data_not_found_widget.dart';


class HomeScreen extends GetView<HomeController> {
    HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: w * 0.04, top: h * 0.01,right: w*0.005),
          child:
          Obx(() {
            return
              controller.isDataLoad.value == true ?
              DataNotFoundWidget() :
              Scrollbar(
                thumbVisibility: true,
                // thickness: 10,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.resultList.value.length,// 20,
                    separatorBuilder: (_, __) => SizedBox(height: h * 0.01),
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.025, vertical: h * 0.013),
                          decoration: BoxDecoration(
                            color: cWhite,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              controller.resultList.value[index].fields!.cdn!.isNotEmpty ?
                              Container(
                                height: h * 0.13,
                                width: h * 0.13,
                                decoration: BoxDecoration(
                                    color: cBlue,
                                    borderRadius: BorderRadius.circular(10),
                                    image:  DecorationImage(image: NetworkImage('${
                                              controller.resultList.value[index]
                                                  .fields!.cdn![0]
                                            }256/${
                                        controller.resultList.value[index]
                                            .fields!.img
                                    }'),fit: BoxFit.cover)
                                ),
                              ) :
                              Container(
                                  height: h * 0.13,
                                  width: h * 0.13,
                                  decoration: BoxDecoration(color: cBlue, borderRadius: BorderRadius.circular(10)),
                                  child: Center(child: Text(controller.resultList.value[index].fields!.assetName![0].toUpperCase(),
                                      style: TextStyle(fontSize: 15,color: cBlue)))),
                              SizedBox(width: w * 0.03),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: w/1.8,
                                    child: Text(controller.resultList.value[index].fields!.assetName!, overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: TextStyle(fontSize: 15,color: cBlack),),
                                  ),
                                  SizedBox(height: w * 0.03),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(horizontal:w * 0.03,vertical: h* 0.01),
                                          decoration: BoxDecoration(color: cRedOpacity, borderRadius: BorderRadius.circular(5)),
                                          child: Text('${controller.resultList.value[index].fields!.distanceM} metres', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12,color: cRed))),
                                      SizedBox(width: w * 0.2),
                                      Text('${controller.resultList.value[index].fields!.price}\u20ac',
                                          style: TextStyle(fontSize: 18,color: cDarkBlue,fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })
                ),
              );
          }),
        ),

      ),
    );
  }
}
