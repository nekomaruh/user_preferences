import 'package:flutter/material.dart';
import 'package:userpreferences/user_preferences.dart';
import 'package:userpreferences/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('User preferences'),
        backgroundColor: prefs.secondaryColor ? Colors.red : Theme.of(context).primaryColor,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary color: ${prefs.secondaryColor}'),
          Divider(),
          Text('Sex: ${prefs.sex}'),
          Divider(),
          Text('User name: ${prefs.name}')
        ],
      ),
    );
  }


}
