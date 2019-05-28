import 'dart:async';
import 'dart:convert' show json;
import 'dart:typed_data';

import "package:dio/dio.dart";
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:inspection/global/app_common.dart';
import 'package:inspection/global/sharedpreferences.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

///定义一个网络请求出错的回调
typedef NetworkError();
typedef NetworkSuccess(Map<String, dynamic> data);

class HttpUtil {
  static const String BASE_URL = 'http://180.76.150.16:8080/';
  static const String TYPE_GET = 'get';
  static const String TYPE_POST = 'post';
  static const String TYPE_PUT = 'put';
  static const String TYPE_DELETE = 'delete';
  Dio dio;

  ///一般一个应用中只有一个dio实例
  ///工厂模式
  factory HttpUtil() => _getInstance();

  static HttpUtil get instance => _getInstance();
  static HttpUtil _instance;

  HttpUtil._internal() {
    ///初始化
    if (dio == null) {
      BaseOptions options = BaseOptions(baseUrl: BASE_URL);
      dio = Dio(options);
      dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        print("\n================== 请求数据 ==========================");
        print("url = ${options.uri.toString()}");
        print("headers = ${options.headers}");
        print("params = ${options.data}");
      }, onResponse: (Response response) {
        print("\n================== 响应数据 ==========================");
        print("code = ${response.statusCode}");
        print("data = ${response.data}");
        print("\n");
      }, onError: (DioError e) {
        print("\n================== 错误响应数据 ======================");
        print("type = ${e.type}");
        print("message = ${e.message}");
        print("stackTrace = ${e.stackTrace}");
        print("\n");
      }));

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return "PROXY 192.168.10.24:8888";
        };
      };
    }
  }

  static HttpUtil _getInstance() {
    if (_instance == null) {
      _instance = new HttpUtil._internal();
    }
    return _instance;
  }

  ///get方法
  ///返回一个map的future类型
  Future get(
    String url, {
    data,
    Options options,
    NetworkError onError,
  }) async {
    return _request(url, TYPE_GET,
        data: data, options: options, onError: onError);
  }

  ///post方法
  Future post(
    String url, {
    data,
    Options options,
    NetworkError onError,
  }) async {
    return _request(url, TYPE_POST,
        data: data, options: options, onError: onError);
  }

  ///put方法
  Future put(
    String url, {
    data,
    Options options,
    NetworkError onError,
  }) async {
    return _request(url, TYPE_PUT,
        data: data, options: options, onError: onError);
  } //

  ///delete方法
  Future delete(
    String url, {
    data,
    Options options,
    NetworkError onError,
  }) async {
    return _request(url, TYPE_DELETE,
        data: data, options: options, onError: onError);
  } //

  ///多部分上传（包括图片、参数）
  Future<String> onMultipartRequest(
      {List<Asset> assets, Map<String, String> map, String url}) async {
    Completer<String> completer = Completer();
    Uri uri = Uri.parse(BASE_URL + url);
    http.MultipartRequest request = http.MultipartRequest('post', uri);
    String token;
    await SpUtils().getString('token').then((value) {
      token = value;
    });
    request.headers['Authorization'] = token;
    request.headers['user-agent'] = 'android';
    if (assets != null && assets.isNotEmpty) {
      for (int i = 0; i < assets.length; i++) {
        ByteData byteData = await assets[i].requestOriginal();
        List<int> imageData = byteData.buffer.asUint8List();
        request.files.add(http.MultipartFile.fromBytes(
          'files',
          imageData,
          filename: assets[i].name,
          contentType: MediaType('images', 'jpg', {'image': 'png'}),
        ));
      }
    }
    map['smsDangerInfo'] = json.encode(map);
    request.fields.addAll(map);
    http.StreamedResponse response = await request.send();
    List<int> responseBody = [];
    response.stream.listen((data) {
      responseBody.addAll(data);
    }, onDone: () {
      String string = String.fromCharCodes(responseBody);
      completer.complete(string);
    }, onError: (err) {
      completer.completeError(err);
    });
    return completer.future;
  }

  Future _request(String url, String type,
      {data, Options options, NetworkError onError}) async {
    try {
      String token;
      await SpUtils().getString('token').then((value) {
        token = value;
      });
      Options options =
          Options(headers: {'Authorization': token, 'user-agent': 'android'});
      Response response;
      if (type == TYPE_GET) {
        response = await dio.get(url, queryParameters: data, options: options);
      } else if (type == TYPE_POST) {
        response = await dio.post(url, options: options, data: data);
      } else if (type == TYPE_PUT) {
        response = await dio.put(url, options: options, queryParameters: data);
      } else if (type == TYPE_DELETE) {
        response =
            await dio.delete(url, queryParameters: data, options: options);
      }
      if (response.statusCode != 200) {
        var errorMsg = '服务器出错,状态码:${response.statusCode}';
        AppCommons.showToast(errorMsg);
        return Future.error(errorMsg);
      } else {
        return response.data;
      }
    } catch (e) {
      AppCommons.showToast('服务器异常');
      return Future.error(e.toString());
    }
  }
}
