import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yyyyyyyyy/view/ListTypeModelView.dart';
import 'package:yyyyyyyyy/view/dynamicListView.dart';
import 'package:yyyyyyyyy/view/putViewScreen.dart';
import 'package:yyyyyyyyy/view/simpleTypemodelView.dart';
import 'package:yyyyyyyyy/view/singupScreen.dart';
import 'package:yyyyyyyyy/view/uploadImageView.dart';
import 'package:yyyyyyyyy/viewmodel/dynamicListVM.dart';
import 'package:yyyyyyyyy/viewmodel/patchApiViewModel.dart';
import 'package:yyyyyyyyy/viewmodel/putlistviewModel.dart';
import 'package:yyyyyyyyy/viewmodel/signupViewModel.dart';
import 'package:yyyyyyyyy/viewmodel/simpleTypeApiVm.dart';
import 'package:yyyyyyyyy/viewmodel/uploadImageViewModel.dart';
import 'package:yyyyyyyyy/viewmodel/userListViewModel.dart';

import 'storage/storage_helper.dart';
import 'view/deleteview.dart';
import 'view/patchViewScreen.dart';
import 'view/userlistView.dart';
import 'viewmodel/ListAPIpostViewmodel.dart';
import 'viewmodel/deleteApiViewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper.instance.init(); // Initialize SharedPreferences
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PostViewModelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SimpleTypeApiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserlistviewmodelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PutProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PatchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DeleteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UploadImageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CountryProvider(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: StorageHelper.instance.getToken() == null
        //     ? SignUpView()
        //     : HomePage(),
        // home: SignUpView(),
        // home: PatchViewScreen(),
        home: CountriesListView(),
        // home: HomePage(),
        // home: Deleteview(),
      ),
    );
  }
}
