import 'package:flutter/material.dart';
import 'package:flutter_lecheta/pages/hello_listview.dart';
import 'package:flutter_lecheta/pages/hello_page1.dart';
import 'package:flutter_lecheta/pages/hello_page2.dart';
import 'package:flutter_lecheta/pages/hello_page3.dart';
import 'package:flutter_lecheta/utils/nav.dart';
import 'package:flutter_lecheta/widgets/red_botton.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello Flutter",
        ),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(context)
          ],
        ));
  }

  Container _pageView() {
    return Container(
            height: 300,
            margin: EdgeInsets.all(20),
            child: PageView(
              children: <Widget>[
                _img("assets/images/dog1.png"),
                _img("assets/images/dog2.png"),
                _img("assets/images/dog3.png"),
                _img("assets/images/dog4.png"),
                _img("assets/images/dog5.png")
              ],
            ),
          );
  }

   _buttons(context) {
    return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RedBotton("List View", onPressed: () => _onClickNavigator(context, HelloListView())),
                  RedBotton("Page 2", onPressed: () => _onClickNavigator(context, HelloPage2())),
                  RedBotton("Page 3", onPressed: () => _onClickNavigator(context, HelloPage3())),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RedBotton("Snack", onPressed: _onClicSnack),
                  RedBotton("Dialog", onPressed: _onClickDialog),
                  RedBotton("Toast", onPressed: _onClickToast),
                ],
              )
            ],
          );
  }

  _onClicSnack() {
  }

  _onClickDialog() {
  }

  _onClickToast() {
  }

  void _onClickNavigator(BuildContext context, Widget page) async {

    String s = await push(context, page);

    print(">> $s");
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
      ),
    );
  }

  _img(String img) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Image.asset(img,
      fit: BoxFit.cover,
      ),
    );
  }

}