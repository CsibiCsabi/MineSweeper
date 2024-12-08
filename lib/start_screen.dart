import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StartScreen extends StatefulWidget {
  StartScreen(
      {required this.mapSizeList,
      required this.mapSizeCounter,
      required this.bombsList,
      required this.bombsCounter,
      required this.changeBombs,
      required this.changeSize,
      required this.start,
      super.key});

  final void Function() changeBombs, changeSize, start;

  final List<int> mapSizeList, bombsList;

  int mapSizeCounter, bombsCounter;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int mapSizeCounter = 0;
  int bombsCounter = 0;

  List<int> mapSizeList = [];
  List<int> bombsList = [];
  @override
  void initState() {
    bombsCounter;
    mapSizeCounter = widget.mapSizeCounter;
    bombsCounter = widget.bombsCounter;
    mapSizeList = widget.mapSizeList;
    bombsList = widget.bombsList;
    super.initState();
  }

  void changeBombCounter() {
    widget.changeBombs();
    setState(() {
      bombsCounter++;
      if (bombsCounter == bombsList.length) {
        bombsCounter = 0;
      }
    });
  }

  void changeMapSizeCounter() {
    widget.changeSize();
    setState(() {
      mapSizeCounter++;
      if (mapSizeCounter == mapSizeList.length) {
        mapSizeCounter = 0;
      }
    });
  }

  TextStyle myText= const TextStyle(
    fontSize: 20,
    color: Color.fromARGB(255, 21, 19, 33),
    fontWeight: FontWeight.w500,
  );

  ButtonStyle myButton = const ButtonStyle(
      backgroundColor:
          WidgetStatePropertyAll(Color.fromARGB(255, 21, 19, 33)),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      textStyle: WidgetStatePropertyAll(
          TextStyle(fontWeight: FontWeight.w400, fontSize: 20)));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("This is a Mine Sweeper game!", style: myText,),
        ElevatedButton(
          style: myButton,
          onPressed: widget.start,
          child: const Text("Press to Start"),
        ),
        Text("Map Size: ${widget.mapSizeList[mapSizeCounter].toString()}", style: myText,),
        ElevatedButton(
            style: myButton,
            onPressed: changeMapSizeCounter,
            child: const Text("Change")),
        const SizedBox(
          height: 20,
        ),
        Text("Bombs: ${widget.bombsList[bombsCounter].toString()}", style: myText),
        ElevatedButton(
          style: myButton,
          onPressed: changeBombCounter,
          child: const Text("Change"),
        ),
      ],
    );
  }
}
