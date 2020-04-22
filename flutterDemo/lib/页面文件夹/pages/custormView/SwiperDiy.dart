import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //屏幕适配

import 'dart:convert';
// 轮播组件
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, @required this.swiperDataList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    ScreenUtil.init(context, width: 750, height: 1334);
    return Container(
     // print('设备像素密度${ScreenUtil.pixelRatio}');
    // print('设备的高度${ScreenUtil.screenHeight}');
    // print('设备宽度${ScreenUtil.screenWidth}');
     // height: 333,
     height: ScreenUtil().setHeight(333),
     width: ScreenUtil().setWidth(750),

      child:Swiper(
        itemBuilder: (BuildContext context, int index){
           
           String  url = swiperDataList[index]['img'];
          // print("url is $url");
           return Image.network(url,fit: BoxFit.fill,);
        },
        itemCount: swiperDataList.length,
        pagination:  SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}




