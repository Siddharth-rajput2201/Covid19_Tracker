import 'dart:ui';
import 'package:covid19app/widgets/linereportchart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class IndiaPanel extends StatelessWidget {

  final Map indiadata;

  const IndiaPanel({Key key, this.indiadata}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
        children: <Widget>[

          StatusPanel(
            title: 'CONFIRMED',
            panelcolor: Colors.red[100],
            textColor: Colors.red,
            count: indiadata['cases'].toString(),
            linear: LineReportChart(threadcolor: Colors.red,),
            blurcolor: Colors.red[200],
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelcolor: Colors.blue[100],
            textColor: Colors.blue,
            count: indiadata['active'].toString(),
            linear: LineReportChart(threadcolor: Colors.blue,),
            blurcolor: Colors.blue[300],
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelcolor: Colors.green[100],
            textColor: Colors.green,
            count:  indiadata['recovered'].toString(),
            linear: LineReportChart(threadcolor: Colors.green,),
            blurcolor: Colors.green[300],
          ),

          StatusPanel(
            title: 'DEATHS',
            panelcolor: Colors.grey[300],
            textColor: Colors.grey[900],
            count: indiadata['deaths'].toString(),
            linear: LineReportChart(threadcolor: Colors.grey,),
            blurcolor: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelcolor;
  final Color textColor;
  final String title;
  final String count;
  final Widget linear;
  final Color blurcolor;
  const StatusPanel({Key key, this.panelcolor, this.textColor, this.title, this.count ,this.linear , this.blurcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(color : panelcolor , borderRadius: BorderRadius.circular(10) , boxShadow: [BoxShadow(color: blurcolor,blurRadius: 8.0)]),
      margin: EdgeInsets.all(10),
      //color: panelcolor,
      height: 80 , width: width/2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16,color: textColor),),
          Text(count,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16,color: textColor),),
          Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.end , children: <Widget>[linear],))
        ],
      ),
    );
  }

}
