
import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.icon,
      required super.pressure});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
      id: json["id"],
      name: json["name"],
      description: json["weather"][0]['description'],
      icon: json["weather"][0]['icon'],
      pressure: json['main']['pressure']);
}
