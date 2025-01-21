import 'package:flutter/material.dart';

class MerchStore extends StatelessWidget {
  static const String name ='merch_screen';
  const MerchStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Merch Store"),
      ),
      body: Placeholder(),
    );
  }
}