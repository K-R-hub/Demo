import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/user/user.dart';





class Model extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 1, name: 'KARIM', phone: '970591111111'),
    UserModel(id: 2, name: 'Mohammed', phone: '970592222222'),
    UserModel(id: 3, name: 'Farah', phone: '970593333333'),
    UserModel(id: 4, name: 'Adham', phone: '970594444444'),
    UserModel(id: 5, name: 'Hala', phone: '970595555555'),
    UserModel(id: 1, name: 'KARIM', phone: '970591111111'),
    UserModel(id: 2, name: 'Mohammed', phone: '970592222222'),
    UserModel(id: 3, name: 'Farah', phone: '970593333333'),
    UserModel(id: 4, name: 'Adham', phone: '970594444444'),
    UserModel(id: 5, name: 'Hala', phone: '970595555555'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
            itemBuilder: (context, index) => informationUsers(users[index]),
            separatorBuilder: (context, index) => Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
            itemCount: users.length));
  }

  Widget informationUsers(UserModel u) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  child: Text(
                    '${u.id}',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${u.name}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      '${u.phone}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Container()
                  ],
                )
              ],
            ),
          ],
        ),
      );
}
