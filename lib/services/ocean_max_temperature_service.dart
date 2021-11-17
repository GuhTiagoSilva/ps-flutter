import 'package:dio/dio.dart';
import 'package:ocean_tech/model/country.dart';
import 'package:ocean_tech/model/country_amount_by_ocean_model.dart';
import 'package:ocean_tech/model/ocean.dart';
import 'package:ocean_tech/model/ocean_max_temperature_model.dart';
import 'package:ocean_tech/services/service_config.dart';

class OceanMaxTemperatureService {
  static final String _endpoint =
      "https://ocean-tech.herokuapp.com/oceans/temperature";

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<OceanMaxTemperatureModel>> getMaxTemperaturaOfAnOcean() async {
    List<OceanMaxTemperatureModel> countries = [];

    try {
      Response response = await service.create().get(_endpoint);
      if (response.statusCode == 200) {
        response.data.forEach((value) {
          countries.add(OceanMaxTemperatureModel.fromMap(value));
        });
      }
    } catch (error) {
      print("Service Error: $error");
      throw error;
    }
    return countries;
  }
}
