import 'package:flutter/material.dart';
import '../main.dart';

class Jawaban extends StatelessWidget {
  AppState parrent;
  String jawaban;
  int index;
  int skor;
  Jawaban(this.jawaban, this.skor,this.parrent);

  
  @override 
  Widget build(BuildContext context)  {
   return Container(
     width: double.infinity,
     margin: EdgeInsets.all(10),
     child: 
     Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
       RaisedButton(
        color: Colors.yellow,
        child:Text(this.jawaban),
        onPressed: () => {
          
          if(this.parrent.index  <= this.parrent.pertanyaan.length -1 ) {
            this.parrent.setState(() {
              this.parrent.pertanyaan[this.parrent.index]['skor'] = this.skor;
              if(this.parrent.index == this.parrent.pertanyaan.length -1 ) {
                this.parrent.pertanyaan.forEach((f) => this.parrent.skor += f['skor']);
              }
              this.parrent.index +=1;
            })    
          } 
        },
      ),
     ],)
   );
 }
}