import 'dart:developer';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const _defaultConnectTimeout = 60 * 1000;
const _defaultReceiveTimeout = 60 * 1000;

class DioClient {
  final String baseUrl;
  final List<Interceptor>? interceptors;
  late Dio _dio;
  DioClient({
    required this.baseUrl,
    required Dio dio,
    this.interceptors,
    required HttpClient httpClient,
  }) {
    _dio = dio;
    _dio.options.baseUrl = baseUrl;

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.interceptors
        .add(PrettyDioLogger(requestBody: true, responseBody: true));
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }

    /// Only show logging in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          request: false,
          error: true,
          logPrint: (obj) {
            log(obj.toString());
          },
        ),
      );
    }
  }

  Future<Options> _getHeaders() async {
    var headers = <String, dynamic>{};
    headers['Accept'] = 'applications/json';
    headers['Content-Type'] = 'application/json';
    headers['User-Agent'] = 'MyFoody';

    return Options(
        headers: headers,
        sendTimeout: _defaultConnectTimeout,
        receiveTimeout: _defaultReceiveTimeout);
  }

  Future<T?> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get<T?>(uri,
          queryParameters: queryParameters,
          options: await _getHeaders(),
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<T?> post<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(uri,
          data: data,
          queryParameters: queryParameters,
          options: await _getHeaders(),
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = Dio();
  final httpClient = HttpClient();
  const baseUrl = 'https://restaurant-api.dicoding.dev';
  return DioClient(baseUrl: baseUrl, dio: dio, httpClient: httpClient);
});
