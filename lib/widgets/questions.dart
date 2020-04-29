import 'package:flutter/material.dart';


class Questions extends StatelessWidget {
  String questions;

  Questions(@required this.questions);

  @override 
  Widget build(BuildContext context)  {
   return Container(
     width: double.infinity,
     margin: EdgeInsets.all(10),
     child: Text(
       this.questions,
       style: TextStyle(fontSize: 28),
       textAlign: TextAlign.center,
     ), 
   );
 }
}