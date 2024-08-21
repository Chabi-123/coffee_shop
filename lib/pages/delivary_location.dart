import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class DeliveryTrackingScreen extends StatefulWidget {
  @override
  _DeliveryTrackingScreenState createState() => _DeliveryTrackingScreenState();
}

class _DeliveryTrackingScreenState extends State<DeliveryTrackingScreen> {
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.settings),
          Gap(10)
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/cofee_location.jpg'),fit: BoxFit.cover)
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '10 minutes left',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('Delivery to Jl. Kpg Sutoyo'),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Delivered your order'),
                    subtitle: Text(
                        'We will deliver your goods to you in the shortest possible time.'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/Latte.jpeg'), // Placeholder image
                    ),
                    title: Text('Brooklyn Simmons'),
                    subtitle: Text('Personal Courier'),
                    trailing: IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () {
                        launchUrl(
                          Uri.parse("tel:+1-555-010-999"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
