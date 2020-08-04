import 'package:flutter/material.dart';
import 'package:flutter_lecheta/widgets/red_botton.dart';



class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
      ),
    );
  }

  _body(context) {
    return Center(
      child: RedBotton(
        "Voltar",
        onPressed: () => _onClickVoltar(context),
      ),
    );
  }

  _onClickVoltar(context) {
    Navigator.pop(context, "Tela 3");
  }
}
