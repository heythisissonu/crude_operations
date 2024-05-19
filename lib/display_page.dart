import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'user.dart';

class DisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('userBox');
    User? user = box.get('user');

    return Scaffold(
      appBar: AppBar(
        title: Text('Display Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: user == null
              ? Text(
                  'No user data',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )
              : SizedBox( // Wrapping Column with SizedBox to make it wider
                  width: 300, // Setting a specific width, adjust as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserInfoCard(user: user),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final User user;

  const UserInfoCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              user.name,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Age:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              user.age.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
