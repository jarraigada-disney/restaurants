import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_inspire_twdc/font_inspire_twdc.dart';
import 'package:hyperion_components/hyperion_components.dart';
import 'package:restaurant_app/config/theme/app_theme.dart';
import 'package:restaurant_app/driver_adapter/repositories/aw_repository_imp.dart';
import 'package:restaurant_app/driver_adapter/data_sources/aw_data_source_imp.dart';
import 'package:restaurant_app/presentation/providers/arrival_windows/aw_repository_provider.dart';
import 'package:restaurant_app/presentation/screens/restaurants/restaurant_List/restaurant_items.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const String name = 'restaurant_details_screen';
  final RestaurantItem restaurantItem;

  const RestaurantDetailsScreen({super.key, required this.restaurantItem});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(restaurantItem.restaurant.img),
            _restaurantInfo(restaurantItem: restaurantItem),
            _ArrivalWindow(restaurantItemId: restaurantItem.restaurant.id),
            _Actions(),
            _RestaurantHours(restaurantItem: restaurantItem),
            _DiningPlans(),
            _DiningExperience(),
            _TypeOfCuisine(),
            _Description()
          ],
        ),
      )),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Text(
          'Hit it out of the park with American baseball favorites: hot dogs, mini corn dogs and French fries. Soft drinks are also available.',
          style: TextStyle(fontWeight: FontWeight.w400)),
      Text('An Important Message',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      Text(
          'Valid admission required. A theme park reservation may be required based on admission type.',
          style: TextStyle(fontWeight: FontWeight.w400)),
      SizedBox(
        height: 20,
      ),
      Divider(
        height: 2,
        thickness: 1,
      ),
    ]);
  }
}

class _TypeOfCuisine extends StatelessWidget {
  const _TypeOfCuisine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text('Type of cuisine', style: TextStyle(fontWeight: FontWeight.w300)),
        Text('American',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 2,
          thickness: 1,
        ),
      ],
    );
  }
}

class _DiningExperience extends StatelessWidget {
  const _DiningExperience({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Text('Lunch And Dinner', style: TextStyle(fontWeight: FontWeight.w300)),
      Text('Quick Service Restaurant',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      SizedBox(
        height: 20,
      ),
      Divider(
        height: 2,
        thickness: 1,
      ),
    ]);
  }
}

class _DiningPlans extends StatelessWidget {
  const _DiningPlans({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        HyperionAccordion(titleLabel: 'Accepted Dining Plans', children: []),
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 2,
          thickness: 1,
        ),
      ],
    );
  }
}

class _RestaurantHours extends StatelessWidget {
  final RestaurantItem restaurantItem;
  const _RestaurantHours({super.key, required this.restaurantItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Text('Lunch And Dinner',
            style: TextStyle(
                fontWeight: FontWeight.w300)), // Bring from restaurantItem
        Text(
          '10:30 to 21:45',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text('\$14.99 and under per adult',
            style: TextStyle(fontWeight: FontWeight.w400)),
        Text('Quick Service Restaurant',
            style: TextStyle(fontWeight: FontWeight.w400)),
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 2,
          thickness: 1,
        ),
      ],
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
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...items.expand((item) {
                  return [
                    _singleItem(item: item),
                    VerticalDivider(
                        //??????????????????????
                        width: 20,
                        thickness: 1)
                  ];
                }).toList(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 2,
          thickness: 1,
        ),
      ],
    );
  }
}

class _singleItem extends StatelessWidget {
  final dynamic item;
  const _singleItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            item['icon'],
            color: colorList.first,
            size: 45,
          ),
          Text(
            item['text'],
            style: InspireTextStyle.t10_medium,
          ),
        ],
      ),
    );
  }
}

class _ArrivalWindow extends StatelessWidget {
  final String restaurantItemId;

  const _ArrivalWindow({super.key, required this.restaurantItemId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ListTile(
            title: Text(style: InspireTextStyle.t8_light, "Select an Arrival window"),
            subtitle: _AvailableWindows(restaurantItemId: restaurantItemId,)),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 2,
          thickness: 1,
        ),
      ],
    );
  }
}


class _AvailableWindows extends ConsumerWidget {
  final String restaurantItemId;
  const _AvailableWindows({required this.restaurantItemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    
    return Column(children: [
      FutureBuilder(
          future: AwRepositoryImp(dataSource: AwDataSourceImp())
              .slotPeriod(restaurantId: restaurantItemId),
          builder: (context, builder) {
            if (builder.hasError) {
              return Text('No windows available at the moment');
            }
            if (builder.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(builder.data!.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: HyperionButton.secondary(
                      size: HyperionButtonSize.small,
                      borderWidth: 2,
                      label: builder.data![index],
                      onPressed: () {},
                    ),
                  );
                })),
              );
            }
            return HyperionProgressLoader();
          }),
    ]);
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
          //Row? to align icon with title
          leading: Icon(
            Icons.mobile_friendly_rounded,
            size: 30,
            color: HyperionColor.slate900,
          ),
          title: Text(
              style: InspireTextStyle.t6_heavy,
              restaurantItem.restaurant.title),
          subtitle: _LocationSubtitle(restaurantItem: restaurantItem),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 2,
          thickness: 1,
        ),
      ],
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
        Text(
          restaurantItem.restaurant.parkName,
          style: InspireTextStyle.t9_light,
        ),
        Text(restaurantItem.restaurant.location,
            style: InspireTextStyle.t9_light)
      ],
    );
  }
}
