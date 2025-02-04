
//Provider que provee el repositorrio

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/core/repositories/restaurant_repository.dart';
import 'package:restaurant_app/driver_adapter/data_sources/restaurant_mock_data_source.dart';
import 'package:restaurant_app/driver_adapter/repositories/restaurant_repo_imp.dart';


//Only read
final restaurantRepositoryProvider = Provider<RestaurantsRepository>((ref) {
  
  //The specific implementation i need to bring information ( in this case, the mock):
  return RestaurantRepoImp(RestaurantMockDataSource());

});