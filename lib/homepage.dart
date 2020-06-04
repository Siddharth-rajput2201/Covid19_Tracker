import 'dart:convert';

import 'package:covid19app/pages/India_list.dart';
import 'package:covid19app/pages/othercountriespage.dart';
import 'package:covid19app/widgets/FadeAnimation.dart';
import 'package:covid19app/widgets/helpcard.dart';
import 'package:covid19app/widgets/india_panel.dart';
import 'package:covid19app/widgets/india_piechart.dart';
import 'package:covid19app/widgets/info_panel.dart';
import 'package:covid19app/widgets/mostaffected.dart';
import 'package:covid19app/widgets/piechart.dart';
import 'package:covid19app/widgets/symtoms_prevention.dart';
import 'package:covid19app/widgets/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Map worlddata;

  fetchworldwidedata()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worlddata = json.decode(response.body);
    });
  }


  Map indiadata;

  fetchindiadata()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries/India');
    setState(() {
      indiadata = json.decode(response.body);
    });
  }

  List countrydata;

  fetchcountrydata()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countrydata = json.decode(response.body);
    });
  }

  Future fetchrefreshdata() async{
    fetchcountrydata();
    fetchworldwidedata();
    fetchindiadata();
  }


  @override
  void initState() {
    fetchindiadata();
    fetchrefreshdata();
    fetchworldwidedata();
    fetchcountrydata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar:  PreferredSize(
        preferredSize: Size.fromHeight(60.0), child : AppBar(
      backgroundColor: Colors.white,
     title: FadeAnimation(0.5,Image.asset('assets/images/splashscreen.png', fit: BoxFit.fill,height: 45,width: 150,)),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
    ),
    ),
    body: RefreshIndicator(
      onRefresh: fetchrefreshdata,
      child: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        /*  Container(
            padding: EdgeInsets.all(10),
            height: 70,
            color: Colors.orange[100],
            child: Center(child: Text(Datasource.quote , style: TextStyle(color: Colors.orange[800],fontWeight: FontWeight.bold ,fontSize: 19),)),
             ), */

        FadeAnimation(0.25,symtoms_prevention(),),

          SizedBox(height: 20,),

          worlddata==null?FadeAnimation(0.75,Center(child : CircularProgressIndicator())):FadeAnimation(0.5,Padding(
            padding: const EdgeInsets.only(left : 15.0 , right: 15.0 , bottom: 15.0),
            child: Container(decoration : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color:Color.fromRGBO(204, 132, 67, .5) ,blurRadius: 15,
                )]),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical :10.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left : 10.0 ),
                        child: RichText(
                          text: TextSpan( /*defining default style is optional */
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'In', style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.bold,color: Colors.orange)),
                              TextSpan(
                                  text: 'd',
                                  style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.bold,color: Colors.grey.withOpacity(0.35))),
                              TextSpan(
                                  text: 'ia',
                                  style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.bold,color: Colors.green)),
                              TextSpan(
                                  text: ' Stats',
                                  style: TextStyle(fontSize: 28 ,fontWeight: FontWeight.bold,color: Colors.black87)),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right : 10.0 ,bottom: 5,),
                      child: RaisedButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Indiastatewise()));},
                        textColor: Colors.white,
                        color: Colors.blueGrey,
                        elevation: 5.0,
                        highlightElevation: 8.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                        child: Text(
                          'State Wise',
                          //style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),

                  ],
                ),
                IndiaPanel(indiadata: indiadata,),

                India_Piechart(indiadata: indiadata,)
              ],
              ),
            ),
          ),
      ),

          worlddata==null?FadeAnimation(0.1,Center(child : CircularProgressIndicator())):FadeAnimation(0.65,Padding(
            padding: const EdgeInsets.only(left : 15.0 , right: 15.0 , bottom: 15.0),
            child: Container(decoration : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color:Color.fromRGBO(204, 132, 67, .5) ,blurRadius: 15,
                )]),
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                    padding: const EdgeInsets.symmetric(vertical :10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left : 10.0 ),
                      child: Text('Total Cases',style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold),),
                    ),
                  ),

                    Padding(
                      padding: const EdgeInsets.only(right : 10.0 ,bottom: 5,),
                      child: RaisedButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Othercounrty()));},
                        textColor: Colors.white,
                        color: Colors.blueGrey,
                        elevation: 5.0,
                        highlightElevation: 8.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                        child: Text(
                          'Other Countries',
                          //style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),

                  ],
                  ),
                  WorldwidePanel(worlddata: worlddata,),

                  PiechartFunction(worlddata: worlddata,)
                ],
                ),
            ),
          ),
      ),

          countrydata==null?FadeAnimation(1.25,Center(child : CircularProgressIndicator())):FadeAnimation(0.80,Padding(
            padding: const EdgeInsets.only(left : 15.0 , right: 15.0 , bottom: 15.0),
            child: Container(decoration : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color:Color.fromRGBO(204, 132, 67, .5) ,blurRadius: 15,
                )]),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment : MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical :10.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left : 10.0 ),
                        child: Text('Most Affected',style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
                MostAffectedPanel(countrydata: countrydata,),
              ],
              ),
            ),
          ),
         ),

          FadeAnimation(1.5,Padding(
            padding: const EdgeInsets.only(left : 20.0 , right: 20,top: 5 , bottom: 5,),
            child: Divider(color: Colors.grey[400],thickness: 1,),
          ),
          ),

          FadeAnimation(1.75,Infopanel()),

          FadeAnimation(2,Helpercard()),

          /*countrydata==null?Center(child : CircularProgressIndicator()):Padding(
            padding: const EdgeInsets.only(left : 15.0 , right: 15.0 , bottom: 15.0),
            child: Container(decoration : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color:Color.fromRGBO(204, 132, 67, .5) ,blurRadius: 15,
                )]),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical :10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left : 10.0 ),
                    child: Text('Most Affected Countries',style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold),),
                  ),
                ),
                MostAffectedPanel(countrydata: countrydata,)
              ],
              ),
            ),
          ),
           */


        ],
      )
      ),
    ),
    );
  }
}
