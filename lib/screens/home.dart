import 'package:examen_final_aguilo/models/tree.dart';
import 'package:examen_final_aguilo/providers/providers.dart';
import 'package:examen_final_aguilo/screens/create.dart';
import 'package:examen_final_aguilo/screens/details.dart';
import 'package:examen_final_aguilo/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'geo_map.dart';

/// This is the main screen to get all the information and show it in a list.
///
/// This screen is to show all the trees in a list and have the option to create, update and delete a tree.
class Home extends StatefulWidget {
  static const routeName = '/';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    final firebase = Provider.of<FirebaseProvider>(context, listen: false);
    firebase.getAll();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseProvider firebase = Provider.of<FirebaseProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase CRUD'),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              Navigator.pushNamed(context, GeoMap.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Provider.of<Preferences>(context, listen: false).setLogged(null);
              Navigator.pushReplacementNamed(context, Login.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              firebase.trees = null;
              setState(() {});
              firebase.getAll();
            },
          )
        ],
      ),
      body: Center(
        child: firebase.trees == null ? const Center(child: CircularProgressIndicator()) : _listView(firebase.trees!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateTree.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _listView(Map<String, Tree> tree) {
    return ListView.builder(
      itemCount: tree.length,
      itemBuilder: (context, index) {
        final key = tree.keys.elementAt(index);

        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            Provider.of<FirebaseProvider>(context, listen: false).delete(key);
          },
          background: Container(
            color: Colors.red,
          ),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(tree[key]?.nom ?? ""),
              subtitle: Text(tree[key]?.varietat ?? ""),
              onTap: () {
                Navigator.pushNamed(context, Details.routeName, arguments: key);
              },
            ),
          ),
        );
      },
    );
  }
}
