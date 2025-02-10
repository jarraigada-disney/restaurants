import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_inspire_twdc/font_inspire_twdc.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperion_components/hyperion_components.dart';
import 'package:restaurant_app/entities/restaurant.dart';
import 'package:restaurant_app/presentation/providers/restaurants/restaurants_providers.dart';

class RestaurantsScreen extends ConsumerWidget {
  static const String name = 'restaurant_screen';
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final child = ref.watch(restaurantController).when(data: (restaurants) {
      return ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurantItem = restaurants[index];
          // Text(restaurantItem.title);
          return _CustomListCard(restaurantItem: restaurantItem);
        },
      );
    }, error: (error, stackTrace) {
      print('Error fetching restaurants: $error');
      return Text('Error aca');
    }, loading: () {
      return Center(child: HyperionProgressLoader());
    });
    return Scaffold(
      appBar: AppBar(),
      body: child,
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(restaurantController.notifier).reset();
      }),
    );
  }
}

// class _RestaurantsListView extends ConsumerStatefulWidget  {
//   const _RestaurantsListView(this.reset);
//   final VoidCallback reset;

//   Widget build(BuildContext context,WidgetRef ref) {

//     return Placeholder();
//   }

//   @override
//   _RestaurantsListViewState createState() => _RestaurantsListViewState();

// }

// class _RestaurantsListViewState extends ConsumerState<_RestaurantsListView>{

//     @override
//   Widget build(BuildContext context) {

//     return ref.watch(restaurantController).when(data: (restaurants){ return ListView.builder(
//       itemCount: restaurants.length,
//       itemBuilder:(context, index) {
//         final restaurantItem = restaurants[index];
//         // Text(restaurantItem.title);
//         return _CustomListCard(restaurantItem: restaurantItem);
//       },
//       );},
//       error: (error,_){ return Text('Error');},
//       loading: (){return Center(child: HyperionProgressLoader());
//       });

//   }
// }

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
              title:
                  Text(restaurantItem.title, style: InspireTextStyle.t7_medium),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurantItem.parkName,
                    style: InspireTextStyle.t8_light,
                  ),
                  Text(
                    restaurantItem.location,
                    style: InspireTextStyle.t8_light,
                  )
                ],
              ),
              onTap: () {
                context.pushNamed("restaurant_details_screen",
                    extra: {'restaurantItem': restaurantItem});
              }),
          HyperionButton.secondary(
            label: 'Begin Order',
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 2,
            thickness: 1,
          )
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
    return ClipOval(
      child: Image.asset(
        fit: BoxFit.cover,
        restaurantItem.img,
        width: 56,
        height: 56,
      ),
    );
  }
}
