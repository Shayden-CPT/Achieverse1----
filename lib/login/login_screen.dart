import 'package:flutter/material.dart';
import 'package:achieverse/home_page.dart';
import 'package:achieverse/responsive_layout.dart';
import 'package:achieverse/widgets/nav_bar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isSignIn = true;

  void _toggleView() {
    setState(() {
      _isSignIn = !_isSignIn;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Email: $_email');
      print('Password: $_password');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful for demo')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // Responsive Background Image
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/achieverse2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                // Login Form
                Center(
                  child: Container(
                    // EDIT: Adjust the width of the login box here
                    width: constraints.maxWidth > 600 ? 400 : double.infinity,
                    // EDIT: Adjust the padding of the login box here
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth > 600 ? 32.0 : 20.0,
                      vertical: constraints.maxWidth > 600 ? 32.0 : 20.0,
                    ),
                    // EDIT: Customize the login box design here
                    decoration: BoxDecoration(
                      // EDIT: Change the background color of the login box
                      color: Colors.white,
                      // EDIT: Adjust the border radius of the login box
                      borderRadius: BorderRadius.circular(20),
                      // EDIT: Customize the box shadow
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: _buildForm(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => setState(() => _isSignIn = true),
                  // EDIT: Customize the Sign In button style
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isSignIn ? Colors.green : Colors.grey[300],
                    foregroundColor: _isSignIn ? Colors.white : Colors.black,
                  ),
                  child: const Text('Sign In'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => setState(() => _isSignIn = false),
                  // EDIT: Customize the Sign Up button style
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        !_isSignIn ? Colors.green : Colors.grey[300],
                    foregroundColor: !_isSignIn ? Colors.white : Colors.black,
                  ),
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (!_isSignIn)
            TextFormField(
              // EDIT: Customize the Username field style
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
          if (!_isSignIn) const SizedBox(height: 10),
          TextFormField(
            // EDIT: Customize the Email field style
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              return null;
            },
            onSaved: (value) => _email = value ?? '',
          ),
          const SizedBox(height: 10),
          TextFormField(
            // EDIT: Customize the Password field style
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
            onSaved: (value) => _password = value ?? '',
          ),
          if (!_isSignIn) const SizedBox(height: 10),
          if (!_isSignIn)
            TextFormField(
              // EDIT: Customize the Confirm Password field style
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
          const SizedBox(height: 10),
          if (_isSignIn)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                // EDIT: Customize the Forgot Password button style
                child: const Text('Forgot Password?'),
                onPressed: () {
                  // Handle forgot password
                },
              ),
            ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _submitForm,
            // EDIT: Customize the main action button style
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 28, 95, 240),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: Text(_isSignIn ? 'Sign In' : 'Sign Up'),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                // EDIT: Customize the Facebook icon button
                icon: const Icon(Icons.facebook),
                onPressed: () {
                  // Handle Facebook sign in
                },
              ),
              IconButton(
                // EDIT: Customize the Google icon button
                icon: const Icon(Icons.g_mobiledata),
                onPressed: () {
                  // Handle Google sign in
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}