import 'package:dio/dio.dart';
import 'package:ocean_tech/model/country.dart';
import 'package:ocean_tech/model/country_amount_by_ocean_model.dart';
import 'package:ocean_tech/model/ocean.dart';
import 'package:ocean_tech/services/service_config.dart';

class CountryServiceAmount {
  static final String _endpoint =
      "https://ocean-tech.herokuapp.com/countries/oceans";

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<CountryAmountByOceanModel>> getCountryAmountByOcean() async {
    List<CountryAmountByOceanModel> countries = [];

    try {
      Response response = await service.create().get(_endpoint);
      if (response.statusCode == 200) {
        response.data.forEach((value) {
          countries.add(CountryAmountByOceanModel.fromMap(value));
        });
      }
    } catch (error) {
      print("Service Error: $error");
      throw error;
    }
    return countries;
  }
}
