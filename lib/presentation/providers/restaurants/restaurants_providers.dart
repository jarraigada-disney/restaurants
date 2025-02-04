import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/core/repositories/restaurant_repository.dart';
import 'package:restaurant_app/entities/restaurant.dart';
import 'package:restaurant_app/presentation/providers/restaurants/restaurants_repo_provider.dart';
import 'package:restaurant_app/presentation/screens/restaurants/restaurant_List/restaurant_items.dart';


//Basic FutureProvider 
// final getResturantsProviders = FutureProvider<List<Restaurant>>((ref) async {
//   final restaurantRepository = ref.watch(restaurantRepositoryProvider);
//   return restaurantRepository.getRestaurants();
// });

final restaurantController = AsyncNotifierProvider<RestaurantsNotifier,List<Restaurant>>(() {

  return RestaurantsNotifier();
});
//Defino el caso de uso:
typedef RestaurantCallback = Future<List<Restaurant>> Function();

class RestaurantsNotifier extends AsyncNotifier<List<Restaurant>> {
  late RestaurantsRepository repository;
  RestaurantsNotifier() : super();

  Future<List<Restaurant>> refreshList() async {
    return repository.getRestaurants();
  }

  reset()async {
    state = AsyncValue.loading();  
    final restaurants = await repository.getRestaurants();
     state = AsyncValue.data(restaurants);
  }
  @override
  FutureOr<List<Restaurant>> build() {
    repository = ref.watch(restaurantRepositoryProvider);
    return refreshList();
  }
}

final restaurantProvider = FutureProvider((ref) async {
  return List<Restaurant>;
});
