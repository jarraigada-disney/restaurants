import 'package:dio/dio.dart';
import 'package:restaurant_app/core/data_source/restaurants_data_source.dart';
import 'package:restaurant_app/driver_adapter/mappers/restaurant_mapper.dart';
import 'package:restaurant_app/driver_adapter/models/restaurant_Api_Mock/restaurant_from_api.dart';
import 'package:restaurant_app/entities/restaurant.dart';

class RestaurantApiMockImp extends RestaurantsDataSource {
  final dio =
      Dio(BaseOptions(baseUrl: 'https://apimocha.com/disneyrestaurants'));

  @override
  Future<List<Restaurant>> getRestaurants() async {
    //Api call
    final apiResponse = await dio.get('/restaurantsList');

    //decode json content .data  into a list
    final responseList = apiResponse.data; 
    //Map the list
    final List<RestaurantFromApiMock> restaurantMocks = responseList
        .map<RestaurantFromApiMock>(
            (item) => RestaurantFromApiMock.fromJson(item))
        .toList();
    //Convert from RestaurantFromApiMock model to my Restaurant model
    final List<Restaurant> restaurantList = restaurantMocks
        .map<Restaurant>(RestaurantMapper.restaurantFromApiMock)
        .toList();

    return restaurantList;
  }
}
