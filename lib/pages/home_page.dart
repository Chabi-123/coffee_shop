import 'package:coffee_shop/controller/home%20controller.dart';
import 'package:coffee_shop/pages/coffee_detail_page.dart';
import 'package:coffee_shop/constant/constant_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Gap(20),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    color: Colors.black87,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Location', style: myStyle(16, Colors.white)),
                        Row(
                          children: [
                            Obx(() => DropdownButton<String>(
                              value: homeController.selectedLocation.value,
                              dropdownColor: Colors.black87,
                              style: myStyle(16, Colors.white),
                              underline: Container(),
                              icon: Icon(Icons.arrow_drop_down_circle_sharp, color: Colors.white),
                              items: <String>['Select a Location    ', 'Wangdue', 'Paro', 'Thimphu', 'Mongar']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                homeController.updateLocation(newValue!);
                              },
                            )),
                          ],
                        ),
                        Gap(10),
                        TextFormField(
                          controller: homeController.searchController,
                          onChanged: (value) {
                            homeController.filterSearchResults(value);
                          },
                          style: myStyle(18, Colors.white),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: 'Search by name...',
                            prefixIcon: Icon(Icons.search, color: Colors.white, size: 30),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: -60,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("assets/images/buy_one.jpg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(100),
              Obx(() => GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: homeController.filteredData.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 4,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        color: Colors.white,
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage("${homeController.filteredData[index].imgUrl}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(2),
                                      height: 23,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.black87,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "${homeController.filteredData[index].rating}",
                                        style: myStyle(16, Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${homeController.filteredData[index].name}",
                                style: myStyle(22, Colors.black, FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${homeController.filteredData[index].detail}",
                                style: myStyle(18),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "\$${homeController.filteredData[index].price}",
                                    style: myStyle(18),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.orange[900],
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CoffeeDetailPage(coffee: homeController.filteredData[index]),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.add),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
