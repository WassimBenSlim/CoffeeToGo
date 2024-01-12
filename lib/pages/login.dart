import 'package:flutter/material.dart';
import 'package:coffetogo/database/databasehelper.dart';
import 'home_page.dart'; // Replace with the actual home page import
import 'register.dart'; // Import the RegisterPage

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signInLocally() async {
    try {
      List<Map<String, dynamic>> users = await _dbHelper.getUsers();
      // Implement logic to check user credentials locally
      // For simplicity, checking if user exists in the local database
      bool userExists = users.any((user) =>
          user['email'] == _emailController.text &&
          user['password'] == _passwordController.text);

      if (userExists) {
        print('Successfully logged in locally');
        // Navigate to the home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage()), // Replace with your home page
        );
      } else {
        print('Invalid credentials');
      }
    } catch (e) {
      print('Error signing in locally: $e');
    }
  }

  void _navigateToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _signInLocally,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: _navigateToRegisterPage,
              child: Text(
                'No account? Create one',
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.black),
              ),
            ),
            // ... Other UI components ...
          ],
        ),
      ),
    );
  }
}
