import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpercard extends StatelessWidget {


  void _opentocall() async
  {
    await launch("tel:011-22307145");
  }

  //to send mail mailto:smith@example.org?subject=News&body=New%20plugin
  //to make a call tel:12345678
  //to make an sms sms:<phone number>


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: (){
          _opentocall();
        },
        child: Container(
          height: 150,
          width: double.infinity,
          child: Stack(
            //alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  // left side padding is 40% of total width
                  left: MediaQuery.of(context).size.width * .4,
                  top: 20,
                  right: 20,
                ),
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF60BE93),
                      Color(0xFF1B8D59),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Dial 011-22307145 for \nMedical Help!\n",
                        style: TextStyle(color:Colors.white,fontSize: 20),
                      ),
                      TextSpan(
                        text: "If any symptoms appear",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      TextSpan(
                        text: "\n*Tap to call Automatically",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10 , bottom: 13),
                child: Image.asset("assets/images/doctor1.png"),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: SvgPicture.asset("assets/images/virus.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }

