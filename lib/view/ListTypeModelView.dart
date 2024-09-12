import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yyyyyyyyy/response/status.dart';
import 'package:yyyyyyyyy/viewmodel/ListAPIpostViewmodel.dart';

import '../storage/storage_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Provider.of<PostViewModelProvider>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get API"),
      ),
      body: Consumer<PostViewModelProvider>(
        builder: (context, value, child) {
          return value.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: value.postModelListVM.data!.length,
                  itemBuilder: (context, index) {
                    StorageHelper instance = StorageHelper.instance;
                    print("home page print token-----${instance.getToken()}");

                    print("Sotage token ======== ${instance.getToken()}");
                    return ListTile(
                      title: Text(
                          "title\n${value.postModelListVM.data![index].title}"),
                      subtitle: Text(
                          value.postModelListVM.data![index].body ?? 'No Body'),
                    );
                  },
                );
        },
      ),
    );
  }
}
