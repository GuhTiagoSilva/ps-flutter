import 'package:flutter/material.dart';
import 'package:ocean_tech/model/country.dart';
import 'package:ocean_tech/utils/constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.country,
  }) : super(key: key);

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        "",
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
