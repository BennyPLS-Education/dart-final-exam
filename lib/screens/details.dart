import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class Details extends StatelessWidget {
  static const routeName = '/details';

  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final keyArgument = ModalRoute.of(context)?.settings.arguments as String?;

    if (keyArgument == null) {
      Navigator.pop(context);
    }

    final tree = Provider.of<FirebaseProvider>(context, listen: false).users?[keyArgument];

    if (tree == null) {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        // profile photo
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(tree?.foto ?? 'https://via.placeholder.com/150'),
          )
        ],
      ),
      body: Center(
          child: ListView(
        children: [
          ListTile(
            title: Text('Nom: ${tree?.nom ?? 'No name'}'),
          ),
          ListTile(
            title: Text('Varietat: ${tree?.varietat ?? "No varietat"}'),
          ),
          ListTile(
            title: Text('Tipus: ${tree?.tipus ?? "No Tipus"}'),
          ),
          ListTile(
            title: CheckboxListTile(
              title: const Text('Autocton'),
              value: tree?.autocton ?? false,
              enabled: false,
              onChanged: (bool? value) {},
            ),
          ),
          ListTile(
            title: Text('Detall: ${tree?.detall ?? "No Detall"}'),
          ),
        ],
      )),
    );
  }
}
