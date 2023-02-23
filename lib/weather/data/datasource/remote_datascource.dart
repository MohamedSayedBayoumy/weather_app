import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../core/untils/constances.dart';
import '../model/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel> getRemoteDataSource(String countryName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel> getRemoteDataSource(String countryName) async {
    Dio dio = Dio();
    try {
      var response = await dio.get(
          "${AppConstance.baseUrl}/data/2.5/weather?q=$countryName&appid=${AppConstance.apiKey}");
      print("response : $response") ;
      return WeatherModel.fromJson(response.data);
    } catch (w) {
      print(w);
      return WeatherModel(
          id: 1,
          name: 'name',
          description: 'description',
          icon: 'icon',
          pressure: 1);
    }
  }
}
