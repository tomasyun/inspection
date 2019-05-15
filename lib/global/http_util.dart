import 'dart:typed_data';

import 'package:connectivity/connectivity.dart';
import "package:dio/dio.dart";
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:inspection/global/sharedpreferences.dart';
import 'package:inspection/global/toast.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

//定义一个网络请求出错的回调
typedef NetworkError();
typedef NetworkSuccess(Map<String, dynamic> data);

class HttpUtil {
  static const String BASE_URL = 'http://192.168.10.19:8080/';
  static const String TYPE_GET = 'get';
  static const String TYPE_POST = 'post';
  Dio dio; //一般一个应用中只有一个dio实例
// 工厂模式
  factory HttpUtil() => _getInstance();

  static HttpUtil get instance => _getInstance();
  static HttpUtil _instance;

  HttpUtil._internal() {
    // 初始化
    if (dio == null) {
      BaseOptions options = BaseOptions(baseUrl: BASE_URL);
      dio = Dio(options);
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        // config the http client
        client.findProxy = (uri) {
          //proxy all request to localhost:8888
          return "PROXY 192.168.10.24:8888";
        };
        // you can also create a new HttpClient to dio
        // return new HttpClient();
      };
    }
  }

  static HttpUtil _getInstance() {
    if (_instance == null) {
      _instance = new HttpUtil._internal();
    }
    return _instance;
  }

  //判断当前移动设备网络是否可用
  Future isNetWorkAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile)
      return true;
    else if (connectivityResult == ConnectivityResult.wifi)
      return true;
    else if (connectivityResult == ConnectivityResult.none) return false;
  }

  //get方法
  //返回一个map的future类型
  Future get(
    String url, {
    Map data,
    Options options,
    NetworkError onError,
  }) async {
    return _request(url, TYPE_GET,
        data: data, options: options, onError: onError);
  }

  //post方法
  Future post(
    String url, {
    Map data,
    Options options,
    NetworkError onError,
  }) async {
    return _request(url, TYPE_POST,
        data: data, options: options, onError: onError);
  }

  //多部分上传（包括图片、参数）
  Future onMultipartRequest(
      {List<Asset> assets, Map<String, String> map, String url}) async {
    Uri uri = Uri.parse(BASE_URL + url);
    http.MultipartRequest request = http.MultipartRequest('post', uri);
    String token;
    await SpUtils().getString('token').then((value) {
      token = value;
    });
    request.headers['Authorization'] = token;
    request.headers['user-agent'] = 'android';
    if (assets != null && assets.isNotEmpty)
      for (int i = 0; i < assets.length; i++) {
        ByteData byteData = await assets[i].requestOriginal();
        List<int> imageData = byteData.buffer.asUint8List();
        request.files.add(http.MultipartFile.fromBytes(
          'files',
          imageData,
          filename: assets[i].name,
          contentType: MediaType("image", "jpg", {'image': 'png'}),
        ));
      }
    if (map != null && map.isNotEmpty) {
      request.fields.addAll(map);
    }
    return await request.send();
  }

  Future _request(String url, String type,
      {Map data, Options options, NetworkError onError}) async {
    try {
      Response response;
      if (type == TYPE_GET) {
        response = await dio.get(url, queryParameters: data, options: options);
      } else if (type == TYPE_POST) {
        response = await dio.post(url, options: options, data: data);
      }
      if (response.statusCode != 200) {
        var errorMsg = "网络请求错误，状态码:${response.statusCode}";
        return new Future.error(errorMsg);
      } else {
        return response.data;
      }
    } catch (e) {
      onError = () {
        AppToast.showToast(e.toString());
      };
    }
  }
}
