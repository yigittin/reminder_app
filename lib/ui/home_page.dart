import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder_app/services/notification_services.dart';
import 'package:reminder_app/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    NotifyHelper();
    NotifyHelper().initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          Text(
            'Theme Data',
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          NotifyHelper().displayNotification(
              title: "Theme Change",
              body: Get.isDarkMode ? "Light Mode" : "Dark Mode");
        },
        child: Icon(
          Icons.nightlight_round,
          size: 20,
        ),
      ),
      actions: [
        Icon(
          Icons.person,
          size: 20,
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
