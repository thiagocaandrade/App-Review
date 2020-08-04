import 'package:flutter/material.dart';
import 'package:flutter_lecheta/widgets/red_botton.dart';



class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: _body(context),
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
    Navigator.pop(context, "Tela 2");
  }
}
