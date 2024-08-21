import 'package:coffee_shop/model/home_pageMaode.dart';

class CartModel {
  static final List<CoffeeModel> cartItems = [];

  static void addItem(CoffeeModel item) {
    cartItems.add(item);
  }
}