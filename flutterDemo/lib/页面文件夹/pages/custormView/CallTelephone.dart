import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //屏幕适配
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';


class CallTelePhone extends StatelessWidget {
  String name;
  String tlelPhone;
  CallTelePhone({Key,key,@required this.name, @required this.tlelPhone}):super(key:key);
  void lanuchUrl(){
    String url = "tel:"+tlelPhone;
    
    bool isCanLaunch = canLaunch(url) == true;
     if (isCanLaunch) {
      launch(url);
    }else{
      throw("不能打电话");
    }



  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
      height: 45,
      child: InkWell(
        
        onTap:lanuchUrl,
        child: Row(
          
          children: <Widget>[
            Text(name +":"),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(tlelPhone),
            ),
            
          ],
        ),
        
      ),
      
    );
  }
}