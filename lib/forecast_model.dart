class Forecast {
  final String date;
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final String windDirection;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int cloudiness;
  final String groundLevelPressure;

  Forecast({
    required this.date,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.cloudiness,
    required this.groundLevelPressure,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: json['date'],
      temperature: json['temperature'].toDouble(),
      description: json['description'],
      humidity: json['humidity'],
      windSpeed: json['wind_speed'].toDouble(),
      windDirection: json['wind_direction'],
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      cloudiness: json['cloudiness'],
      groundLevelPressure: json['ground_level_pressure'].toString(),
    );
  }
}
