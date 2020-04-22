import 'package:flutter/material.dart';
import 'package:dio/dio.dart';



import 'package:flutter_swiper/flutter_swiper.dart';

import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //屏幕适配


import '../pages/custormView/MutableTopCustomItemer.dart';
import '../pages/custormView/SwiperDiy.dart';
import '../pages/custormView/Adbanner.dart';
import '../pages/custormView/CallTelephone.dart';
import '../../Serves/service_method.dart';
import '../../config/httpHeader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = "正在获取数据";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomePageContent().then((val){
      setState(() {
        homePageContent = val.toString();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页数据"),),
      // body: SingleChildScrollView( // 与ListView有冲突，一般内部有listView不要再使用该功能
      //       child: Text(homePageContent),
      // ),
      body: FutureBuilder( //解决异步请求，而且不同动态SetState
        future: getHomePageContent() ,
        builder: (context,snapshot){
          if(snapshot.hasData){// 是否有值
              //var data = json.decode(snapshot.data.toString());
              // List<Map> swiper = (data['data']['imglist'].as.list).cast();
              List<Map> swiper = [{"img":"https://source.unsplash.com/random/800x600"},{"img":"https://source.unsplash.com/random/800x600"},{"img":"https://source.unsplash.com/random/800x600"},];
              String  imgString  =""; 
            //"https://source.unsplash.com/random/190x190";
              List<Map> iconList = [
                  {"title":"第一","img":imgString},
                  {"title":"第二","img":imgString},
                  {"title":"第三","img":imgString},
                  {"title":"第四","img":imgString},
                  {"title":"第五","img":imgString},
                  {"title":"第六","img":imgString},
                  {"title":"第七","img":imgString},
                  {"title":"第八","img":imgString},
                  {"title":"第九","img":imgString},
                  {"title":"第十","img":imgString},
              ];
              String adUrl = "这是一个广告，这是一个广告";
              String name = "这是一个名字";
              String telePhone = "18800000000";

              return Column(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiper),
                  MutableTopCustomItemer(navigatorlist:iconList),
                  ADBanner(adurl:adUrl ),
                  CallTelePhone(name: name, tlelPhone: telePhone),
                 
                ],

              );

              

          }else{

            showDialog(
                context: context,
                builder: (context)=>AlertDialog(title:Text("数据为空"),) // alert 弹窗
             );
          } 
        },
      ),
    );
  }
}





