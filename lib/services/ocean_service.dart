import 'package:dio/dio.dart';
import 'package:ocean_tech/model/ocean.dart';
import 'package:ocean_tech/services/service_config.dart';

class OceanService {
  static final String _endpoint =
      "https://ocean-tech.herokuapp.com/oceans/notPaged";

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<Ocean>> findAll() async {
    List<Ocean> oceans = [];

    try {
      Response response = await service.create().get(_endpoint);
      if (response.statusCode == 200) {
        response.data.forEach((value) {
          oceans.add(Ocean.fromMap(value));
        });
      }
    } catch (error) {
      print("Service Error: $error");
      throw error;
    }
    return oceans;
  }
}
