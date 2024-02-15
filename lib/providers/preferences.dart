import 'package:examen_final_aguilo/models/models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends ChangeNotifier {
  User? _user;

  Preferences() {
    _getLogged().then((user) {
      _user = user;
      notifyListeners();
    });
  }

  User? get user => _user;

  void setLogged(User? user) {
    _setLogged(user).then((_) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> _setLogged(User? user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (user == null) {
      await prefs.setBool('isLogged', false);
      await prefs.setString('email', '');
      await prefs.setString('password', '');
      print('User not remembered.');
      return;
    }

    await prefs.setBool('isLogged', true);
    await prefs.setString('email', user.email);
    await prefs.setString('password', user.password);
    print('User remembered: ${user.email}');
  }

  Future<User?> _getLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isLogged') == true) {
      return User(
        email: prefs.getString('email')!,
        password: prefs.getString('password')!,
      );
    } else {
      return null;
    }
  }
}
