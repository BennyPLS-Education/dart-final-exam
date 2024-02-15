import 'package:examen_final_aguilo/models/models.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// This is the firebase prover this stores information localy and have a CRUD
//
// This provider is to interact with the Firebase Realtime Database
class FirebaseProvider extends ChangeNotifier {
  final DatabaseReference _realtimeDatabase = FirebaseDatabase.instance.ref();
  Map<String, Tree>? trees;

  /// This method is to get all the tree from the database
  Future<void> getAll() async {
    trees = null;

    try {
      var data = await _realtimeDatabase.child('tree').get();

      if (data.value == null) {
        trees = {};
      }

      trees = {};
      final treeMap = castSnapshotData(data);
      for (var key in treeMap.keys) {
        trees![key] = Tree.fromMap(treeMap[key]!);
      }
    } catch (e) {
      trees = {};
    }

    notifyListeners();
  }

  /// This method is to insert a new tree to the database
  Future<void> insert(Tree tree) async {
    try {
      final newTree = await _realtimeDatabase.child('tree').push();
      await newTree.set(tree.toMap());
    } catch (e) {
      print('Error: $e');
    }

    getAll();
  }

  /// This method is to update a tree in the database
  Future<void> update(String id, Tree tree) async {
    try {
      await _realtimeDatabase.child('tree/$id').update(tree.toMap());
    } catch (e) {
      print('Error: $e');
    }

    getAll();
  }

  /// This method is to delete a tree from the database
  Future<void> delete(String id) async {
    try {
      await _realtimeDatabase.child('tree/$id').remove();
    } catch (e) {
      print('Error: $e');
    }

    getAll();
  }

  /// Convert a Datasnapshot to a Map String to convert by quicktype.io
  Map<String, dynamic> castSnapshotData(DataSnapshot data) => _castMap(data.value as Map<dynamic, dynamic>);

  /// Cast dynamicly all the maps recursively
  Map<String, dynamic> _castMap(Map<Object?, Object?> map) {
    final newMap = <String, dynamic>{};
    map.forEach((key, value) {
      if (value.runtimeType.toString() == '_Map<Object?, Object?>') {
        value = _castMap(value as Map);
      }

      newMap[key.toString()] = value;
    });

    return newMap;
  }
}
