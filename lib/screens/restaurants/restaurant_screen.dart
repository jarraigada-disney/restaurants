import 'package:flutter/material.dart';
class Restaurant extends StatelessWidget{
  final int id;
  final String name;
  final String parkName;
  final String img;
  const Restaurant({
    super.key,
    required this.id,
    required this.name,
    required this.parkName,
    required this.img
    });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: _CoverImage(),
                )
              ,
              _RestaurantInfo(name: name,parkName: parkName,),
              _ArrivallWindows(),
              _Actions()
            ],
          ),
        ),
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(children: [
          Icon(Icons.restaurant),
          Text("Begin Order")
        ]),
        Column(children: [
          Icon(Icons.map),
          Text("Find On Map")
        ],),
        Column(children: [
          Icon(Icons.directions),
          Text("Get Directions")
        ],),
        Column(children: [
          Icon(Icons.restaurant_menu),
          Text("View Menu")
        ],)
      ],
      );
  }
}

class _CoverImage extends StatelessWidget {
  const _CoverImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    return
    Container(
      width: double.infinity,
      child: Image.asset('assets/images/sunshine-tree-terrace-01-new.jpg',
      height: screenSize.height*0.3,
      fit: BoxFit.cover,
      ),
    );
      
  }
}


class _ArrivallWindows extends StatelessWidget {
  const _ArrivallWindows();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Select Arrival window"),
        Row()],
    );
  }
}



class _RestaurantInfo extends StatelessWidget {
  const _RestaurantInfo({
    required this.name, required this.parkName,
  });
  final String name;
  final String parkName;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Icon(Icons.restaurant),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text("Hosted by Coca-Cola"),
              Text(parkName),
              Text("Main Street, U.S.A.")
            ],
          ),
        ],
      )
    );
  }
}