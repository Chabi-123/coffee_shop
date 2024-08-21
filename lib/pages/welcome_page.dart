import 'package:coffee_shop/constant/constant_file.dart';
import 'package:coffee_shop/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/cofee_wallpaper.jpg'),fit: BoxFit.cover,)
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Gap(150),
              Container(
                margin: EdgeInsets.only(right: 20),
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.27,
                decoration: BoxDecoration(
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Fall in love with',style: myStyle(35,Colors.white,FontWeight.bold)),
                      Text('Coffee in Blissful',style: myStyle(35,Colors.white,FontWeight.bold)),
                      Text('Delight!',style: myStyle(35,Colors.white,FontWeight.bold)),
                      Text('Welcome to our cozy coffee corner, were',style: myStyle(18,Colors.white,)),
                      Text('every cup is delightful for you',style: myStyle(18,Colors.white,)),
                    ],
                  ),
                ),
              ),
              Spacer(),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width*0.8,
                height: 50,
                color: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                onPressed: (){
                  Get.to(HomePage());
              },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Get Started',style: TextStyle(fontSize: 18,color: Colors.white),),
                  ],
                ),
              ),
              Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}


