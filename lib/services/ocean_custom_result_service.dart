import 'package:dio/dio.dart';
import 'package:ocean_tech/model/ocean.dart';
import 'package:ocean_tech/model/ocean_custom_result.dart';
import 'package:ocean_tech/services/service_config.dart';

class OceanCutomResultService {
  static final String _endpoint =
      "https://ocean-tech.herokuapp.com/oceans/current";

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<OceanCustomResult>> findAll() async {
    List<OceanCustomResult> oceans = [];

    try {
      Response response = await service.create().get(_endpoint);
      if (response.statusCode == 200) {
        response.data.forEach((value) {
          oceans.add(OceanCustomResult.fromMap(value));
        });
      }
    } catch (error) {
      print("Service Error: $error");
      throw error;
    }
    return oceans;
  }
}
