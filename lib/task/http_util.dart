import 'dart:io';
import 'package:dio/dio.dart';

class HttpUtil {

  static HttpUtil? instance;
  late Dio dio;
  late BaseOptions options;

  static HttpUtil? getInstance() {
    String url = "http://localhost:8081/";
    if (instance == null) {
      instance = HttpUtil(url);
    }
    return instance;
  }

  setBaseUrl(String url) {
    options.baseUrl = url;
  }

  HttpUtil(baseUrl) {
    options = new BaseOptions(
      baseUrl: baseUrl,
      //连接超时时间，单位是毫秒
      connectTimeout: 10000,
      //数据间隔超时时间，单位为毫秒
      receiveTimeout: 8000,
      contentType: ContentType.json.toString(),
      responseType: ResponseType.json,
    );

    dio = new Dio(options);

    //添加拦截器
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      print("请求之前");
      print(options.baseUrl + options.path);
      options.headers['objectId'] = '221';
      return handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      print("响应之前");
      if (response.data != null) {
        var json = (response.data);
        if (json != null &&
            json.runtimeType.toString() != 'String' &&
            json['code'] != null) {
          if (json['code'].toString() == '99999' ||
              json['code'].toString() == '99997') {
          } else if (json['code'].toString() == '99996') {
            json['messager'] = '没有权限';
          }
        }
      }
      return handler.next(response);
    }, onError: (DioError e, ErrorInterceptorHandler handler) {
      print("错误之前");
      return handler.next(e);
    }));
  }

  get(url) async {
    Response? response;
    try {
      print(url);
      response = await dio.get(url);
      print('get success---------${response.statusCode}');
      print('get success---------${response.data}');
    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }
    return _response(response);
  }

  _response(response) {
    if (response != null) {
      return response.data;
    } else {
      return {
        "code": "9999",
        "data": null,
        "date": 0,
        "message": '网络错误',
        "status": "Error"
      };
    }
  }

  post(url, {formData}) async {
    Response? response;
    try {
      print('try to post');
      response = await dio.post(url, data: formData == null ? {} : formData);
      print('post success---------${response.data}');
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
      print("response");
    }
    return _response(response);
  }

  delete(url, {formData}) async {
    Response? response;
    try {
      response = await dio.delete(url, data: formData == null ? {} : formData);
      print('post success---------${response.data}');
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return _response(response);
  }

  put(url, {formData}) async {
    Response? response;
    try {
      response = await dio.put(url, data: formData == null ? {} : formData);
      print('put success---------${response.data}');
    } on DioError catch (e) {
      print('put error---------$e');
      formatError(e);
    }
    return _response(response);
  }


  void formatError(DioError e) {
    if (e.type == DioErrorType.connectTimeout) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.sendTimeout) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.receiveTimeout) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.response) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.cancel) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }

  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}
