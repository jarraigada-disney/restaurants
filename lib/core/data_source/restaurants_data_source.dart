import 'package:restaurant_app/entities/restaurant.dart';

abstract class RestaurantsDataSource {

  Future<List<Restaurant>> getRestaurants();

}