import 'package:examen_final_aguilo/models/tree.dart';
import 'package:examen_final_aguilo/providers/providers.dart';
import 'package:examen_final_aguilo/screens/create.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            icon: const Icon(Icons.refresh),
            onPressed: () {
              firebase.users = null;
              setState(() {});
              firebase.getAll();
            },
          )
        ],
      ),
      body: Center(
        child: firebase.users == null ? const Center(child: CircularProgressIndicator()) : _listView(firebase.users!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateUser.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _listView(Map<String, Tree> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final key = users.keys.elementAt(index);

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
              title: Text(users[key]?.nom ?? ""),
              subtitle: Text(users[key]?.varietat ?? ""),
            ),
          ),
        );
      },
    );
  }
}