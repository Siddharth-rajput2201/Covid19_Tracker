
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class PiechartFunction extends StatelessWidget {

  final Map worlddata;

  const PiechartFunction({Key key, this.worlddata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: PieChart(
          dataMap: {
             'Confirmed' : worlddata['cases'].toDouble(),
            'Active' : worlddata['active'].toDouble(),
            'Recovered' : worlddata['recovered'].toDouble(),
            'Death' : worlddata['deaths'].toDouble(),
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


