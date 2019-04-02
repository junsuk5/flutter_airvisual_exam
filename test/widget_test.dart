// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert' as convert;

import 'package:flutter_airvisual/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('http 통신 테스트', () async {
    var url = 'https://api.airvisual.com/v2/nearest_city?key=YKK6AtsGKLrRZyJht';

    var response = await http.get(url);

    expect(response.statusCode, 200);

    var jsonResponse = convert.jsonDecode(response.body);
    var code = jsonResponse['status'];

    expect(code, 'success');

    AirResult result = AirResult.fromJson(jsonResponse);
    expect(result.data.current.pollution, 57);
  });
}
