import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
class AriPlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("ariplay标题")
      ),
      body: Center(
        child: Center(
          child: Text("airplay内容"),
        ),
      ),
    );
  }
}




class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("首页")
      ),
      body: Center(
        child: Center(
          child:Column(
            children: <Widget>[
              Text("home内容"),
              MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text('点我'),
                onPressed: () {
                  getHttp();
                },
              )
            ],
          )
           

        ),
      ),
    );
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
}
