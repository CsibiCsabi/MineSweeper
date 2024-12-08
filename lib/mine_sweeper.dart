import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mine_sweeper/customs/tile.dart';

class MineSweeper extends StatefulWidget {
  const MineSweeper({required this.bombs, required this.mapSize, required this.lost, required this.increment, super.key});

final int bombs, mapSize;

  final void Function() increment;

  final void Function() lost;

  @override
  State<MineSweeper> createState() => _MineSweeperState();
}

class _MineSweeperState extends State<MineSweeper> {


  List<List<String>> map = [];

  void makeMap() {
    List<String> row;
    for (int i = 0; i < widget.mapSize; i++) {
      row = [];
      for (int i = 0; i < widget.mapSize; i++) {
        row.add("0");
      }
      map.add(row);
    }
    for (int i = 0; i < widget.bombs; i++) {
      int randRow, randCol;
      do {
        randRow = Random().nextInt(widget.mapSize);
        randCol = Random().nextInt(widget.mapSize);
      } while (map[randRow][randCol] == "1");
      map[randRow][randCol] = "1";
    }
  }



  @override
  void initState() {
    makeMap();
    super.initState();
  }

  getValue(int row, int column) {
    int count = 0;
    if (map[row][column] == '1') {
      return "X";
    } else {
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          if (row + i != -1 &&
              row + i != widget.mapSize &&
              column + j != -1 &&
              column + j != widget.mapSize) {
            if (map[row + i][column + j] == '1') {
              count++;
            }
          }
        }
      }
      return count.toString();
    }
  }

  var rowCounter = -1;

  void tileTap(String i){
    if (i=="X"){
      widget.lost();
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...map.map((i) {
          rowCounter++;
          if (rowCounter==widget.mapSize) {
            rowCounter=0;
          }
          List<Widget> row = [];
          for (int j = 0; j < widget.mapSize; j++) {
            row.add(
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(42, 0, 0, 0),
                  border: Border.all(color: Colors.black, width: 1)),
                width: 50,
                height: 50,
                child: Center(
                    child: Tile(
                      increment: widget.increment,
                      tap: tileTap, //something ain't right here, nevermind, I did it!!44!!4!!!4444!4!4
                      value: getValue(rowCounter, j)),
                    ),
              ),
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row,
          );
        })
      ],
    );
  }
}
