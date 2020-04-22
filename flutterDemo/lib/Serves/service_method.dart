import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';
import '../config/httpHeader.dart';

Future getHomePageContent()async {
  try {
      print("开始获取首页数据");
      Response response;
      Dio dio = Dio();
      //dio.options.contentType = ContentType.parse("application/json");
      dio.options.headers = Map<String, dynamic>.from(httpHeaders) ;
     
      // formatData = {'lon':"115.02932",'lat':'35.76189'};
     var  formatData = Map<String, dynamic>.from(params) ;
      print("aaaaaaa");
      String url = servicePath['homePageContent'];
      print("url is ${url}");
      response= await dio.post(url,data: formatData);
      print("${response.data}");
      if (response.statusCode == 200) {
          return response.data;
      }else{
        throw Exception("后端接口异常");
      } 
    
  } catch (e) {
    //return print("error ===>>>>>${e}");
    return "";
  }
}