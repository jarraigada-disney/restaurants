import 'dart:convert';

import 'package:restaurant_app/core/data_source/arrival_window_data_source.dart';
import 'package:restaurant_app/core/mock/mock_restaurant_period.dart';
import 'package:restaurant_app/core/mock/mock_slot_period.dart';


class AwDataSourceImp extends ArrivalWindowDataSource{

@override
  Future<List<String>> slotPeriod({required String restaurantId}) async{
    await Future.delayed(Duration(seconds: 2));
    return getSlotTimesByRestaurantId(restaurantId);
  }
}

List<RestaurantSlot> parseRestaurantSlots(String jsonString) {
  final List<dynamic> jsonData = jsonDecode(jsonString);
  return jsonData.map((json) => RestaurantSlot.fromJson(json)).toList();
}

final List<RestaurantSlot> restaurantSlots = parseRestaurantSlots(mockRestaurantSlotsJson);



List<String> getSlotTimesByRestaurantId(String restaurantId) {
  final restaurant = restaurantSlots.firstWhere(
    (slot) => slot.restaurantId == restaurantId,
    orElse: () => RestaurantSlot(restaurantId: restaurantId, slotTimes: []), 
  );
  return restaurant.slotTimes;
} 
