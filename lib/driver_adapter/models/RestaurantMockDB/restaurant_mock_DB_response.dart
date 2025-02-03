

import 'dart:convert';

import 'package:restaurant_app/driver_adapter/models/RestaurantMockDB/restaurant_from_restaurant_mock.dart';

List<RestaurantFromRestaurantMock> RestaurantFromRestaurantMockFromJson(String str) => List<RestaurantFromRestaurantMock>.from(json.decode(str).map((x) => RestaurantFromRestaurantMock.fromJson(x)));

String RestaurantFromRestaurantMockToJson(List<RestaurantFromRestaurantMock> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


