import 'package:dear_michael/Utils/Routes/routes.dart';
import 'package:dear_michael/Utils/Routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Dialog/share_dialog/share_dialog_vm.dart';
import 'Screens/ProfileScreen/profile_vm.dart';
import 'Screens/Settings/setting_vm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [

        ChangeNotifierProvider(create: (_) => ShareDialogVM()),
        ChangeNotifierProvider(create: (_) => ProfileVm()),
        ChangeNotifierProvider(create: (_) => SettingVm())

      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),);
  }
}

