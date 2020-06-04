

import 'package:flutter/material.dart';

class Searchindiastates extends SearchDelegate {

  final Map countrystate;

  Searchindiastates(this.countrystate);



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear),onPressed: (){
        query='';
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: (){Navigator.pop(context);
    },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container() ;
  }

  @override
  Widget buildSuggestions(BuildContext context ) {
    final suggestionList= query.isEmpty?countrystate['states']:countrystate['states'].where(
            (element)=>element['state'].toString().toLowerCase().startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
            child: Padding(
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
                          Text(suggestionList[index]['state'],style: TextStyle(fontWeight: FontWeight.bold),),
                       //   Image.network(suggestionList[index]['countryInfo']['flag'],height: 50 ,width: 50,),
                        ],
                      ),
                    ),
                    Expanded(child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('CONFIRMED : '+suggestionList[index]['cases'].toString(),style: TextStyle(color: Colors.red),),
                          SizedBox(height: 5,),
                          Text('ACTIVE : '+suggestionList[index]['active'].toString(),style: TextStyle(color: Colors.blue),),
                          SizedBox(height: 5,),
                          Text('RECOVERED : '+suggestionList[index]['recovered'].toString(),style: TextStyle(color: Colors.green),),
                          SizedBox(height: 5,),
                          Text('DEATHS : '+suggestionList[index]['deaths'].toString(),style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    )
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}