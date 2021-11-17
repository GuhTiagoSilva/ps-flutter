import 'package:flutter/material.dart';
import 'package:ocean_tech/model/country.dart';
import 'package:ocean_tech/utils/constants.dart';

class ItemCard extends StatelessWidget {
  final Country country;
  final VoidCallback press;
  const ItemCard({
    Key? key,
    required this.country,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: Color.fromRGBO(50, 75, 205, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${country.id}",
                child: Image.asset('assets/images/bandeira-do-brasil-og.jpg'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              country.name,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
        ],
      ),
    );
  }
}
