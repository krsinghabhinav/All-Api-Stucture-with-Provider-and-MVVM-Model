import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yyyyyyyyy/viewmodel/deleteApiViewModel.dart';

class Deleteview extends StatefulWidget {
  const Deleteview({super.key});

  @override
  State<Deleteview> createState() => _DeleteviewState();
}

class _DeleteviewState extends State<Deleteview>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
            SizedBox(height: 32.0),
            Consumer<DeleteProvider>(
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () {
                    if (!value.isLoading) {
                      // Call getPatchVM only if not loading
                      value.getDeleteVM('999');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Delete Successully')),
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
