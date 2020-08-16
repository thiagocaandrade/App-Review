import 'package:flutter/material.dart';
import 'package:flutter_lecheta/pages/hello_listview.dart';
import 'package:flutter_lecheta/pages/hello_page2.dart';
import 'package:flutter_lecheta/pages/hello_page3.dart';
import 'package:flutter_lecheta/utils/nav.dart';
import 'package:flutter_lecheta/widgets/red_botton.dart';
import 'package:fluttertoast/fluttertoast.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dogs",
        ),
        centerTitle: true,
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
          onPressed: () {
        _onClickFab();
      }),
    );
  }

  _onClickFab(){


  }

  _body(context) {
    return Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_text(), _pageView(), _buttons()],
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

  _buttons() {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RedBotton("List View",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                RedBotton("Page 2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                RedBotton("Page 3",
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RedBotton("Snack", onPressed: () => _onClicSnack(context)),
                RedBotton("Dialog", onPressed:() => _onClickDialog(context)),
                RedBotton("Toast", onPressed: _onClickToast),
              ],
            )
          ],
        );
      },
    );
  }

  _onClicSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Fala Thiago"),
      action: SnackBarAction(
          textColor: Colors.white,
          label: "OK", onPressed: () {
        print("OK");
        }),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(context: context,barrierDismissible: false, builder: (context)
    {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
        title: Text("Alerta Thiago"),
        actions: <Widget>[
          FlatButton(
            child: Text("Cancelar"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
              print("OK!!!!");
          },
          )
        ],
      ),
      );
    });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Esse é um Toast Thiago",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);

    print(">> $s");
  }

  _text() {
    return Text(
      "Dogs",
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
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}
