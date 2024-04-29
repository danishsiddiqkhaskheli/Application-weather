import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/Constant.dart';
import 'package:weatherapp/weathermodel.dart';

class WeatherApi {
  final String baseUrl = "http://api.weatherapi.com/v1/current.json";

  Future<ApiResponse> getCurrentWeather(String location) async {
    String apiUrl = "$baseUrl?key=$apiKey&q=$location";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Faile to load weather");
      }
    } catch (e) {
      throw Exception("Faile to load weather");
    }
  }
}
