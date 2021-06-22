import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_fi/app/data/models/humidity_model.dart';
import 'package:home_fi/app/data/models/temperature_model.dart';
import 'package:http/http.dart' as http;

class TempHumidAPI {
  static String username = 'blairripper';
  static String? aioKey = dotenv.env['API_Key'].toString();
  static String tempFeed = 'temperature';
  static String humidFeed = 'humidity';
  static String mainURL = 'https://io.adafruit.com/api/v2/';

  static Future getTempData() async {
    http.Response response = await http.get(
        Uri.parse(mainURL + '$username/feeds/$tempFeed'),
        headers: <String, String>{'X-AIO-Key': aioKey!});
    if (response.statusCode == 200) {
      return Temperature.fromRawJson(response.body);
    } else {
      print(json.decode(response.body)['error']);
    }
  }

  static Future getHumidData() async {
    http.Response response = await http.get(
        Uri.parse(mainURL + '$username/feeds/$humidFeed'),
        headers: <String, String>{'X-AIO-Key': aioKey!});
    if (response.statusCode == 200) {
      return Humidity.fromRawJson(response.body);
    } else {
      print(json.decode(response.body)['error']);
    }
  }
}
