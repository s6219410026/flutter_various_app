import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_various_app/views/car_buy_ui.dart';
import 'package:flutter_various_app/views/temperature_ui.dart';
import 'package:flutter_various_app/views/triangle_area_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Home',
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Various App',
              ),
              accountEmail: Text(
                'SAU',
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              currentAccountPicture: Image.asset(
                'assets/images/banner.png',
              ),
              otherAccountsPictures: [
                Image.network(
                  'https://mpics.mgronline.com/pics/Images/564000002821701.JPEG',
                ),
              ],
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TemperatureUI(),
                  ),
                );
              },
              title: Text(
                'Temperature Convertor',
                style: TextStyle(
                  color: Colors.grey[850],
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.temperatureHigh,
                color: Colors.green,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TriangleAreaUI(),
                  ),
                );
              },
              title: Text(
                'Triangle Area',
                style: TextStyle(
                  color: Colors.grey[850],
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.exclamationTriangle,
                color: Colors.red,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarBuyUI(),
                  ),
                );
              },
              title: Text(
                'Car Buy',
                style: TextStyle(
                  color: Colors.grey[850],
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.car,
                color: Colors.black,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                exit(0);
              },
              title: Text(
                'ออกจากแอปพลิเคชัน',
                style: TextStyle(
                  color: Colors.grey[850],
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                FontAwesomeIcons.doorClosed,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TemperatureUI(),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.temperatureHigh,
              ),
              label: Text(
                'Go to Temperature Convertor',
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                fixedSize: Size(
                  MediaQuery.of(context).size.width - 80.0,
                  50.0,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TriangleAreaUI(),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.temperatureHigh,
              ),
              label: Text(
                'Go to Triangle Area',
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                fixedSize: Size(
                  MediaQuery.of(context).size.width - 80.0,
                  50.0,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarBuyUI(),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.temperatureHigh,
              ),
              label: Text(
                'Go to Car Buy',
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                fixedSize: Size(
                  MediaQuery.of(context).size.width - 80.0,
                  50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
