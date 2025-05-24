import 'dart:convert';
import 'package:http/http.dart' as http;
import 'forecast_model.dart';

class ApiService {
  final String baseUrl = "http://api.openweathermap.org/data/2.5/forecast"; //

  Future<List<Forecast>> fetchWeatherForecast(String city) async {
    final response = await http.get(Uri.parse('$baseUrl/forecast/$city'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Forecast> forecast =
          body.map((dynamic item) => Forecast.fromJson(item)).toList();
      return forecast;
    } else {
      throw Exception('Failed to load weather forecast');
    }
  }
}
