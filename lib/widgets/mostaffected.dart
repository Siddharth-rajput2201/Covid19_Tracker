import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MostAffectedPanel extends StatelessWidget {

  final List countrydata;

  const MostAffectedPanel({Key key, this.countrydata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true ,
        itemBuilder: (context,index)
      {
        return Container(
         child: Row(
           children: <Widget>[
             Image.network(countrydata[index]['countryInfo']['flag'],height: 50,width: 50,),
             Text(' '+countrydata[index]['country']),
             Text('  CASES : ' + countrydata[index]['cases'].toString() , style: TextStyle(color: Colors.red,fontSize: 13.25),),
             Text('  DEATHS : ' + countrydata[index]['deaths'].toString(), style: TextStyle(color: Colors.grey,fontSize: 13.25)),
           ],
         ),
        );
      },
      itemCount: 5,
      ),
    );
  }
}
