import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DemoUrlLauncher extends StatefulWidget {
  const DemoUrlLauncher({super.key});

  @override
  State<DemoUrlLauncher> createState() => _DemoUrlLauncherState();
}

class _DemoUrlLauncherState extends State<DemoUrlLauncher> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Circular Indicator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          MaterialButton(
            color: Colors.green,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            onPressed: () {
              launchUrl(
                Uri.parse("tel:+1-555-010-999"),
              );
            },
            child: Text("Open Phone"),
          ),
          MaterialButton(
            color: Colors.green,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            onPressed: () {
              launchUrl(
                Uri.parse("sms:5550101234"),
              );
            },
            child: Text("Open SMS"),
          ),
          MaterialButton(
            color: Colors.green,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            onPressed: () {
              launchUrl(
                Uri.parse("mailto:smith@example.org?subject=News&body=New%20plugin"),
              );
            },
            child: Text("Open Email"),
          ),
          MaterialButton(
            color: Colors.green,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            onPressed: () {
              launchUrl(
                Uri.parse("https://flutter.dev"),
                mode: LaunchMode.inAppBrowserView,
              );
            },
            child: Text("Open Website"),
          ),
          // YoutubePlayer(
          //   controller: _controller,
          //   showVideoProgressIndicator: true,
          // ),
        ],
      ),
    );
  }
}
