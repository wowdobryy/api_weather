import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/weather_forecast_daily.dart';
import '../utilities/forecast_util.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const DetailView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var pressure = forecastList![0].pressure * 0.750062;
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Util.getItem(FontAwesomeIcons.thermometer,
            pressure.round(), 'mm Hg'),
        Util.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
        Util.getItem(FontAwesomeIcons.wind, wind.toInt(), 'm/s'),
      ],
    );
  }
}
