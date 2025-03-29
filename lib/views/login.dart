import 'package:flutter/material.dart';
// import the homepage from home.dart
import 'home.dart';

// Create LoginPage class - stateful widget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

// Create LoginPageState class - state
class _LoginPageState extends State<LoginPage> {  // Creating variables
  final _formKey = GlobalKey<FormState>(); // Form key is used for form validation, it is a unique identifier for the form. If we don't use it then we can't validate the form.


  // TextEditingController is used to control the text field. It is used to get the value of the text field.
  final TextEditingController _emailController = TextEditingController();  
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  // What dispose does: https://api.flutter.dev/flutter/widgets/State/dispose.html
  // In simple terms: It is called when the object is removed from the tree permanently.

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      final email = _emailController.text;
      final password = _passwordController.text;

      // For demonstration: print credential and show success
      print('Email: $email');
      print('Password: $password');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Successful'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate to home screen after login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }


  // Build the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                }
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true, // Hide password
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                }
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Login'),
              ),
            ]
          )
        )
      )
    );
  }
}
