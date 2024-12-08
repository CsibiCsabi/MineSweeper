import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  Tile({required this.tap, required this.value, required this.increment, super.key});

  final void Function() increment;

  final String value;

  final void Function(String i) tap;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {

  void addScore(){
    if (tapped==false){
      widget.increment();
      tapped=true;
    }
  }

  bool tapped = false;

  bool flagged = false;

  Map<int,Color> colors = {
    0:Colors.cyan,
    1:const Color.fromARGB(255, 207, 128, 1),
    2:Colors.pink,
    3:const Color.fromARGB(255, 224, 55, 43),
    4:const Color.fromARGB(255, 126, 10, 10),
    5:const Color.fromARGB(255, 77, 4, 4),
    6:const Color.fromARGB(255, 97, 16, 10),
    7:const Color.fromARGB(255, 97, 16, 10),
    8:const Color.fromARGB(255, 97, 16, 10),
  };

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        shadowColor: WidgetStatePropertyAll(Colors.transparent),
      ),
      onPressed: (){
      setState(() {
        if (!flagged){
          addScore();
          widget.tap(widget.value);
        } else {
          flagged = false;
        }
      });
      },
      onLongPress: () {
        setState(() {
          flagged = true;
        });
      },
      child: tapped ? Text(widget.value, style: TextStyle(
        color: colors[int.parse(widget.value)],
      ),) : flagged ? Text("!", style: TextStyle(fontWeight: FontWeight.w900, color: const Color.fromARGB(255, 255, 17, 0), fontSize: 20)) : Text("?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
    );
  }
}