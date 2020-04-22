import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../页面文件夹/pages/home_page.dart';
import '../页面文件夹/pages/cart_page.dart';
import '../页面文件夹/pages/catgray_page.dart';
import '../页面文件夹/pages/member_page.dart';




class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final List <BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.home
      ),
      title: Text("首页")
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.search
      ),
      title: Text("分类")
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.shopping_cart
      ),
      title: Text("购物车")
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.settings_solid
      ),
      title: Text("我的")
    ),
  ];

  final List tabBodies = [
    HomePage(),
    CategrayPage(),
    CartPage(),
    MemberPage(),
  ];

  int currentIndex = 0;

  var currentPage;

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    // TODO: implement initState
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(244, 245, 245, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (int index){
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });

        }
        ,
      ),
      body: currentPage,
    
    );
  }
}

// class IndexPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
//          title: Text("测试首页")
//        ),
//        body: Center(
//          child: Text("测试"),
         
//        ),
//     );
//   }
// }