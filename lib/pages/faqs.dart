import 'package:covid19app/datasource.dart';
import 'package:flutter/material.dart';

class Faqspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
              color: Colors.white70
          ),
          backgroundColor: Colors.blueGrey,title: Text('FAQs',style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
        itemCount: Datasource.questionAnswers.length,
          itemBuilder: (context,index)
      {
        return ExpansionTile(title: Text(Datasource.questionAnswers[index]['question'] , style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),
        ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(Datasource.questionAnswers[index]['answer']),
              )
          ],
        );
      }
      ),
    );
  }
}
