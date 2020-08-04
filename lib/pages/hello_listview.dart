import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: (){
            print("Lista");
          },),
          IconButton(icon: Icon(Icons.grid_on), onPressed: (){
            print("Grid");
          }),
        ]
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rottweiler", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png"),
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          Dog dog = dogs[index];

          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _img(dog.foto),
              Container(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text(
                    dog.nome,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        });
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
