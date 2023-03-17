import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
            Icons.menu
        ),
        title: Text(
          'karim4444444444444444444444444444444',
        ),
        actions: [
      IconButton(
      icon: Icon(
      Icons.ac_unit_sharp,
      ),
      onPressed: () {
        print('نستغفر الله العظيم');
      },
    ),
    IconButton(
    onPressed:(){},
    icon: Text(
    'hello',
    ),
    ),

    ],

    ),
    body:Column(
    children: [
    Padding(
    padding: const EdgeInsets.all(30.0),

    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadiusDirectional.only(
    topEnd: Radius.circular(20)
    ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Stack(
    alignment:Alignment.bottomCenter ,
    children: [
    Container(

    child: Image(

    image: NetworkImage(
    'https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg',
    ),
    height: 200,
    width: 200,
    fit: BoxFit.cover,
    ),
    ),
    Container(
    width: 200,
    color: Colors.pink.withOpacity(.5),
    child: Text(
    'flower ',
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 30,
    color: Colors.greenAccent,

    ),
    ),
    ),
    ],
    ),
    ),
    )
    ]
    ,
    )
    ,

    );
  }

}