import 'package:flutter/material.dart';
import 'package:covid19app/service/covid.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    Covid covid = data['covid'];
    print('Get covid ${covid.country}');

    return Scaffold(
      appBar: AppBar(
        title: Text(covid.country),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
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

  @override
  Widget build(BuildContext context) {
    final DateFormat df = DateFormat('yyyy-MM-dd');

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(df.format(item.date)),
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
        ],
      ),
    );
  }
}
