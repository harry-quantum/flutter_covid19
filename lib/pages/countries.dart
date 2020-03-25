import 'package:flutter/material.dart';
import 'package:covid19app/service/covid.dart';

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  final List<Covid> countries = [
    Covid(country: 'China', name: 'china'),
  Covid(country: 'Japn', name: 'japan'),
  Covid(country: 'Korea, South', name: 'korea-south'),
  Covid(country: 'Russia', name: 'russia'),
  Covid(country: 'Singapore', name: 'singapore'),
  Covid(country: 'India', name: 'india'),
  Covid(country: 'Pakistan', name: 'pakistan'),
  Covid(country: 'Iran', name: 'iran'),
  Covid(country: 'Iraq', name: 'iraq'),
  Covid(country: 'Israel', name: 'israel'),
  Covid(country: 'Turkey', name: 'turkey'),
  Covid(country: 'Saudi Arabia', name: 'saudi-arabia'),
  Covid(country: 'Egypt', name: 'egypt'),
  Covid(country: 'Ethiopia', name: 'ethiopia'),
  Covid(country: 'Kenya', name: 'kenya'),
  Covid(country: 'South Africa', name: 'south-africa'),
  Covid(country: 'Greece', name: 'greece'),
  Covid(country: 'Italy', name: 'italy'),
  Covid(country: 'Serbia', name: 'serbia'),
  Covid(country: 'Austria', name: 'austria'),
  Covid(country: 'Switzerland', name: 'switzerland'),
  Covid(country: 'France', name: 'france'),
  Covid(country: 'Germany', name: 'germany'),
  Covid(country: 'Spain', name: 'spain'),
  Covid(country: 'Portugal', name: 'portugal'),
  Covid(country: 'United Kingdom', name: 'united-kingdom'),
  Covid(country: 'Ireland', name: 'ireland'),
  Covid(country: 'Norway', name: 'norway'),
  Covid(country: 'Denmark', name: 'denmark'),
  Covid(country: 'Sweden', name: 'sweden'),
  Covid(country: 'Finland', name: 'finland'),
  Covid(country: 'Australia', name: 'australia'),
  Covid(country: 'New Zealand', name: 'new-zealand'),
  Covid(country: 'Canada', name: 'canada'),
  Covid(country: 'United States', name: 'us'),
  Covid(country: 'Mexico', name: 'mexico'),
  Covid(country: 'Brazil', name: 'brazil'),
  Covid(country: 'Argentina', name: 'argentina'),
  Covid(country: 'Peru', name: 'peru'),
  Covid(country: 'Chile', name: 'chile'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Countries'),
    );
  }
}
