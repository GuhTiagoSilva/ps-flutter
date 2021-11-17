import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ocean_tech/pages/realtime-reports/oceans/components/buildin_transform.dart';
import 'package:ocean_tech/pages/realtime-reports/oceans/components/single_weather.dart';
import 'package:ocean_tech/pages/realtime-reports/oceans/components/slider_dot.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class OceanTemperatureReportPage extends StatefulWidget {
  @override
  _OceanTemperatureReportPage createState() => _OceanTemperatureReportPage();
}

class _OceanTemperatureReportPage extends State<OceanTemperatureReportPage> {
  int _currentPage = 0;
  String? bgImg;

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bgImg = 'assets/sunny.jpg';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: () => print('Menu Clicked!'),
              child: SvgPicture.asset(
                'assets/menu.svg',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              bgImg!,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            Container(
              margin: EdgeInsets.only(top: 140, left: 15),
              child: Row(
                children: [
                  for (int i = 0; i < 10; i++)
                    if (i == _currentPage) SliderDot(true) else SliderDot(false)
                ],
              ),
            ),
            TransformerPageView(
              scrollDirection: Axis.horizontal,
              transformer: ScaleAndFadeTransformer(),
              viewportFraction: 0.8,
              onPageChanged: _onPageChanged,
              itemCount: 10,
              itemBuilder: (ctx, i) => SingleWeather(i),
            ),
          ],
        ),
      ),
    );
  }
}
