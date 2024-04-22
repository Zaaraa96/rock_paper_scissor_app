
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

class  HomeWidget extends StatefulWidget {
  const  HomeWidget ({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  @override
  void initState() {
    super.initState();
  }

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
