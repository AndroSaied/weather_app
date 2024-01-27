class WeatherModel {
  final String nameCity;
  final DateTime timeUpdated;
  final String imageCondition;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String condition;

  WeatherModel(
      {required this.nameCity,
        required this.timeUpdated,
        required this.imageCondition,
        required this.maxTemp,
        required this.minTemp,
        required this.avgTemp,
        required this.condition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        nameCity: json["location"]["name"],
        timeUpdated: DateTime.parse(json["current"]["last_updated"]),
        imageCondition: json["current"]["condition"]["icon"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        avgTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        condition: json["current"]["condition"]["text"]
    );
  }
}