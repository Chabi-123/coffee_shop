import 'package:coffee_shop/constant/constant_file.dart';
import 'package:coffee_shop/controller/order_controller.dart';
import 'package:coffee_shop/model/home_pageMaode.dart';
import 'package:coffee_shop/model/home_pageMaode.dart';
import 'package:coffee_shop/model/home_pageMaode.dart';
import 'package:coffee_shop/model/home_pageMaode.dart';
import 'package:coffee_shop/model/home_pageMaode.dart';
import 'package:coffee_shop/pages/delivary_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  CoffeeModel coffeeModel;
  OrderPage({super.key,required this.coffeeModel});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.put(OrderController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Order', style: myStyle(20)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xffeeeeee),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(6),
                    height: 50,
                    width: 170,
                    child: GestureDetector(
                      onTap: () {
                        orderController.toggleDelivery(true);
                      },
                      child: Obx(() => Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: orderController.isDelivery.value
                              ? one
                              : Color(0xffeeeeee),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Deliver',
                          style: myStyle(17, orderController.isDelivery.value
                              ? Colors.white : Colors.black,FontWeight.bold
                          ),
                        ),
                      )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6),
                    height: 50,
                    width: 160,
                    child: GestureDetector(
                      onTap: () {
                        orderController.toggleDelivery(false);
                      },
                      child: Obx(() => Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: orderController.isDelivery.value
                              ? Color(0xffeeeeee)
                              : one,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Pick Up',
                          style: myStyle(17, orderController.isDelivery.value
                              ? Colors.black
                              : Colors.white, FontWeight.bold,
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Delivery Address',
              style: myStyle(19, Colors.black, FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jl. Kpg Sutoyo', style: myStyle(18,Colors.black,FontWeight.bold)),
                Text('Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
                    style: myStyle(16,Colors.grey)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey,width: 2)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit, size: 16),Gap(8),
                      Text('Edit Address',style: myStyle(15),),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey,width: 2)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.note_add_outlined, size: 16),
                      Gap(8),
                      Text('Add Note',style: myStyle(15),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('${widget.coffeeModel.imgUrl}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.coffeeModel.name}',
                      style: myStyle(18,Colors.black,FontWeight.bold,),
                    ),
                    Text(
                      '${widget.coffeeModel.name}',
                      style: myStyle(16,Colors.grey,),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(
                      onPressed: orderController.decreaseQuantity,
                      icon: Icon(Icons.remove),
                    ),
                    Obx(() => Text(orderController.quantity.value.toString())),
                    IconButton(
                      onPressed: orderController.increaseQuantity,
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Colors.orangeAccent.withOpacity(0.2),thickness: 4,),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.discount, color: one,),
                SizedBox(width: 8),
                Text('1 Discount is Applied', style: myStyle(18,Colors.black,FontWeight.bold)),
                Spacer(),
                Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Payment Summary',
              style: myStyle(20, Colors.black, FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Price', style: myStyle(18)),
                Text('\$4.53', style: myStyle(18,Colors.black,FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery Fee', style: myStyle(18)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '\$ 1.0  ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text('\$2.0', style: myStyle(18,Colors.black,FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.wallet,color: one,),
                    Gap(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cash/Wallet', style: myStyle(18,Colors.black,FontWeight.bold)),
                        Text('\$5.53', style: myStyle(18,one)),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_down_sharp),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(DeliveryTrackingScreen());
              },
              child: Text('Order', style: myStyle(20, Colors.white)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: one,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

