import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/functions/get_weather_color.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {

    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getWeatherColor(weatherModel.condition),
              getWeatherColor(weatherModel.condition)[200]!,
              getWeatherColor(weatherModel.condition)[50]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    weatherModel.nameCity,
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "updated at: ${weatherModel.timeUpdated.hour}:${weatherModel.timeUpdated.minute}",
                    style: const TextStyle(fontSize: 18,),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network("https:${weatherModel.imageCondition}"),
                  Text(
                    weatherModel.avgTemp.round().toString(),
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text("maxTemp: ${weatherModel.maxTemp.round()}"),
                      Text("minTemp: ${weatherModel.minTemp.round()}"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              Text(
                weatherModel.condition,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}