import 'package:flutter/material.dart';
import 'package:mine_sweeper/mine_sweeper.dart';
import 'package:mine_sweeper/start_screen.dart';
import 'package:mine_sweeper/summary_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<int> mapSizeList = [4,5,6,7];

  List<int> bombsList = [1,2,3,4,5,6,7,8];

  int mapSizeCounter = 0;

  int bombsCounter = 0;

  int bombs = 3;

  int mapSize = 4;

  Widget? currentScreen;

  void changeSize() {
    setState(() {
      mapSizeCounter++;
      if (mapSizeCounter==mapSizeList.length){
        mapSizeCounter=0;
      }
      mapSize = mapSizeList[mapSizeCounter];
    });
  }

  void changeBombs() {
    setState(() {
      bombsCounter++;
      if (bombsCounter==bombsList.length){
        bombsCounter=0;
      }
      bombs = bombsList[bombsCounter];
    });
  }

void home(){
  setState(() {
    currentScreen = StartScreen(mapSizeList: mapSizeList, bombsList: bombsList, changeBombs: changeBombs, changeSize: changeSize, start: restart, bombsCounter: bombsCounter, mapSizeCounter: mapSizeCounter,);
  });
}

  void restart() {
    setState(() {
      score = 0;
      currentScreen = MineSweeper(lost: lost, increment: increment, mapSize: mapSize, bombs: bombs,);
    });
  }

  void lost(){
    setState(() {
      checkScore();
      currentScreen = SummaryScreen(restart: home, score: score, won: false, highscore: highscore,);
    });
  }

  @override
  void initState() {
    bombs=bombsList[bombsCounter];
    mapSize = mapSizeList[mapSizeCounter];
    currentScreen = StartScreen(mapSizeList: mapSizeList, bombsList: bombsList, changeBombs: changeBombs, changeSize: changeSize, start: restart, bombsCounter: bombsCounter, mapSizeCounter: mapSizeCounter,);
    super.initState();
  }

  int highscore = 0;

  void checkScore(){
    if (score > highscore){
      highscore = score;
    }
  }

  int score = 0;

  void increment(){
    setState(() {
      score++;
      if ((mapSize*mapSize)-bombs==score){
        checkScore();
        currentScreen = SummaryScreen(restart: home, score: score, won: true, highscore: highscore,);
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blueGrey, const Color.fromARGB(255, 118, 118, 118)])
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          currentScreen as Widget,
        ],
      ),
    );
  }
}