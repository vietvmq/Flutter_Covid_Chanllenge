import 'dart:convert';
import 'package:covid/components/constant.dart';
import 'package:covid/models/covid.dart';
import 'package:http/http.dart' as http;

class CovidRepo {
  final http.Client httpClient = http.Client();

  Future<CovidArea> getCovidStatistic() async {
    final response = await this.httpClient.get(BaseUrl.apiUrl);
    if (response.statusCode == 200) {
      final covids = json.decode(response.body)['data'];
      final CovidArea covidArea = CovidArea.fromJson(covids);
      print(covidArea.toString());
      return covidArea;
    } else {
      throw (Exception("Exception: getCovidStatistic"));
    }
  }
}
