import 'package:flutter/material.dart';

class RedBotton extends StatelessWidget {

  String text;
  Function onPressed;


  RedBotton(this.text, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.red,
        child: Text(text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
        ),
        onPressed: onPressed
    );
  }
}
