import 'package:coffee_shop/constant/constant_file.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details',style: myStyle(18),),
        centerTitle: true,
        actions: [
          Icon(Icons.favorite_border),
          Gap(20)
        ],
      ),
      body: Column(
        children: [
          Gap(20),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height*0.25,
              width:MediaQuery.of(context).size.width*0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage('assets/images/coffee_details.jpg'),fit: BoxFit.cover),

              ),
            ),
          )
        ],
      ),
    );
  }
}
