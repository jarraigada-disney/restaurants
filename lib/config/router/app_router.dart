import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/entities/restaurant.dart';
// import 'package:restaurant_app/screens/restaurants/restaurant_List/restaurant_details_screen.dart';
import 'package:restaurant_app/presentation/screens/screens.dart';


// GoRouter configuration

final appRouter = GoRouter(

  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
        path: '/restaurants',
        name: RestaurantsScreen.name,
        builder: (context, state) => const RestaurantsScreen(),
        routes: [
          GoRoute(
              path: 'restaurantDetails',
              name: "restaurant_details_screen",
              builder: (context, state) {
                final data = state.extra as Map<String, dynamic>; // Cast to Map
                final Restaurant restaurantItem = data['restaurantItem'];
                return RestaurantDetailsScreen(restaurantItem: restaurantItem);
              }),
        ]),
    GoRoute(
      path: '/merchandiseStore',
      name: MerchStore.name,
      builder: (context, state) => const MerchStore(),
    ),
  ],
);
