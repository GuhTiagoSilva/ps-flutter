import 'package:flutter/material.dart';
import 'package:ocean_tech/model/country.dart';
import 'package:ocean_tech/pages/country/components/color_and_size.dart';
import 'package:ocean_tech/pages/country/components/counter_with_fav_btn.dart';
import 'package:ocean_tech/pages/country/components/country_title_with_image.dart';
import 'package:ocean_tech/utils/constants.dart';

import 'description.dart';

class Body extends StatelessWidget {
  final Country country;

  const Body({Key? key, required this.country}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(country: country),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(country: country),
                      SizedBox(height: kDefaultPaddin / 2),
                      SizedBox(height: kDefaultPaddin / 2),
                    ],
                  ),
                ),
                CountryTitleWithImage(country: country)
              ],
            ),
          )
        ],
      ),
    );
  }
}
