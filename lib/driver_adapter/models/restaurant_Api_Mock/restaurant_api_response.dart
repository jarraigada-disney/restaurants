import 'dart:convert';

import 'package:restaurant_app/driver_adapter/models/restaurant_Api_Mock/restaurant_from_api.dart';
import 'package:restaurant_app/driver_adapter/models/restaurant_Mock_DB/restaurant_from_restaurant_mock.dart';

List<RestaurantFromApiMock> restaurantFromApiMockFromJson(String str) => List<RestaurantFromApiMock>.from(json.decode(str).map((x) => RestaurantFromRestaurantMock.fromJson(x)));

String restaurantFromApiMockToJson(List<RestaurantFromApiMock> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));