import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';

class UserScreen extends StatelessWidget {
  final List<UserModel> users = [
    UserModel(1, 'Mohamed Esmail', '+201017920627'),
    UserModel(2, 'Mohamed Esmail', '+201017920627'),
    UserModel(3, 'Mohamed Esmsail', '+201017920627'),
    UserModel(4, 'Mohamed Esdmail', '+201017920627'),
    UserModel(5, 'Mohamed Esmabil', '+201017920627'),
    UserModel(6, 'Mohamed Esmail', '+201017920627'),
    UserModel(7, 'Mohamed Esjmail', '+201017920627'),
    UserModel(8, 'Mohamed Esmaiml', '+201017920627'),
    UserModel(9, 'Mohamed Esmail', '+201017920627'),
    UserModel(10, 'Mohamed Eosmail', '+201017920627'),
    UserModel(11, 'Mohamed Esmaik,l', '+201017920627'),
    UserModel(12, 'Mohamed Esmail', '+201017920627'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(start: 20.0),
                child: Divider(
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
          itemCount: users.length),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            const SizedBox(
              width: 25.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                Text(
                  user.phone,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.grey[300]),
                ),
              ],
            ),
          ],
        ),
      );
}


