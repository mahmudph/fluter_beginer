import 'package:flutter/material.dart';
import 'package:appflutter/widgets/questions.dart';
import 'package:appflutter/widgets/TombolNav.dart';
import 'package:appflutter/widgets/jawaban.dart';
import 'package:appflutter/widgets/menu.dart';


void main () {
  runApp(App());
}

class App extends StatefulWidget {  
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  var index = 0;
  var skor = 0;
   var pertanyaan = [
     {
      'aks' : '4 * 10',
      'skor' : 0,
      'answer' : [
        {'text' : '10', 'score' : 0},
        {'text' : '40', 'score' : 35},
      ]

     },
     {
      'aks' : '4 * 6',
      'skor' : 0,
      'answer' : [
        {'text' : '24', 'score' : 35},
        {'text' : '9', 'score' : 0},
      ]
     },
      {
      'aks' : '4 * 5',
      'skor' : 0,
      'answer' : [
        {'text' : '20', 'score' : 30},
        {'text' : '18', 'score' : 0},
      ]
     }
    ]; 



    int _selectedIndex = 0;
    static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    static const List<Widget> _widgetOptions = <Widget>[
      Text(
        'Index 0: Home',
        style: optionStyle,
      ),
      Text(
        'Index 1: Business',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
      Text(
        'Index 3: Makan',
        style: optionStyle,
      ),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  void tambah() {
    if(this.index < this.pertanyaan.length - 1) {
      setState(() {
        // this.index = this.index + 1;
        this.index+= 1;
      });
    }
  }

  void kurang() {
    if(this.index > 0 ) {
      setState(() {
        this.index-= 1;
        this.pertanyaan[this.index]['skor'] = 0;

        // this.skor = this.pertanyaan[this.index]['skor'] - 50;
      });
    }
  }
  void next() {
    this.tambah();
  }

  Widget build(BuildContext context) {
    // var text = (this.index+1).toString() +  this.pertanyaan[this.index]['aks'];
    return MaterialApp(
      home : Scaffold(
        drawer: Menu(this),
        appBar: AppBar(
          title: Text('App'),
        ),
        
        body :
          this.index > pertanyaan.length -1 ? 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Center(child: Text(this.skor.toString(), style: TextStyle(fontSize: 48),)),
              RaisedButton(
                child:Text('Back'),
                color: Colors.blue, onPressed: () {
                  this.setState(() {
                    this.index = 0;
                    this.skor=0;
                  });
                }
              ),
          ]) :
          
         
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Center(child: Questions( (this.index+1).toString() + '. ' +  this.pertanyaan[this.index]['aks']),),
              ...(pertanyaan[this.index]['answer'] as List<Map>).map((jwb) {
                  return Jawaban(jwb['text'], jwb['score'],this);
              }).toList(),
            
              TombolNav(this.index, this.pertanyaan.length, this.kurang, this.tambah),
              // Text((this.pertanyaan.length - 1)  == this.index ? this.skor.toString() : '' ),
              
          ]),
          bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
            
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
        ),



      )
    );
  }
}