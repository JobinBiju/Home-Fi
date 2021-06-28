import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:home_fi/app/data/models/adafruit_get.dart';
import 'package:http/http.dart' as http;

class TempHumidAPI {
  static String username = 'blairripper';
  static String? aioKey = dotenv.env['API_Key'].toString();
  static String tempFeed = 'temperature';
  static String humidFeed = 'humidity';
  static String led1Feed = 'led-1';
  static String rgbFeed = 'color';
  static String mainURL = 'https://io.adafruit.com/api/v2/';

  static Future<AdafruitGET> getTempData() async {
    http.Response response = await http.get(
      Uri.parse(mainURL + '$username/feeds/$tempFeed'),
      headers: <String, String>{'X-AIO-Key': aioKey!},
    );
    if (response.statusCode == 200) {
      return AdafruitGET.fromRawJson(response.body);
    } else {
      throw Error();
    }
  }

  static Future<AdafruitGET> getHumidData() async {
    http.Response response = await http.get(
      Uri.parse(mainURL + '$username/feeds/$humidFeed'),
      headers: <String, String>{'X-AIO-Key': aioKey!},
    );
    if (response.statusCode == 200) {
      return AdafruitGET.fromRawJson(response.body);
    } else {
      throw Error();
    }
  }

  static Future<AdafruitGET> getLed1Data() async {
    http.Response response = await http.get(
      Uri.parse(mainURL + '$username/feeds/$led1Feed'),
      headers: <String, String>{'X-AIO-Key': aioKey!},
    );
    if (response.statusCode == 200) {
      return AdafruitGET.fromRawJson(response.body);
    } else {
      throw Error();
    }
  }

  static Future<bool> updateLed1Data(String value) async {
    http.Response response = await http.post(
      Uri.parse(mainURL + '$username/feeds/$led1Feed/data'),
      headers: <String, String>{
        'X-AIO-Key': aioKey!,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "datum": {"value": value}
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Error();
    }
  }

  static Future<AdafruitGET> getRGBstatus() async {
    http.Response response = await http.get(
      Uri.parse(mainURL + '$username/feeds/$rgbFeed'),
      headers: <String, String>{'X-AIO-Key': aioKey!},
    );
    if (response.statusCode == 200) {
      return AdafruitGET.fromRawJson(response.body);
    } else {
      throw Error();
    }
  }

  static Future<bool> updateRGBdata(String value) async {
    http.Response response = await http.post(
      Uri.parse(mainURL + '$username/feeds/$rgbFeed/data'),
      headers: <String, String>{
        'X-AIO-Key': aioKey!,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "datum": {"value": value}
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Error();
    }
  }
}
