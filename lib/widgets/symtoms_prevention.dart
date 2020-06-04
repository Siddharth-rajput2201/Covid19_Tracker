import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      //padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
        BoxShadow(
          offset: Offset(2, 5),
          blurRadius: 5,
          color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),

      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const PreventionCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      //padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 5),
            blurRadius: 5,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class symtoms_prevention extends StatefulWidget {
  @override
  _symtoms_preventionState createState() => _symtoms_preventionState();
}

// ignore: camel_case_types
class _symtoms_preventionState extends State<symtoms_prevention> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('SYMPTOMS',style: TextStyle(color: Colors.red[300],fontSize: 20 , fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 1,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SymptomCard(image: 'assets/images/Cough.png',title: 'Cough',),
              SymptomCard(image: 'assets/images/Breath.png',title: 'Difficulty in Breating',),
              SymptomCard(image: 'assets/images/Fever.png',title: 'Fever',),
              SymptomCard(image: 'assets/images/Tiredness.png',title: 'Tiredness',),
              SymptomCard(image: 'assets/images/headache.png',title: 'Headache',),
            ],
          ),
        ),




        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('PRECAUTIONS',style: TextStyle(color : Colors.blue[300],fontSize: 20 , fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 1,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PreventionCard(image: 'assets/images/facemask.png',title: 'Use mask',),
              PreventionCard(image: 'assets/images/SocialDistance.png',title: 'Maintian Social Distance',),
              PreventionCard(image: 'assets/images/Washing.png',title: 'Wash Hands Regularly',),
              PreventionCard(image: 'assets/images/stayhome.png',title: 'Stay Home Stay Safe',),
              PreventionCard(image: 'assets/images/sneeze.png',title: 'Cover Face While Sneezing',),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left : 20.0 , right: 20,top: 13),
          child: Divider(color: Colors.grey[400],thickness: 1,),
        ),
      ],
    );

  }
}