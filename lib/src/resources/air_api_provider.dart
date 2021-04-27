import 'package:flutter_airvisual/src/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

class AirApiProvider {
  final _apiKey = '36ff6fed-03b3-4c7b-b244-6df0158197cd';
  final _baseUrl = 'https://api.airvisual.com/v2/';

  Future<AirResult> fetchAirResult() async {
    final response = await http.get(Uri.parse('${_baseUrl}nearest_city?key=$_apiKey'));

    if (response.statusCode != 200) {
      throw StateError('네트워크 에러 status code : ${response.statusCode}');
    }

    var json = convert.jsonDecode(response.body);
    return AirResult.fromJson(json);
  }
}