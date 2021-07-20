import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/main.dart';

class KatKutButton extends StatefulWidget {
  @override
  _KatKutButtonState createState() => _KatKutButtonState();
}

class _KatKutButtonState extends State<KatKutButton> {
  String _katkut = "";

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: _katkut == ""
            ? Colors.grey
            : (_katkut == "X" ? Colors.green : Colors.red), // background
        onPrimary: Colors.white, // foreground
      ),
      onPressed: () => setState(() {
        if (_katkut != "") return;
        MyHomePage.isPlayerXturn = !MyHomePage.isPlayerXturn;
        if (MyHomePage.isPlayerXturn == true) {
          _katkut = 'X';
        } else {
          _katkut = 'O';
        }
      }),
      child: Text(
        _katkut,
        style: TextStyle(fontSize: 100),
      ),
    );
  }
}
