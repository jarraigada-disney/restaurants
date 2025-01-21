import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/screens/restaurants/restaurant_List/restaurant_items.dart';

class RestaurantsScreen extends StatelessWidget {

  static const String name ='restaurant_screen';
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  _RestaurantsListView());
  }
}

class _RestaurantsListView extends StatelessWidget {

  
  const _RestaurantsListView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appRestaurantItems.length,
      itemBuilder: (context, index){
        final restaurantItem = appRestaurantItems[index];
      
    return _CustomListTile(restaurantItem: restaurantItem);
  }
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.restaurantItem,
  });

  final RestaurantItem restaurantItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(25),
         child: Image.asset(
           fit: BoxFit.cover,
           restaurantItem.restaurant.img,
           width: 80,
           ),
      ),title: Padding(
        padding: const EdgeInsets.fromLTRB(10,5,10,10),
        child: Card(
          elevation: 0,
          child: Column(
            children: [
              Row(
                 children: [ 
                 // Image.asset(
                // fit: BoxFit.cover,
                // restaurantItem.restnt.img,
                // width: 80,
                // ),
                  Column(
                    children: [
                      Text(restaurantItem.restaurant.title),
                      Text(restaurantItem.restaurant.parkName),
                      
                    ],
                  ),
                ],
                
              ),
            ElevatedButton(onPressed: () {
                        
                      }, child: Text('Begin Order'))],
          ),),
      ),
      onTap: () {
        context.pushNamed("order_details",extra: {"restaurant_id":restaurantItem.restaurant.title});
      },
    );
  }
}























// class Restaurant extends StatelessWidget{

  
//   final int id;
//   final String name;
//   final String parkName;
//   final String img;
//   const Restaurant({
//     super.key,
//     required this.id,
//     required this.name,
//     required this.parkName,
//     required this.img
//     });
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 child: _CoverImage(),
//                 )
//               ,
//               _RestaurantInfo(name: name,parkName: parkName,),
//               _ArrivallWindows(),
//               _Actions()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _Actions extends StatelessWidget {
//   const _Actions({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Column(children: [
//           Icon(Icons.restaurant),
//           Text("Begin Order")
//         ]),
//         Column(children: [
//           Icon(Icons.map),
//           Text("Find On Map")
//         ],),
//         Column(children: [
//           Icon(Icons.directions),
//           Text("Get Directions")
//         ],),
//         Column(children: [
//           Icon(Icons.restaurant_menu),
//           Text("View Menu")
//         ],)
//       ],
//       );
//   }
// }

// class _CoverImage extends StatelessWidget {
//   const _CoverImage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {

//     final screenSize = MediaQuery.of(context).size;
//     return
//     Container(
//       width: double.infinity,
//       child: Image.asset('assets/images/sunshine-tree-terrace-01-new.jpg',
//       height: screenSize.height*0.3,
//       fit: BoxFit.cover,
//       ),
//     );
      
//   }
// }


// class _ArrivallWindows extends StatelessWidget {
//   const _ArrivallWindows();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text("Select Arrival window"),
//         Row()],
//     );
//   }
// }



// class _RestaurantInfo extends StatelessWidget {
//   const _RestaurantInfo({
//     required this.name, required this.parkName,
//   });
//   final String name;
//   final String parkName;


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.centerLeft,
//       child: Row(
//         children: [
//           Icon(Icons.restaurant),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(name),
//               Text("Hosted by Coca-Cola"),
//               Text(parkName),
//               Text("Main Street, U.S.A.")
//             ],
//           ),
//         ],
//       )
//     );
//   }
// }