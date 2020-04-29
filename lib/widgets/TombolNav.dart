import 'package:flutter/material.dart';


class TombolNav extends StatelessWidget {
  int index;
  int pertanyaanjumlah;
  final Function sebelumnya;
  final Function selanjutnya;


  TombolNav(this.index, this.pertanyaanjumlah, this.sebelumnya, this.selanjutnya);

  
  @override 
  Widget build(BuildContext context)  {
   return Container(
     width: double.infinity,
     margin: EdgeInsets.all(10),
     child: 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[
          Expanded(
          flex: 4, // takes 30% of available width 
          child: RaisedButton(
            // color: this.index == 0 ? Colors.red : Colors.yellow,
            child: Icon(Icons.arrow_back),
            onPressed:this.index == 0 ? null : () => this.sebelumnya()
          ),
        ),
          Expanded(
                  flex: 4, // takes 70% of available width  
                  child:
                  RaisedButton(
                    // color: Colors.yellow,
                    child:Icon(Icons.arrow_forward),
                    // onPressed: () => this.index == this.pertanyaan.length -1 ? null : this.tambah(),
                    onPressed: this.index == this.pertanyaanjumlah -1 ? null : () => this.selanjutnya()
                  ),
                ), 
        ],)
    );
 }
}