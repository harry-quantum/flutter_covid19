import 'package:flutter/material.dart';
import 'package:covid19app/service/covid.dart';

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  final List<Covid> countries = [
    Covid(country: 'China', name: 'china', flag: 'CN'),
    Covid(country: 'Canada', name: 'canada', flag: 'CA'),
    Covid(country: 'United States', name: 'us', flag: 'US'),
    Covid(country: 'Italy', name: 'italy', flag: 'IT'),
    Covid(country: 'Spain', name: 'spain', flag: 'ES'),
    Covid(country: 'France', name: 'france', flag: 'FR'),
    Covid(country: 'Germany', name: 'germany', flag: 'DE'),
    Covid(country: 'Portugal', name: 'portugal', flag: 'PT'),
    Covid(country: 'United Kingdom', name: 'united-kingdom', flag: 'GB'),
    Covid(country: 'Ireland', name: 'ireland', flag: 'IE'),
    Covid(country: 'Norway', name: 'norway', flag: 'NO'),
    Covid(country: 'Denmark', name: 'denmark', flag: 'DK'),
    Covid(country: 'Sweden', name: 'sweden', flag: 'SE'),
    Covid(country: 'Finland', name: 'finland', flag: 'FI'),
    Covid(country: 'Russia', name: 'russia', flag: 'RU'),
    Covid(country: 'Austria', name: 'austria', flag: 'AT'),
    Covid(country: 'Switzerland', name: 'switzerland', flag: 'CH'),
    Covid(country: 'Serbia', name: 'serbia', flag: 'RS'),
    Covid(country: 'Greece', name: 'greece', flag: 'GR'),
    Covid(country: 'Japan', name: 'japan', flag: 'JP'),
    Covid(country: 'South Korea', name: 'korea-south', flag: 'KR'),
    Covid(country: 'Singapore', name: 'singapore', flag: 'SG'),
    Covid(country: 'India', name: 'india', flag: 'IN'),
    Covid(country: 'Pakistan', name: 'pakistan', flag: 'PK'),
    Covid(country: 'Iran', name: 'iran', flag: 'IR'),
    Covid(country: 'Iraq', name: 'iraq', flag: 'IQ'),
    Covid(country: 'Israel', name: 'israel', flag: 'IL'),
    Covid(country: 'Turkey', name: 'turkey', flag: 'TR'),
    Covid(country: 'Saudi Arabia', name: 'saudi-arabia', flag: 'SA'),
    Covid(country: 'Egypt', name: 'egypt', flag: 'EG'),
    Covid(country: 'Ethiopia', name: 'ethiopia', flag: 'ET'),
    Covid(country: 'Kenya', name: 'kenya', flag: 'KE'),
    Covid(country: 'South Africa', name: 'south-africa', flag: 'ZA'),
    Covid(country: 'Australia', name: 'australia', flag: 'AU'),
    Covid(country: 'New Zealand', name: 'new-zealand', flag: 'NZ'),
    Covid(country: 'Mexico', name: 'mexico', flag: 'MX'),
    Covid(country: 'Brazil', name: 'brazil', flag: 'BR'),
    Covid(country: 'Argentina', name: 'argentina', flag: 'AR'),
    Covid(country: 'Peru', name: 'peru', flag: 'PE'),
    Covid(country: 'Chile', name: 'chile', flag: 'CL'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, i) {
            Covid item = countries[i];
            String name = item.country;
            return CountryCard(covid: item);
          }),
    );
  }
}

class CountryCard extends StatelessWidget {
  const CountryCard({
    Key key,
    @required this.covid,
  }) : super(key: key);

  final Covid covid;

  void _getData(BuildContext context, Covid covid) async {
    await covid.getData();
    Navigator.pop(context, {'covid': covid});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      child: Card(
        child: ListTile(
          onTap: () {
            _getData(context, covid);
          },
          title: Text(covid.country),
          trailing: Image(image: AssetImage('assets/${covid.flag}.png')),
        ),
      ),
    );
  }
}
