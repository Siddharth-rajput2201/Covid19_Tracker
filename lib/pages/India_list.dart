import 'package:covid19app/pages/searchindiastates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Indiastatewise extends StatefulWidget {
  @override
  _IndiastatewiseState createState() => _IndiastatewiseState();
}

class _IndiastatewiseState extends State<Indiastatewise> {

  Map countrystatedata;

  fetchcountrystatedata()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/gov/india');
    setState(() {
      countrystatedata = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchcountrystatedata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){

            showSearch(context: context, delegate: Searchindiastates(countrystatedata),);

          },)
        ],
        title: Text("State Country Stats"),
      ),
      body :  countrystatedata==null?Center(child: CircularProgressIndicator(),): Scrollbar(child: ListView.builder(itemBuilder: (context,index)
      {
        return Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
              height: 120,
              decoration : BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color:Color.fromRGBO(204, 132, 67, .5) ,blurRadius: 15,
                  )]),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(countrystatedata['states'][index]['state'],style: TextStyle(fontWeight: FontWeight.bold),),
                       // Image.network(countrydata[index]['countryInfo']['flag'],height: 50 ,width: 50,),
                      ],
                    ),
                  ),

                  Expanded(child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('CONFIRMED : '+countrystatedata['states'][index]['cases'].toString(),style: TextStyle(color: Colors.red),),
                        SizedBox(height: 5,),
                        Text('ACTIVE : '+countrystatedata['states'][index]['active'].toString(),style: TextStyle(color: Colors.blue),),
                        SizedBox(height: 5,),
                        Text('RECOVERED : '+countrystatedata['states'][index]['recovered'].toString(),style: TextStyle(color: Colors.green),),
                        SizedBox(height: 5,),
                        Text('DEATHS : '+countrystatedata['states'][index]['deaths'].toString(),style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                  )
                  ),
                ],
              ),
            ),
          );

      },
        itemCount: countrystatedata==null?0:countrystatedata['states'].length,
      ),
      ),

    );
  }
}

