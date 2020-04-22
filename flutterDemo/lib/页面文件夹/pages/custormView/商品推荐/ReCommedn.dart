import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; //屏幕适配
import 'dart:convert';


class ReComment extends StatelessWidget {
  List recommentlist = List();
  ReComment({Key key ,@required this.recommentlist}):super(key:key);
  // 标题
  Widget titleWidget()
  {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 2, 0, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5,color: Colors.red),
        ),
      ),
      child: Text(
        "商品推荐",
        style: TextStyle(color: Colors.pink),
      ),
      
    );
  }

  //商品单独项

  Widget item(int index){
    return InkWell(
      onTap: (){

      },
      child: Container(
        height: ScreenUtil().setHeight(333),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left:BorderSide(width: 0.5,color: Colors.green),

          )
        ),
        child: Column(
          children: <Widget>[
              Container(
                height: 220,
                width: 220,
                child: Image.network(recommentlist[index]["img"]),
                color: Colors.orange,
              ),
             Text('${recommentlist[index]['txt']}',style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey
             ),),
          ],
        ),
        

      ),

    );
  }

  //横向列表

  Widget recomendList(){
    return Container(
      height: ScreenUtil().setHeight(330),
      margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommentlist.length,
        itemBuilder: (context,index){
          return item(index);
        }
      ),

    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top:10),
      child: Column(
        children: <Widget>[
          titleWidget(),
          recomendList(),
        ],
      ),
      
    );
  }
}