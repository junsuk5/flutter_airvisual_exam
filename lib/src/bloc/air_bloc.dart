import 'package:flutter_airvisual/src/models/models.dart';
import 'package:flutter_airvisual/src/resources/air_api_provider.dart';
import 'package:rxdart/rxdart.dart';

class AirBloc {
  final _repository = AirApiProvider();
  final _airSubject = BehaviorSubject<AirResult>();

  AirBloc() {
    fetch();
  }

  void fetch() async {
    var airResult = await _repository.fetchAirResult();
    _airSubject.add(airResult);
  }

  Stream<AirResult> get airResult => _airSubject.stream;
}
