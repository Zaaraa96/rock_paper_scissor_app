import 'package:flutter/material.dart';

import 'game/game_01.dart';
import 'my_game.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MaterialApp(
      home: HomeWidget(),
    ),
  );
}

class  HomeWidget extends StatelessWidget {
  const  HomeWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return MyGameWidget(game: Game01());
          }));
        }, child: Text('start game')),
      ),
    );
  }
}
