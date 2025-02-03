import 'package:restaurant_app/core/data_source/restaurants_data_source.dart';
import 'package:restaurant_app/core/repositories/restaurant_repository.dart';
import 'package:restaurant_app/entities/restaurant.dart';

class RestaurantRepoImp extends RestaurantsRepository{



    final RestaurantsDataSource datasource; 
    RestaurantRepoImp(this.datasource);


  @override 
  Future<List<Restaurant>> getRestaurants() {


    return this.datasource.getRestaurants();

  }


}