
import 'dart:io';
import 'dart:typed_data';


import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


import '../api_client/api_constans.dart';
import '../utils/alert_utils.dart';

class ApiBaseHelper {

  static Future<BaseOptions> createDioObject() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     //String? token = prefs.getString(WSConstants.token);
      String? token;


    return BaseOptions(
        /*connectTimeout: 12000,
        receiveTimeout: 12000,*/
        connectTimeout: 25000,
        receiveTimeout: 25000,
        baseUrl: '${APIConstants.baseUrl}',
        //headers: {'Content-Type':'application/json'},
        headers: token != null ? {'Authorization': "Bearer "+token} : null);
  }

  static showAPILogs (dio) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }

  Future<dynamic> get(String url, {String? headers}) async {
    var responseJson;
    final baseOptions = await createDioObject();
    Dio dio = new Dio(baseOptions);
    showAPILogs(dio);
    try {
      final response = await dio.get(url);
      responseJson = _returnResponse(response);
      return responseJson;
    } catch (e) {
      if (e is DioError) {
        AlertUtils.showToast(e.response!.data['message']);
      }
    }
  }

  Future<dynamic> post(String url, {required Map<String, dynamic> reqbody}) async {
    var responseJson;
    final baseOptions = await createDioObject();
    Dio dio = new Dio(baseOptions);
    showAPILogs(dio);
    try {
      final response = await dio.post(url, data: reqbody);
      print(response);
      print('RESPONSEEE $response');
      responseJson = _returnResponse(response);
      print('RESPONSE_MY $responseJson');
      return responseJson;
    } catch (e) {
      if (e is DioError) {
        print('MY_DATA ${e.error.toString()}');
        print('MY_DATA ${e.response!.data['message']}');
        print('MY_DATA ${e.response!.data}');
        //AlertUtils.showToast(e.response!.data['message']);\

        //responseJson = _returnResponse(e.response!.data);
        return e.response!.data;
      }
    }
  }


  Future<dynamic> multipart_post(String url, {required FormData reqbody}) async {
    var responseJson;
    final baseOptions = await createDioObject();
    Dio dio = new Dio(baseOptions);
    showAPILogs(dio);
    try {
      final response = await dio.post(url, data: reqbody);
      print(response);
      responseJson = _returnResponse(response);
      print(responseJson);
      return responseJson;
    } catch (e) {
      if (e is DioError) {
        AlertUtils.showToast(e.response!.data['message']);
      }
    }
  }


  Future<dynamic> patch(String url, {required Map<String, dynamic> reqbody}) async {
    var responseJson;
    final baseOptions = await createDioObject();
    Dio dio = new Dio(baseOptions);
    showAPILogs(dio);
    try {
      final response = await dio.patch(url,data: reqbody);
      responseJson = _returnResponse(response);
      return responseJson;
    } catch (e) {
      if (e is DioError) {
        AlertUtils.showToast(e.response!.data['message']);
      }
    }

  }

  Future<dynamic> put(String url, {required Map<String, dynamic> reqbody}) async {
    var responseJson;
    final baseOptions = await createDioObject();
    Dio dio = new Dio(baseOptions);
    showAPILogs(dio);
    try {
      final response = await dio.put(url,data: reqbody);
      responseJson = _returnResponse(response);
      return responseJson;
    } catch (e) {
      if (e is DioError) {
        AlertUtils.showToast(e.response!.data['message']);
      }
    }

  }


  Future<dynamic> post_1(String url) async {
    var responseJson;
    final baseOptions = await createDioObject();
    Dio dio = new Dio(baseOptions);
    showAPILogs(dio);
    try {
      final response = await dio.post(url);
      responseJson = _returnResponse(response);
      return responseJson;
    } catch (e) {
      if (e is DioError) {
        AlertUtils.showToast(e.response!.data['message']);
      }
    }
  }

  Future<dynamic> delete(String url) async {
    var responseJson;
    final baseOptions = await createDioObject();
    Dio dio = new Dio(baseOptions);
    showAPILogs(dio);
    try {
      final response = await dio.delete(url);
      responseJson = _returnResponse(response);
      return responseJson;
    } catch (e) {
      if (e is DioError) {
        AlertUtils.showToast(e.response!.data['message']);
      }
    }
  }

  Future<dynamic> fileUploadPUT(String url, {required File file}) async {
    var responseJson;
    final baseOptions = await createDioObject();
    Dio dio = new Dio();
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 5000;
    showAPILogs(dio);
    try {
      Uint8List image = File(file.path).readAsBytesSync();

      Options options = Options(
          contentType: lookupMimeType(file.path),
          headers: {
            'Content-Type': '*/*',
            'Accept': "*/*",
            'Content-Length': image.length,
            'Connection': 'keep-alive',
          }
      );

      print('Header Success');
      Response response = await dio.put(
          url,
          data: file.openRead(),
          options: options
      );

      responseJson = _returnResponse(response);
      print(responseJson);
      return response;

    } catch (e) {
      if (e is DioError) {
        //AlertUtils.showToast(e.response!.data['message']);
        print('Error ${e.message}');
      }
    }
  }


}

dynamic _returnResponse(Response response) {
  print(response.statusCode);
  switch (response.statusCode) {
    case 200:
      var responseJson = (response);
      return responseJson;
    case 201:
      var responseJson = (response);
      return responseJson;
    case 202:
      var responseJson = (response);
      return responseJson;
    case 400:
      var responseJson = response;
      return responseJson;
    case 403:
      var responseJson = response;
      return responseJson;
    case 404:
      var responseJson = (response);
      return responseJson;
    case 401:
      var responseJson = response;
      return responseJson;
    case 422:
      var responseJson = response;
      return responseJson;
    case 500:
      var responseJson = response;
      return responseJson;

  }
}
