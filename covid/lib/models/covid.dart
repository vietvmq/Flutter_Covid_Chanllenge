class CovidArea {
  final Covid vietnam;
  final Covid global;

  CovidArea({this.vietnam, this.global});

  factory CovidArea.fromJson(Map<String, dynamic> json) {
    return CovidArea(
        global: Covid.fromJson(json['global']),
        vietnam: Covid.fromJson(json['vietnam']));
  }

  @override
  String toString() {
    return "vietnam: ${this.vietnam.toString()}, global: ${this.global.toString()}";
  }
}

class Covid {
  final String cases;
  final String deaths;
  final String recovered;

  Covid({this.cases, this.deaths, this.recovered});

  factory Covid.fromJson(Map<String, dynamic> json) {
    return Covid(
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
    );
  }

  @override
  String toString() {
    return "{cases: $cases, deaths: $deaths, recovered: $recovered}";
  }
}
