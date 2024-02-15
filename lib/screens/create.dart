import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/providers.dart';

// Create
class CreateTree extends StatefulWidget {
  static const routeName = '/create';

  const CreateTree({super.key});

  @override
  State<CreateTree> createState() => _CreateTreeState();
}

class _CreateTreeState extends State<CreateTree> {
  final _nameController = TextEditingController();
  final _varietatController = TextEditingController();
  final _tipusController = TextEditingController();
  final _fotoController = TextEditingController();
  final _detallController = TextEditingController();
  bool autocton = false;

  @override
  Widget build(BuildContext context) {
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
                createTree();
              },
              child: const Text('Create'),
            )
          ],
        ),
      ),
    );
  }

  void createTree() {
    final tree = Tree(
      nom: _nameController.text,
      varietat: _varietatController.text,
      tipus: _tipusController.text,
      foto: _fotoController.text,
      detall: _detallController.text,
      autocton: autocton,
    );

    Provider.of<FirebaseProvider>(context, listen: false).insert(tree);

    Navigator.of(context).pop();
  }
}
