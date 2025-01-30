import 'package:flutter/material.dart';
import 'package:restaurant_app/presentation/screens/restaurants/restaurant.dart';

class RestaurantItem {
  final Restaurant restaurant;

  const RestaurantItem(this.restaurant);
}


const appRestaurantItems = <RestaurantItem>[


  RestaurantItem(Restaurant(parkName: 'Magic Kingdom Park', img: 'assets/images/caseys-corner-hotdog-chili-cheese-deluxe-16x9.jpg', title: 'Casey´s Corner', id: '00001',location: 'Main Street, U.S.A.')
  ),
  RestaurantItem(Restaurant(parkName: 'Magic Kingdom Park', img: 'assets/images/columbia-harbour-house-gallery06.jpg', title: 'Columbia Harbour House', id: '00002',location: '')
  ),




];

