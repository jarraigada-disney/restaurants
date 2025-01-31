import 'package:flutter/material.dart';


class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon
  });
}


const appMenuItems = <MenuItem>[


  MenuItem(
    title: 'Restaurants', 
    subTitle: 'Restaurant Info', 
    link: '/restaurants', 
    icon: Icons.restaurant
  ),

  MenuItem(
    title: 'Merchandise Store', 
    subTitle: 'Merchandise store information', 
    link: '/merchandiseStore', 
    icon: Icons.shopping_bag
  ),




];


