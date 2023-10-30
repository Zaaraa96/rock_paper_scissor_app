import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'game/game_01.dart';
import 'my_game.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    const MaterialApp(
      home: HomeWidget(),
    ),
  );
}

class  HomeWidget extends StatelessWidget {
  const  HomeWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    // Fixed viewport size
     screenSize = Vector2(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

// Scaled viewport size
     worldSize = Vector2(MediaQuery.of(context).size.width/100, MediaQuery.of(context).size.height/100);
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
