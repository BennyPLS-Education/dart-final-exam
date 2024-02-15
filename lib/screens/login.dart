import 'package:examen_final_aguilo/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:examen_final_aguilo/providers/providers.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  const Login() : super(key: null);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isRememberMe = false;

  @override
  void initState() {
    super.initState();
    Preferences preferences = Provider.of<Preferences>(context, listen: false);
    if (preferences.user != null) {
      User user = preferences.user!;
      _emailController.text = user.email;
      _passwordController.text = user.password;
      _isRememberMe = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Preferences preferences = Provider.of<Preferences>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: _loginForm(),
    );
  }

  Widget _loginForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          const Text('Login'),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(hintText: 'Username'),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(hintText: 'Password'),
            obscureText: true,
          ),
          Row(
            children: [
              const Text('Remember me'),
              Checkbox(
                value: _isRememberMe,
                onChanged: (value) {
                  setState(() {
                    _isRememberMe = value!;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: _login,
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  void _login() {
    if (_emailController.text == 'admin' && _passwordController.text == 'admin') {
      if (_isRememberMe) {
        User user = User(email: _emailController.text, password: _passwordController.text);
        Provider.of<Preferences>(context, listen: false).setLogged(user);
      } else {
        Provider.of<Preferences>(context, listen: false).setLogged(null);
      }

      Navigator.pushReplacementNamed(context, 'home');
    } else {
      _onLoginError();
    }
  }

  void _onLoginError() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid username or password'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
