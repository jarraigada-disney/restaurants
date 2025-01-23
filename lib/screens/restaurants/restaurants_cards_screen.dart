import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/screens/restaurants/restaurant_List/restaurant_items.dart';

class RestaurantsScreen extends StatelessWidget {
  static const String name = 'restaurant_screen';
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _RestaurantsListView(),
    );
  }
}

class _RestaurantsListView extends StatelessWidget {
  const _RestaurantsListView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: appRestaurantItems.length,
        itemBuilder: (context, index) {
          final restaurantItem = appRestaurantItems[index];

          return _CustomListCard(restaurantItem: restaurantItem);
        });
  }
}

class _CustomListCard extends StatelessWidget {
  const _CustomListCard({
    required this.restaurantItem,
  });

  final RestaurantItem restaurantItem;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        child: Row(children: [
          _CustomListTile(restaurantItem: restaurantItem),
        ]));
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.restaurantItem,
  });

  final RestaurantItem restaurantItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ListTile(
              leading: _AvatarImage(restaurantItem: restaurantItem),
              title: Text(restaurantItem.restaurant.title),
              subtitle: Text(restaurantItem.restaurant.parkName),
              onTap: () {
                context.pushNamed("restaurant_details_screen",
                    extra: {'restaurantItem': restaurantItem});
              }),
          ElevatedButton(onPressed: () {}, child: Text('Begin Order')),
        ],
      ),
    );
  }
}

class _AvatarImage extends StatelessWidget {
  const _AvatarImage({
    required this.restaurantItem,
  });

  final RestaurantItem restaurantItem;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        fit: BoxFit.cover,
        restaurantItem.restaurant.img,
        width: 56,
        height: 56,
      ),
    );
  }
}
