import 'package:flutter/material.dart';
import 'package:covid19app/pages/countries.dart';
import 'package:covid19app/pages/home.dart';
import 'package:covid19app/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/countries': (context) => Countries(),
      },
    ));
