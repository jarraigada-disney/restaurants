import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_inspire_twdc/font_inspire_twdc.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperion_components/hyperion_components.dart';
import 'package:restaurant_app/entities/restaurant.dart';
import 'package:restaurant_app/presentation/providers/restaurants/restaurants_providers.dart';
import 'package:restaurant_app/presentation/screens/restaurants/restaurant_List/restaurant_items.dart';

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


class _RestaurantsListView extends ConsumerStatefulWidget  {
  const _RestaurantsListView();
 
  Widget build(BuildContext context,WidgetRef ref) {


    return Placeholder();
  }
  
  @override
  _RestaurantsListViewState createState() => _RestaurantsListViewState();
  
}

class _RestaurantsListViewState extends ConsumerState<_RestaurantsListView>{
  @override
  void initState() {
    super.initState();
    ref.read(getResturantsProviders.notifier).refreshList();
  }
    @override
  Widget build(BuildContext context) {

    final currentRestaurantList = ref.watch(getResturantsProviders);

    if (currentRestaurantList.isEmpty) {
    return Center(child: CircularProgressIndicator());
  }


    return ListView.builder(
      itemCount: currentRestaurantList.length,
      itemBuilder:(context, index) {
        final restaurantItem = currentRestaurantList[index];
        // Text(restaurantItem.title);
        return _CustomListCard(restaurantItem: restaurantItem);
      },
      );
  }
}

class _CustomListCard extends StatelessWidget {
  const _CustomListCard({
    required this.restaurantItem,
  });

  final Restaurant restaurantItem;

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

  final Restaurant restaurantItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ListTile(
              leading: _AvatarImage(restaurantItem: restaurantItem),
              title: Text(restaurantItem.title,style: InspireTextStyle.t7_medium),
              subtitle: Text(restaurantItem.parkName,style: InspireTextStyle.t8_light,),
              onTap: () {
                context.pushNamed("restaurant_details_screen",
                    extra: {'restaurantItem': restaurantItem});
              }
              ),
          HyperionButton.secondary(
            label: 'Begin Order',
            onPressed: () {},
            ),
        ],
      ),
    );
  }
}

class _AvatarImage extends StatelessWidget {
  const _AvatarImage({
    required this.restaurantItem,
  });

  final Restaurant restaurantItem;

  @override
  Widget build(BuildContext context) {
    return 
    ClipOval(
      child: Image.asset(
        fit: BoxFit.cover,
        restaurantItem.img,
        width: 56,
        height: 56,
      ),
    );
  }
}
