import 'package:flutter/services.dart';
import 'package:restaurant_app/core/data_source/restaurants_data_source.dart';
import 'package:restaurant_app/driver_adapter/mappers/restaurant_mapper.dart';
import 'package:restaurant_app/driver_adapter/models/RestaurantMockDB/restaurant_from_restaurant_mock.dart';
import 'package:restaurant_app/driver_adapter/models/RestaurantMockDB/restaurant_mock_DB_response.dart';
import 'package:restaurant_app/entities/restaurant.dart';

class RestaurantMockDataSource  extends RestaurantsDataSource{



  @override
  Future<List<Restaurant>> getRestaurants() async{
    

    // Load json content
    final response = await rootBundle.loadString('assets/data/mock_restaurants.json');

    //decode json content into a list 

    final restaurantMockResponse = RestaurantFromRestaurantMockFromJson(response);

    //Map the list
    final List<Restaurant> restaurantsList = restaurantMockResponse.map((restaurantMockResponse)=> RestaurantMapper.restaurantFromRestaurantMock(restaurantMockResponse)).toList(); 

    
    
    return restaurantsList;
  }

  

}