import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid19app/service/covid.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void _loadInitialData() async {
    Covid covid = Covid(country: 'Canada', name: 'canada', flag: 'CA');
    await covid.getData();
    bool success = covid.cases.length > 0;
    Navigator.pushReplacementNamed(context, '/home',
        arguments: {'covid': covid});
  }

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
        body: SpinKitSquareCircle(
          color: Colors.white,
          size: 80.0,
        ));
  }
}
