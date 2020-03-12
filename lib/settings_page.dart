import 'package:flutter/material.dart';
import 'package:userpreferences/user_preferences.dart';
import 'package:userpreferences/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor;
  int _sex;
  String _name = "Johan";
  TextEditingController _textController;
  final _prefs = new UserPreferences();

  @override
  initState(){
    super.initState();
    _sex = _prefs.sex;
    _secondaryColor = _prefs.secondaryColor;
    _textController = new TextEditingController(text: 'Name');
  }

  _setSelectedRadio(int value){
    _prefs.sex(value);
    _sex = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: _prefs.secondaryColor ? Colors.red : Theme.of(context).primaryColor,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Settings', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile.adaptive(value: _secondaryColor, onChanged: (value){setState(() {
            _secondaryColor = value;
            _prefs.secondaryColor = value;
          });}, title: Text("Secondary color"),),
          RadioListTile(value: 1, title: Text('Male'), groupValue: _sex, onChanged: _setSelectedRadio),
          RadioListTile(value: 2, title: Text('Female'), groupValue: _sex, onChanged: _setSelectedRadio,),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: _name,
                helperText: 'Name of the person using the phone',
              ),
              onChanged: (text){ setState(() {
                _name = text;
              });},
            ),
          )
        ],
      )
    );
  }
}
