import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yyyyyyyyy/viewmodel/dynamicListVM.dart';

class CountriesListView extends StatefulWidget {
  const CountriesListView({super.key});

  @override
  State<CountriesListView> createState() => _CountriesListViewState();
}

class _CountriesListViewState extends State<CountriesListView> {
  @override
  void initState() {
    super.initState();
    Provider.of<CountryProvider>(context, listen: false).countryVm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Place"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search with country name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          Expanded(
            child: Consumer<CountryProvider>(
              builder: (context, value, child) {
                return value.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                          itemCount: value.countryModelVM.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(value.countryModelVM
                                      .data![index]['countryInfo']['flag']
                                      .toString())),
                              title: Text(value
                                  .countryModelVM.data![index]['country']
                                  .toString()),
                              // subtitle: Text(value
                              //     .countryModelVM.data![index].cases
                              //     .toString()),
                            );
                          },
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
