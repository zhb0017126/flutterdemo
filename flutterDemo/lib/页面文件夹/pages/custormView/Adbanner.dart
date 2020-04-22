import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //屏幕适配
import 'dart:convert';

class ADBanner extends StatelessWidget {

   String adurl ;
  ADBanner({Key key, @required this.adurl}):super(key:key);
   
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(adurl),
      
    );
  }
}