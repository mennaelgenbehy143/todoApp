import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/Home/homeScreen.dart';
import 'package:todo/Providers/AppConfigProvider.dart';
import 'package:todo/myThemeData.dart';

import 'Providers/ListProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings =
      Settings(persistenceEnabled: false);
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  
  runApp(ChangeNotifierProvider(
    create: (_)=> listProvider(),
    child: ChangeNotifierProvider(
        create: (_)=>AppConfigProvider(),
        child: const MyApp()
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider.appLanguage),
      theme:MyThemeData.lightTheme,
      darkTheme : MyThemeData.darkTheme,
      themeMode:provider.mode,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.ROUTE_NAME:(context)=>HomeScreen(),
      },
      initialRoute: HomeScreen.ROUTE_NAME,
    );
  }
}


