import 'package:flutter/material.dart';
import 'package:flutter_airvisual/src/bloc/air_bloc.dart';
import 'package:flutter_airvisual/src/models/models.dart';

void main() => runApp(MyApp());

final airBloc = AirBloc();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NearestCity(),
    );
  }
}

class NearestCity extends StatefulWidget {
  @override
  _NearestCityState createState() => _NearestCityState();
}

class _NearestCityState extends State<NearestCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: StreamBuilder<AirResult>(
                stream: airBloc.airResult,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return _buildItem(snapshot.data);
                  } else {
                    return CircularProgressIndicator();
                  }
                })),
      ),
    );
  }

  Widget _buildItem(AirResult result) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '현재 위치 미세먼지',
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          height: 16,
        ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: _getColor(result),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('얼굴사진'),
                    result == null
                        ? Text('측정중')
                        : Text(
                            '${result.data.current.pollution.aqius}',
                            style: TextStyle(fontSize: 40),
                          ),
                    Text(
                      _getStatusString(result),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.network(
                          'https://airvisual.com/images/${result.data.current.weather.ic}.png',
                          width: 32,
                          height: 32,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          '${result.data.current.weather.tp}°',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    Text(
                      '습도 ${result.data.current.weather.hu}%',
                    ),
                    Text(
                      '풍속 ${result.data.current.weather.ws}m/s',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)))
                .copyWith(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
            ),
            child: Icon(Icons.refresh, color: Colors.white, size: 30.0),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  String _getStatusString(AirResult result) {
    if (result.data.current.pollution.aqius <= 50) {
      return '좋음';
    } else if (result.data.current.pollution.aqius <= 100) {
      return '보통';
    } else if (result.data.current.pollution.aqius <= 150) {
      return '나쁨';
    }
    return '최악';
  }

  Color _getColor(AirResult result) {
    if (result.data.current.pollution.aqius <= 50) {
      return Colors.greenAccent;
    } else if (result.data.current.pollution.aqius <= 100) {
      return Colors.yellow;
    } else if (result.data.current.pollution.aqius <= 150) {
      return Colors.orange;
    } else {
      return Colors.redAccent;
    }
  }
}
