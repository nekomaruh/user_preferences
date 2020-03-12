import 'package:flutter/material.dart';
import 'package:userpreferences/home_page.dart';
import 'package:userpreferences/settings_page.dart';
import 'package:userpreferences/user_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferences',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : (_) => HomePage(),
        SettingsPage.routeName : (_) => SettingsPage()
      },
    );
  }
}
