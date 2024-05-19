import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'user.dart';
import 'display_page.dart';

class HomePage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                int age = int.tryParse(_ageController.text) ?? 0; // Handle parsing error

                User user = User(name: name, age: age);
                var box = Hive.box('userBox');
                box.put('user', user);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DisplayPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16), // Adjust button height
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
