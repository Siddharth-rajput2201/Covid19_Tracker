
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


// ignore: camel_case_types
class Piechart_othercountriesFunction extends StatelessWidget {

  final List countrydata;

  const Piechart_othercountriesFunction({Key key, this.countrydata}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: PieChart(
        dataMap: {
         // 'Confirmed' : countrydata['cases'].toDouble(),
        //  'Active' : countrydata['active'].toDouble(),
        //  'Recovered' : countrydata['recovered'].toDouble(),
        //  'Death' : countrydata['deaths'].toDouble(),
        },
        animationDuration: Duration(milliseconds: 1000),
        chartType: ChartType.ring,
        colorList: [
          Colors.red[300],
          Colors.blue[400],
          Colors.green[400],
          Colors.grey[400]
        ],
      ),
    );
  }
}


