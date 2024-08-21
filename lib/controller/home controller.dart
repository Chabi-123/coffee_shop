import 'package:coffee_shop/model/home_pageMaode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coffee_shop/data/home_pageData.dart';

class HomeController extends GetxController {
  var selectedLocation = 'Select a Location    '.obs;
  var searchController = TextEditingController();
  var filteredData = <CoffeeModel>[].obs;

  @override
  void onInit() {
    filteredData.value = alldata;
    super.onInit();
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      filteredData.value = alldata;
    } else {
      filteredData.value = alldata
          .where((coffee) =>
          coffee.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void updateLocation(String newLocation) {
    selectedLocation.value = newLocation;
  }
}
