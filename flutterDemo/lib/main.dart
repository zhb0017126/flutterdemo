
import 'package:flutter/material.dart'; //手机风格 卡片文件 谷歌自己设置的

import './底部导航栏/bottom_navigation_widget.dart';
import 'dart:core';
import 'package:flutter/cupertino.dart'; //另一种风格文件 ios风格


// import './页面文件夹/index_page.dart'; //引入文件
import './页面文件夹/pages/home_page.dart'; //引入文件
import './页面文件夹/tempPages/email_page.dart';
import './页面文件夹/tempPages/ariplay_page.dart';
import './底部导航栏/index_page.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "测试商城",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        //home: bottomNavitationWidget(),
        home: IndexPage(),
       // home: HomePage1(),
         
      ),
    );
  }
}


// 随机图片链接 https://source.unsplash.com/random/800x600
//  get 请求获取数据  https://v1.jinrishici.com/all.json