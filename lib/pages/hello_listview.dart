import 'package:flutter/material.dart';
import 'package:flutter_lecheta/utils/nav.dart';

import 'dog_page.dart';

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

  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: (){
            print("Lista");
            setState(() {
              _gridView = false;
            });
          },),
          IconButton(icon: Icon(Icons.grid_on), onPressed: (){
            print("Grid");
            setState(() {
              _gridView = true;
            });
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

    if(_gridView){
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: dogs.length,
          itemBuilder: (context, index) {
            return _itemView(dogs, index);
          });
    } else {
      return ListView.builder(
          itemExtent: 350,
          itemCount: dogs.length,
          itemBuilder: (context, index) {
            return _itemView(dogs, index);
          });
    }


  }

  Stack _itemView(List<Dog> dogs, int index) {
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
        GestureDetector(
          onTap: () {
            push(
                context, DogPage(dog
                ));
          },
        )
      ],
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
