import 'package:examen_final_aguilo/models/models.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier {
  final DatabaseReference _realtimeDatabase = FirebaseDatabase.instance.ref();
  Map<String, Tree>? trees;

  Future<void> getAll() async {
    trees = null;

    try {
      var data = await _realtimeDatabase.child('users').get();

      if (data.value == null) {
        trees = {};
      }

      trees = {};
      final userMap = castSnapshotData(data);
      for (var key in userMap.keys) {
        trees![key] = Tree.fromMap(userMap[key]!);
      }
    } catch (e) {
      trees = {};
    }

    notifyListeners();
  }

  Future<void> insert(Tree user) async {
    try {
      final newUser = await _realtimeDatabase.child('users').push();
      await newUser.set(user.toMap());
    } catch (e) {
      print('Error: $e');
    }

    getAll();
  }

  Future<void> update(String id, Tree user) async {
    try {
      await _realtimeDatabase.child('users/$id').update(user.toMap());
    } catch (e) {
      print('Error: $e');
    }

    getAll();
  }

  Future<void> delete(String id) async {
    try {
      await _realtimeDatabase.child('users/$id').remove();
    } catch (e) {
      print('Error: $e');
    }

    getAll();
  }

  Map<String, dynamic> castSnapshotData(DataSnapshot data) => _castMap(data.value as Map<dynamic, dynamic>);

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
