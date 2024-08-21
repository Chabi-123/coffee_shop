import 'package:coffee_shop/constant/constant_file.dart';
import 'package:coffee_shop/model/card_model.dart';
import 'package:coffee_shop/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/model/home_pageMaode.dart';

class CoffeeDetailPage extends StatefulWidget {
  final CoffeeModel coffee;

  CoffeeDetailPage({required this.coffee});

  @override
  _CoffeeDetailPageState createState() => _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends State<CoffeeDetailPage> {
  bool isExpanded = false;
  String selectedSize = 'M'; // Default selected size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coffee.name, style: myStyle(22)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(widget.coffee.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.coffee.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Rating: ${widget.coffee.rating}",
                style: myStyle(18,),
              ),
              Divider(color: Colors.grey, thickness: 2),
              SizedBox(height: 20),
              Text(
                isExpanded
                    ? widget.coffee.discription
                    : widget.coffee.discription.substring(0, 100) + '...',
                style: myStyle(18,),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? "Show Less" : "Read More",
                  style: myStyle(18, Colors.black,FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSizeButton("S"),
                  _buildSizeButton("M"),
                  _buildSizeButton("L"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Price',style:myStyle(22, Colors.black87,),),
                      Text(
                        "\$${widget.coffee.price}",
                        style: myStyle(22, Colors.brown[500], FontWeight.bold,),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      CartModel.addItem(widget.coffee);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderPage(coffeeModel: widget.coffee,)),
                      );
                    },
                    child: Text("             By Now             ", style: myStyle(15, Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: one,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedSize = size;
        });
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: selectedSize == size ? Colors.deepOrange : Colors.grey,
          width: 2,
        ),
      ),
      child: Text(
        size,
        style: TextStyle(
          fontSize: 16,
          color: selectedSize == size ? Colors.deepOrange : Colors.black,
        ),
      ),
    );
  }
}
