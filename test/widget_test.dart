// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert' as convert;

import 'package:flutter_airvisual/src/models/models.dart';
import 'package:flutter_airvisual/src/resources/air_api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('http 통신 테스트', () async {
    var url = 'https://api.airvisual.com/v2/nearest_city?key=36ff6fed-03b3-4c7b-b244-6df0158197cd';

    final uri = Uri.parse(url);

    var response = await http.get(uri);

    expect(response.statusCode, 200);

    var jsonResponse = convert.jsonDecode(response.body);
    var code = jsonResponse['status'];

    expect(code, 'success');

    AirResult result = AirResult.fromJson(jsonResponse);
    expect(result.data.current.pollution.aqius, 59);
  });

  test('AirApiProvider test', () async {
    AirApiProvider provider = AirApiProvider();
    AirResult result = await provider.fetchAirResult();

    expect(result.status, 'success');
  });
}
