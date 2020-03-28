import 'package:flutter/material.dart';
import 'package:covid19app/service/covid.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    Covid covid = data['covid'];

    return Scaffold(
      appBar: AppBar(
        title: Text(covid.country),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, '/countries');
                setState(() {
                  data = result;
                });
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: ListView.builder(
            itemCount: covid.cases.length,
            itemBuilder: (context, index) {
              return CaseCard(item: covid.cases[index]);
            }),
      ),
    );
  }
}

class CaseCard extends StatelessWidget {
  const CaseCard({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Case item;

  static final DateFormat DF = DateFormat('yyyy-MM-dd');
  static final DateFormat DF2 = DateFormat('EEE');

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          textTheme: TextTheme(
        body1: TextStyle(fontSize: 20),
      )),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    DF.format(item.date),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    DF2.format(item.date),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text('Confirmed')),
                  Text('${item.confirmed}'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text('Deaths')),
                  Text('${item.deaths}'),
                ],
              ),
              item.mortalityRate > 0
                  ? Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(child: Text('MortalityRate')),
                            Text(
                                '${(1000 * item.mortalityRate).toStringAsFixed(1)}\u2030'),
                          ],
                        ),
                      ],
                    )
                  : new Container(width: 0, height: 0)
            ],
          ),
        ),
      ),
    );
  }
}
