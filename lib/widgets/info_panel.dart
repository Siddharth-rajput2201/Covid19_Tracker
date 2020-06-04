
import 'package:covid19app/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

class Infopanel extends StatelessWidget {

  void _openurlmyth() async
  {
    await launch("https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters");
  }

  void _openurldonate() async
  {
    await launch("https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters");
  }

  //to send mail mailto:smith@example.org?subject=News&body=New%20plugin
  //to make a call tel:12345678
  //to make an sms sms:<phone number>
  @override
  Widget build(BuildContext context) {
    return Container(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            OutlineButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Faqspage()));
              },
              child: Text("FAQs"),
              borderSide: BorderSide(color: Colors.blueGrey,width: 2),
              color: Colors.white,
              textColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),/*side: BorderSide(color: Colors.blueGrey)*/),
            ),

            OutlineButton(
              onPressed: _openurldonate,
              child: Text("Donate"),
              borderSide: BorderSide(color: Colors.blueGrey,width: 2),
              color: Colors.white,
              textColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),/*side: BorderSide(color: Colors.blueGrey)*/),
            ),

            OutlineButton(
              onPressed: _openurlmyth,
              child: Text("Myth Buster"),
              borderSide: BorderSide(color: Colors.blueGrey,width: 2),
              color: Colors.white,
              textColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),/*side: BorderSide(color: Colors.blueGrey)*/),
            ),

          ],
        ),
    );
  }
}
