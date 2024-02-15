import 'package:examen_final_aguilo/models/models.dart';
import 'package:examen_final_aguilo/providers/providers.dart';
import 'package:examen_final_aguilo/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This is the login screen to get the user information and log in.
class Login extends StatefulWidget {
  static const routeName = '/login';

  const Login() : super(key: null);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Preferences preferences = Provider.of<Preferences>(context, listen: false);
    _passwordController.text = '';
    _emailController.text = '';
    if (preferences.user != null) {
      Navigator.pushReplacementNamed(context, Home.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
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
        children: [
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
          ElevatedButton(
            onPressed: _login,
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  void _login() {
    User user = User(email: _emailController.text, password: _passwordController.text);
    Provider.of<Preferences>(context, listen: false).setLogged(user);

    Navigator.pushReplacementNamed(context, Home.routeName);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
