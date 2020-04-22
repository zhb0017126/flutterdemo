import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../config/httpHeader.dart';


class EmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("email标题")
      ),
      body: Center(
        child: Center(
          child: Text("email内容"),
        ),
      ),
    );
  }
}


class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  TextEditingController typeController = TextEditingController(); //controller作为控件对外的表现形式
  String showText = "黄河远上白云间";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("诗词标题"),
        ),
        body: SingleChildScrollView( //加入滚动视图，可解决视图越界问题
          child: Container(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: "诗词类型",
                    helperText: "请输入你喜欢的诗词类型",
                  ),
                  autofocus: false,//打开输入键盘，自动打开焦点

                ),
                Text(
                  showText,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
                RaisedButton(
                  onPressed: chooseAction,
                  child: Text("点击切换"),
                ),
                
              ],
            ),
          ),
        ) 
      ),
      
    );
  }
  void chooseAction(){
    
    if (typeController.text.toString() == "") {
       showDialog(
        context: context,
        builder: (context)=>AlertDialog(title:Text("查询类型不能为空"),) // alert 弹窗
      );
    }else{
      getHttpString(typeController.text.toString()).then((val){
        setState(() {
          showText = val["content"].toString();
        });

      });
      
    }
  }
  void getHttp() async{
    try {
      Response reseponse;
      reseponse = await Dio().get("https://api.gushi.ci/all.json");
      print(reseponse);

    } catch (e) {
      print(e);
    }

  }
  Future getHttpString( String type) async{
    try {
      Response response;
      var data = {"name":type};
      response = await Dio().get(
        "https://api.gushi.ci/all.json",
        queryParameters: data, //get 入参
      );
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future PostHttpString( String type) async{
    try {
      Response response;
      var data = {"name":type};
      response = await Dio().post( //post请求
        "https://api.gushi.ci/all.json",
        queryParameters: data, //get 入参
      );
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future newHttpString( String type) async{
    try {
      Response response;
      Dio dio = Dio();
      dio.options.headers = httpHeaders;
      var data = {"name":type};
      response = await dio.post( //post请求
        "https://web-api.juejin.im/query",
        queryParameters: data, //get 入参
      );
      return response.data;
    } catch (e) {
      print(e);
    }
  }


 




}



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("首页")
      ),
      body: Center(
        child: Center(
          child: Text("home内容"),
        ),
      ),
    );
  }
}