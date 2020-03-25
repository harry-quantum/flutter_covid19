import 'package:http/http.dart' as http;
import 'dart:convert';

class Covid {
  String country; // Display name
  String name; // name for REST api and flag
  List<Case> cases = [];

  Covid({this.country, this.name});

  Future<void> getData() async {
    http.Response confirmedRsp = await http
        .get('https://api.covid19api.com/total/country/$name/status/confirmed');
    http.Response deathsRsp = await http
        .get('https://api.covid19api.com/total/country/$name/status/deaths');

    List confirmedList = jsonDecode(confirmedRsp.body);
    List deathList = jsonDecode(deathsRsp.body);

    _updateCases(confirmedList, deathList);
  }

  void _updateCases(List confirmed, List deaths) {
    int length = confirmed.length;
    int length2 = deaths.length;
    if (length != length2) {
      print('Confirmed ($length) does NOT equal Deaths ($length2)!');
    }

    for (int i = 0; i < length; i++) {
      if (!(confirmed[i]['Date'] == deaths[i]['Date'])) {
        print('ConfirmedDate does NOT equal DeathsDate!');
      }

      DateTime date = DateTime.parse(confirmed[i]['Date']);
      cases.add(Case(
          date: date,
          confirmed: confirmed[i]['Cases'],
          deaths: deaths[i]['Cases']));

      cases.sort();
    }
  }
}

class Case implements Comparable {
  DateTime date;
  int confirmed;
  int deaths;

  Case({this.confirmed, this.date, this.deaths});

  @override
  int compareTo(other) {
    Case other2 = (other) as Case;
    return other2.date.compareTo((this.date));
  }
}
