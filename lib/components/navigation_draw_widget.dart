import 'package:flutter/material.dart';
import 'package:ocean_tech/pages/country/country_page.dart';
import 'package:ocean_tech/pages/country/country_amount_by_ocean_report_page.dart';
import 'package:ocean_tech/pages/oceans/ocean_home_screen.dart';
import 'package:ocean_tech/pages/oceans/max_temperature_of_ocean_report_page.dart';
import 'package:ocean_tech/pages/realtime-reports/oceans/ocean_temperature_report.dart';
import 'package:ocean_tech/pages/realtime-reports/oceans/ocean_ph_report_page.dart';
import 'package:ocean_tech/pages/realtime-reports/oceans/ocean_temperature_report.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Material(
      color: Color.fromRGBO(50, 75, 205, 1),
      child: ListView(
        padding: padding,
        children: <Widget>[
          const SizedBox(
            height: 48,
          ),
          buildMenuItem(
              text: 'Oceanos',
              icon: Icons.beach_access,
              onClicked: () => selectedItem(context, 0)),
          Divider(
            color: Colors.white70,
          ),
          const SizedBox(
            height: 10,
          ),
          buildMenuItem(
              text: 'Países',
              icon: Icons.location_history,
              onClicked: () => selectedItem(context, 1)),
          Divider(
            color: Colors.white70,
          ),
          const SizedBox(
            height: 10,
          ),
          buildMenuItem(
              text: 'Realtime - PH dos Oceanos',
              icon: Icons.water,
              onClicked: () => selectedItem(context, 2)),
          Divider(
            color: Colors.white70,
          ),
          const SizedBox(
            height: 10,
          ),
          buildMenuItem(
              text: 'Realtime - Temperatura dos Oceanos',
              icon: Icons.hot_tub,
              onClicked: () => selectedItem(context, 3)),
          Divider(
            color: Colors.white70,
          ),
          const SizedBox(
            height: 12,
          ),
          buildMenuItem(
              text: 'Quantidade de Países por Oceano',
              icon: Icons.location_city,
              onClicked: () => selectedItem(context, 4)),
          Divider(
            color: Colors.white70,
          ),
          const SizedBox(
            height: 10,
          ),
          buildMenuItem(
              text: 'Temperatura Máxima de um Oceano',
              icon: Icons.report,
              onClicked: () => selectedItem(context, 5)),
        ],
      ),
    ));
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OceanHomeScreen(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CountryPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OceanPhReportPage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OceanTemperatureReportPage(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CountryAmountByOceanPage(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MaxOceanTemperatureReportPage(),
        ));
        break;
    }
  }
}
