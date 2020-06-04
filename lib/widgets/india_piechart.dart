
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


// ignore: camel_case_types
class India_Piechart extends StatelessWidget {

  final Map indiadata;

  const India_Piechart({Key key, this.indiadata}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: PieChart(
        dataMap: {
          'Confirmed' : indiadata['cases'].toDouble(),
          'Active' : indiadata['active'].toDouble(),
          'Recovered' : indiadata['recovered'].toDouble(),
          'Death' : indiadata['deaths'].toDouble(),
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


