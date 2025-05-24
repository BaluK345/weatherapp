import 'package:flutter/material.dart';
import 'api_service.dart';
import 'forecast_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherForecastPage(),
    );
  }
}

class WeatherForecastPage extends StatefulWidget {
  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  final ApiService apiService = ApiService();
  late Future<List<Forecast>> futureForecast;

  @override
  void initState() {
    super.initState();
    futureForecast = apiService.fetchWeatherForecast("London");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: FutureBuilder<List<Forecast>>(
        future: futureForecast,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          } else {
            final forecast = snapshot.data!;
            return ListView.builder(
              itemCount: forecast.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(forecast[index].date),
                  subtitle: Text(
                      '${forecast[index].temperature} °C, ${forecast[index].description}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
