import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.search_rounded),
          Stack(
            children: [
              Icon(Icons.shopping_cart_checkout_outlined,size: 30,),
            ],
          ),

        ],
      ),
    );
  }
}
