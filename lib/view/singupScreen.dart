import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yyyyyyyyy/viewmodel/signupViewModel.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 32.0),
            Consumer<SignupProvider>(
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    if (!value.isLoading) {
                      value.getSignUpVM(email, password);
                    }
                    // Handle signup logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Signup with $email and $password')),
                    );
                  },
                  child: value.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.amber,
                        ))
                      : Text('Sign Up'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
