import 'package:dio/dio.dart';

class ApiSerivecs {
  static Dio? dio;
  static intial() {
    dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
  }

 static Future<Response> getData({required String path,required Map<String,dynamic> que}) async{
   return await dio!.get(path,queryParameters:que);
  }
}
