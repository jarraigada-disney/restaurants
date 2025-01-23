import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/restaurants/restaurant_List/restaurant_items.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const String name = 'restaurant_details_screen';
  final RestaurantItem restaurantItem;

  const RestaurantDetailsScreen({super.key, required this.restaurantItem});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Image.asset(restaurantItem.restaurant.img),
          _restaurantInfo(restaurantItem: restaurantItem),
          _ArrivalWindow(),
          _Actions()
        ],
      )),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> items = [
    {
      'icon': Icons.mobile_friendly_rounded,
      'text': "Begin Order",
    },
    {
      'icon': Icons.location_pin,
      'text': "Find on Map",
    },
    {
      'icon': Icons.directions_walk_rounded,
      'text': "Get Directions",
    },
    {
      'icon': Icons.restaurant_rounded,
      'text': "View Menu",
    },
    // Add more items as needed
  ];
    return Column(
      children: [
        SizedBox(width: 30),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the row content
          children: [
            ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10), // Add padding between items
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(item['icon'], color: Color.fromARGB(255, 37, 131, 238), size: 50),
                  Text(item['text']),
                ],
              ),
            )).toList(), // Convert the iterable to a list
            SizedBox(width: 20),
          ],
            ),
        ),
      ],
    );
}
}

class _ArrivalWindow extends StatelessWidget {
  const _ArrivalWindow();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        ListTile(
            title: Text(
                style: TextStyle(fontWeight: FontWeight.w300),
                "Select an Arrival window"),
            subtitle: _AvailableWindows()),
      ],
    );
  }
}

class _AvailableWindows extends StatelessWidget {
  const _AvailableWindows({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
          SizedBox(height: 20,),
          CircularProgressIndicator(color: Color.fromARGB(255, 37, 131, 238), strokeWidth: 3,backgroundColor: Colors.grey[400],),
          SizedBox(height: 15,),
          Divider(height: 2,thickness: 1,),
    ]));
  }
}

class _restaurantInfo extends StatelessWidget {
  final RestaurantItem restaurantItem;

  const _restaurantInfo({super.key, required this.restaurantItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Icon(Icons.mobile_friendly_rounded, size: 30),
          title: Text(
              style: TextStyle(fontWeight: FontWeight.w800),
              restaurantItem.restaurant.title),
          subtitle: _LocationSubtitle(restaurantItem: restaurantItem),
        ),
        SizedBox(
          height: 10,
        ),
      
          Divider(height: 2,thickness: 1,),],
    );
  }
}

class _LocationSubtitle extends StatelessWidget {
  const _LocationSubtitle({
    super.key,
    required this.restaurantItem,
  });

  final RestaurantItem restaurantItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(restaurantItem.restaurant.parkName),
        Text(restaurantItem.restaurant.location)
      ],
    );
  }
}
