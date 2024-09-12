import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yyyyyyyyy/viewmodel/putlistviewModel.dart';
import 'package:yyyyyyyyy/viewmodel/signupViewModel.dart';

class PutScreen extends StatefulWidget {
  const PutScreen({super.key});

  @override
  State<PutScreen> createState() => _PutScreenState();
}

class _PutScreenState extends State<PutScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

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
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'name',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: jobController,
              decoration: InputDecoration(
                labelText: 'job',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 32.0),
            Consumer<PutProvider>(
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () {
                    final name = nameController.text.trim();
                    final job = jobController.text.trim();
                    if (!value.isLoading) {
                      value.getPutVM(name, job);
                    }
                    // Handle signup logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Signup with $name and $job')),
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
