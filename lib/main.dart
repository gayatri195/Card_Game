import 'dart:math';

import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CardGame()
  ));
}

class CardGame extends StatefulWidget {

  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  int blackCardNumber = 0;

  int redCardNumber = 0;

  int cardFlip(){
    return Random().nextInt(13)+1;
  }

  String gameStatus(){
    if(blackCardNumber>redCardNumber){
      return"Black Wins!";
    }
    else if(redCardNumber>blackCardNumber){
      return "Red Wins!";
    }
    else{
      return "Draw!!";
    }
  }

  void restart(){
    setState(() {
       blackCardNumber = 0;

       redCardNumber = 0;
    });
  }

  bool checkWnCondition(){
    if(blackCardNumber!=0 && redCardNumber!=0){
      return true;
    }
    else{
      return false;

    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
          'Card Game'),
        ),
        ),
        body: Column(
          children: [
          SizedBox(
            height: 20,),
            Row(
              children: [
               Expanded(
                 child: TextButton(
                   onPressed: () {
                     

                     setState(() {
                       blackCardNumber = cardFlip();
                     });

                   },
                   child: Image(
                          image: AssetImage('assets/black$blackCardNumber.png'),
                          ),
                 ),
               ),
                  
                    Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        redCardNumber = cardFlip();
                      });
                       

                    },
                    child: Image(
                      image: AssetImage('assets/red$redCardNumber.png'),
                      ),
                  )),
              ],
            ),
        ],
        ),
        bottomSheet: Visibility(
          visible: checkWnCondition(),
          child: Container(
            color: Colors.amber,
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Text(gameStatus(),
              style: TextStyle(
                color: Colors.black, fontSize: 44.0, fontWeight: FontWeight.bold),
                ),
                TextButton(child: Text('Re-Start', style: TextStyle(
                  fontSize: 40.0, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  restart();
                },
                )
            ],),
            ),
        ),
    );
  }
}



