import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:myfoody/main.dart';
import 'package:myfoody/src/features/application.dart';
import 'package:myfoody/src/features/data.dart';
import 'package:myfoody/src/features/domain.dart';
import 'package:myfoody/src/services/network/dio_client.dart';
import 'package:myfoody/src/services/network/network.dart';
import 'package:myfoody/src/shared/shared.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendport;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> callback() async {
    final notificationHelper = NotificationHelper();
    final dio = Dio();
    final httpClient = HttpClient();
    const baseUrl = 'https://restaurant-api.dicoding.dev';
    final dioClient =
        DioClient(baseUrl: baseUrl, dio: dio, httpClient: httpClient);
    final restaurantRepository = RestaurantRepository(dioClient);
    final restaurantListResponse =
        await restaurantRepository.getRestaurantList();
    final restaurant = restaurantListResponse.maybeWhen(success: (data) {
      final rawData = RestaurantMapper.mapToRestaurantList(data);
      return rawData.restaurants.randomize();
    }, orElse: () {
      return Restaurant();
    });

    await notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, restaurant);

    _uiSendport ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendport?.send(null);
  }
}
