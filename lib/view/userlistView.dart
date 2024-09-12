import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yyyyyyyyy/viewmodel/userListViewModel.dart';

class UserListModelView extends StatefulWidget {
  const UserListModelView({super.key});

  @override
  State<UserListModelView> createState() => _UserListModelViewState();
}

class _UserListModelViewState extends State<UserListModelView> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserlistviewmodelProvider>(context, listen: false)
        .getUserListVM();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get API"),
      ),
      body: Consumer<UserlistviewmodelProvider>(
        builder: (context, value, child) {
          return value.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: value.userListModelVM.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                            value.userListModelVM.data![index].id.toString()),
                      ),
                      title: Text(value
                          .userListModelVM.data![index].address!.city
                          .toString()),
                      subtitle: Text(value
                          .userListModelVM.data![index].address!.geo!.lat
                          .toString()),
                      trailing: Text(
                          value.userListModelVM.data![index].phone.toString()),
                    );
                  },
                );
        },
      ),
    );
  }
}
