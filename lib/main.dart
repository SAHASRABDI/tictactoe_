//Belo is the documentation link of flutter in vs code
//https://flutter.dev/docs/development/tools/vs-code

import 'package:flutter/material.dart';
//import 'package:tic_tac_toe_app/katkutButton.dart';
//import 'package:tic_tac_toe_app/katkutButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  static bool isPlayerXturn = false;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _katkut = ["", "", "", "", "", "", "", "", ""];
  bool _Xwins = false;
  bool _Owins = false;
  String declare() {
    int _countX = 0;
    int _countO = 0;
    for (var i = 0; i < _katkut.length; i++) {
      if (_katkut[i] == "X") {
        _countX++;
      }
      if (_katkut[i] == "O") {
        _countO++;
      }
    }
    return _countO.toString() + " " + _countX.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.shortestSide * 0.8,
                width: MediaQuery.of(context).size.shortestSide * 0.8,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, index) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: _katkut[index] == ""
                              ? Colors.grey
                              : (_katkut[index] == "O"
                                  ? Colors.green
                                  : Colors.red), // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () => setState(() {
                          if (_katkut[index] != "") return;
                          if (_Xwins == true || _Owins == true) return;
                          MyHomePage.isPlayerXturn = !MyHomePage.isPlayerXturn;
                          if (MyHomePage.isPlayerXturn == true) {
                            _katkut[index] = 'X';
                          } else {
                            _katkut[index] = 'O';
                          }
                        }),
                        child: Text(
                          _katkut[index],
                          style: TextStyle(fontSize: 100),
                        ),
                      );
                    }),
              ),
              Text(declare()),
            ],
          ),
        ),
      ),
    );
  } //widget
}
