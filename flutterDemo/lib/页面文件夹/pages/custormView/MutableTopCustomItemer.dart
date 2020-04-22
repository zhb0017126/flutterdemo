import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //屏幕适配
//"https://source.unsplash.com/random/200x200"
class MutableTopCustomItemer extends StatelessWidget {
  final List navigatorlist;
  MutableTopCustomItemer({Key key, this.navigatorlist}):super(key:key);

  Widget _gradeViewItemUI(BuildContext context,Item){

    return InkWell( //接受点击事件
      onTap: (){
       // print("点击了导航");
        
      },
      child: Column(
        children: <Widget>[
          Container(

            color: Colors.red,
            child: Image.network(Item['img'],width: ScreenUtil().setWidth(95),height:ScreenUtil().setWidth(95) ,),
          ),
          Text(Item['title'])
        ],
      
      ),

    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height:ScreenUtil().setHeight(320) ,
      padding: EdgeInsets.all(3),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5),
        children: navigatorlist.map((item){
          return _gradeViewItemUI(context,item);
        }).toList(),
      ),
      
    );
  }
}