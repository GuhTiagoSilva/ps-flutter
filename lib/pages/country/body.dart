import 'package:flutter/material.dart';
import 'package:ocean_tech/model/country.dart';
import 'package:ocean_tech/pages/country/country_details_screen.dart';
import 'package:ocean_tech/pages/country/item_card.dart';
import 'package:ocean_tech/services/country_service.dart';
import 'package:ocean_tech/utils/constants.dart';

class Body extends StatelessWidget {
  var countryService = CountryService();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            child: FutureBuilder<List<Country>>(
          future: countryService.findAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return buildBody(snapshot.data as List<Country>);
              } else {
                return Center(
                  child: Text("Nenhum país cadastrado!"),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )),
      ],
    );
  }

  Padding buildBody(List<Country> countries) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: GridView.builder(
          itemCount: countries.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: kDefaultPaddin,
            crossAxisSpacing: kDefaultPaddin,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) => ItemCard(
                country: countries[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountryDetailsScreen(
                        country: countries[index],
                      ),
                    )),
              )),
    );
  }
}
