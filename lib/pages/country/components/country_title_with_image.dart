import 'package:flutter/material.dart';
import 'package:ocean_tech/model/country.dart';
import 'package:ocean_tech/utils/constants.dart';

class CountryTitleWithImage extends StatelessWidget {
  const CountryTitleWithImage({
    Key? key,
    required this.country,
  }) : super(key: key);

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            country.name,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Habitantes\n"),
                    TextSpan(
                      text: "${country.population}",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
            ],
          )
        ],
      ),
    );
  }
}
