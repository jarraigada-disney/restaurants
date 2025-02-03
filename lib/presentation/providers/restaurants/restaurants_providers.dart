import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/entities/restaurant.dart';
import 'package:restaurant_app/presentation/providers/restaurants/restaurants_repo_provider.dart';
import 'package:restaurant_app/presentation/screens/restaurants/restaurant_List/restaurant_items.dart';


final getResturantsProviders = StateNotifierProvider<RestaurantsNotifier,List<Restaurant>>((ref) {


  final fetchRestaurants = ref.watch(restaurantRepositoryProvider ).getRestaurants;

  return RestaurantsNotifier(
    fetchRestaurants: fetchRestaurants
    );
  });

//Defino el caso de uso:
typedef RestaurantCallback = Future<List<Restaurant>> Function(); 


class RestaurantsNotifier extends StateNotifier<List<Restaurant>>{

  RestaurantCallback fetchRestaurants;

  RestaurantsNotifier({
    required this.fetchRestaurants
  }):super([]);

  Future<void> refreshList()async{
    
    
    final List<Restaurant> restaurants = await fetchRestaurants();
    state = [...state, ...restaurants];



  }
}


 
final restaurantProvider = FutureProvider((ref) async{
return List<RestaurantItem>;
});