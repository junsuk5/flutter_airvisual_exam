class AirResult {
  String status;
  Data data;

  AirResult({this.status, this.data});

  AirResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String city;
  String state;
  String country;
  Location location;
  Current current;

  Data({this.city, this.state, this.country, this.location, this.current});

  Data.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    state = json['state'];
    country = json['country'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current.toJson();
    }
    return data;
  }
}

class Location {
  String type;
  List<double> coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Current {
  Weather weather;
  Pollution pollution;

  Current({this.weather, this.pollution});

  Current.fromJson(Map<String, dynamic> json) {
    weather =
        json['weather'] != null ? new Weather.fromJson(json['weather']) : null;
    pollution = json['pollution'] != null
        ? new Pollution.fromJson(json['pollution'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weather != null) {
      data['weather'] = this.weather.toJson();
    }
    if (this.pollution != null) {
      data['pollution'] = this.pollution.toJson();
    }
    return data;
  }
}

class Weather {
  String ts;
  int hu;
  String ic;
  int pr;
  int tp;
  int wd;
  double ws;
  String updatedAt;

  Weather(
      {this.ts,
      this.hu,
      this.ic,
      this.pr,
      this.tp,
      this.wd,
      this.ws,
      this.updatedAt});

  Weather.fromJson(Map<String, dynamic> json) {
    ts = json['ts'];
    hu = json['hu'];
    ic = json['ic'];
    pr = json['pr'];
    tp = json['tp'];
    wd = json['wd'];
    ws = json['ws'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ts'] = this.ts;
    data['hu'] = this.hu;
    data['ic'] = this.ic;
    data['pr'] = this.pr;
    data['tp'] = this.tp;
    data['wd'] = this.wd;
    data['ws'] = this.ws;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Pollution {
  String ts;
  int aqius;
  String mainus;
  int aqicn;
  String maincn;

  Pollution({this.ts, this.aqius, this.mainus, this.aqicn, this.maincn});

  Pollution.fromJson(Map<String, dynamic> json) {
    ts = json['ts'];
    aqius = json['aqius'];
    mainus = json['mainus'];
    aqicn = json['aqicn'];
    maincn = json['maincn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ts'] = this.ts;
    data['aqius'] = this.aqius;
    data['mainus'] = this.mainus;
    data['aqicn'] = this.aqicn;
    data['maincn'] = this.maincn;
    return data;
  }
}
