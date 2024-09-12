import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../response/status.dart';
import '../viewmodel/simpleTypeApiVm.dart';

class SimpleTypeModelScreen extends StatefulWidget {
  const SimpleTypeModelScreen({super.key});

  @override
  State<SimpleTypeModelScreen> createState() => _SimpleTypeModelScreenState();
}

class _SimpleTypeModelScreenState extends State<SimpleTypeModelScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SimpleTypeApiProvider>(context, listen: false)
        .fetchSimpleTypeModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get API"),
      ),
      body: Consumer<SimpleTypeApiProvider>(
        builder: (context, viewModel, child) {
          return viewModel.isLoading
              ? const CircularProgressIndicator()
              : Center(
                  child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(viewModel
                          .simpleTypeMVM.data!.data!.avatar
                          .toString())),
                  title: Text(
                      viewModel.simpleTypeMVM.data!.support!.url.toString()),
                  subtitle: Text(
                      viewModel.simpleTypeMVM.data!.data!.avatar.toString() ??
                          ""),
                ));
        },
      ),
    );
  }
}
