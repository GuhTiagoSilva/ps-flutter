import 'package:dio/dio.dart';
import 'package:ocean_tech/model/country.dart';
import 'package:ocean_tech/model/ocean.dart';
import 'package:ocean_tech/services/service_config.dart';

class CountryService {
  static final String _endpoint =
      "https://ocean-tech.herokuapp.com/countries/notPaged";

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<Country>> findAll() async {
    List<Country> countries = [];

    try {
      Response response = await service.create().get(_endpoint);
      if (response.statusCode == 200) {
        response.data.forEach((value) {
          countries.add(Country.fromMap(value));
        });
      }
    } catch (error) {
      print("Service Error: $error");
      throw error;
    }
    return countries;
  }
}
