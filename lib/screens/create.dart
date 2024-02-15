import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/providers.dart';

class CreateUser extends StatefulWidget {
  static const routeName = '/create';

  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _nameController = TextEditingController();
  final _varietatController = TextEditingController();
  final _tipusController = TextEditingController();
  final _fotoController = TextEditingController();
  final _detallController = TextEditingController();
  bool autocton = false;

  @override
  Widget build(BuildContext context) {
    final firebase = Provider.of<FirebaseProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _varietatController,
              decoration: const InputDecoration(labelText: 'Varietat'),
            ),
            TextField(
              controller: _tipusController,
              decoration: const InputDecoration(labelText: 'Tipus'),
            ),
            TextField(
              controller: _fotoController,
              decoration: const InputDecoration(labelText: 'Foto'),
            ),
            TextField(
              controller: _detallController,
              decoration: const InputDecoration(labelText: 'Detall'),
            ),
            Row(
              children: [
                const Text('Autocton'),
                Checkbox(
                  value: autocton,
                  onChanged: (value) {
                    setState(() {
                      autocton = value!;
                    });
                  },
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                createUser();
              },
              child: const Text('Create'),
            )
          ],
        ),
      ),
    );
  }

  void createUser() {
    final user = Tree();

    Provider.of<FirebaseProvider>(context, listen: false).insert(user);

    Navigator.of(context).pop();
  }
}
