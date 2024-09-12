import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yyyyyyyyy/viewmodel/patchApiViewModel.dart';

class PatchViewScreen extends StatefulWidget {
  const PatchViewScreen({super.key});

  @override
  State<PatchViewScreen> createState() => _PatchViewScreenState();
}

class _PatchViewScreenState extends State<PatchViewScreen> {
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
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: jobController,
              decoration: InputDecoration(
                labelText: 'Job',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            Consumer<PatchProvider>(
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () {
                    final name = nameController.text.trim();
                    final job = jobController.text.trim();
                    if (!value.isLoading) {
                      // Call getPatchVM only if not loading
                      value.getPatchVM(name, job);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Signup with $name and $job')),
                      );
                    }
                  },
                  child: value.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.amber,
                          ),
                        )
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
