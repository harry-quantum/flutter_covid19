import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid19app/service/covid.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void _loadInitialData() async {
    Covid covid = Covid(country: 'Canada', name: 'canada');
    await covid.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'covid': covid,
    });
  }

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Text('Loading'),
//      child: SpinKitSquareCircle(
//        color: Colors.white,
//        size: 50.0,
//      ),
    ));
  }
}
