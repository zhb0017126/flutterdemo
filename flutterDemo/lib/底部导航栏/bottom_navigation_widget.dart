import 'package:flutter/material.dart';
import '../页面文件夹/tempPages/ariplay_page.dart';
import '../页面文件夹/tempPages/email_page.dart';
import '../页面文件夹/pages/home_page.dart';
import './index_page.dart'; //相对文件夹引用

//动态widget  内容变化的 
class bottomNavitationWidget extends StatefulWidget {// 
  @override
  _bottomNavitationWidgetState createState() => _bottomNavitationWidgetState();
}

class _bottomNavitationWidgetState extends State<bottomNavitationWidget> {
  //动态组件维护状态
  //重写初始化状态
  @override
  void initState(){
    super.initState();
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(AriPlayScreen())
      ..add(IndexPage());
    //..add  建造者模式， 用完谁返回谁，可以多次 类似于masory 的链式模式
    print("initState");
  }



  final Color _BottomNavigationColor = Colors.blue;
  int currentIndex = 0;
  List<Widget> list = List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
            setState(() { //设置状态
              currentIndex = index;
            });
        },
        currentIndex: currentIndex,
        items: [
           BottomNavigationBarItem(
             icon: Icon(
               Icons.home,
               color:_BottomNavigationColor,
             ),
             title: Text("home")
           ),
           BottomNavigationBarItem(
             icon: Icon(
               Icons.email,
               color:_BottomNavigationColor,
             ),
             title: Text("email")
           ),
           BottomNavigationBarItem(
             icon: Icon(
               Icons.airplay,
               color:_BottomNavigationColor,
             ),
             title: Text("airPlay")
           ),
           BottomNavigationBarItem(
             icon: Icon(
               Icons.android,
               color:_BottomNavigationColor,
             ),
             title: Text("index")
           ),
        ]
      ),
      
    );
  }
}