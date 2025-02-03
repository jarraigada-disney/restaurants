import 'package:restaurant_app/entities/restaurant.dart';

abstract class RestaurantsRepository {

  Future<List<Restaurant>> getRestaurants();

}