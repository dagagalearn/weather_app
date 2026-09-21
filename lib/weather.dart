class Weather{
  final String cityName;
  final double temperature;
  final String condition;
  final String description;
  final int humidity;
  final double windSpeed;
  final double feelsLike;
  final String iconCode;

Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLike,
    required this.iconCode,
  });
    
  factory Weather.fromJSON(Map<String, dynamic> json){
    return Weather(
      cityName: json['name'] as String,
      temperature: (json['main']['temp'] as num).toDouble(),
      condition: (json['weather'][0]['main'] as String),
      description: (json['weather'][0]['description'] as String),
      humidity: (json['main']['humidity'] as num).toInt(),
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      iconCode: json['weather'][0]['icon'] as String,
    );
  }
}