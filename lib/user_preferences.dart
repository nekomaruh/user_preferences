import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences(){
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _preferences;

  initPrefs() async {
    this._preferences = await SharedPreferences.getInstance();

  }


  /*
  // None of this properties is used
  bool _secondaryColor;
  int _sex;
  String _name;
   */

  get sex{
    return _preferences.getInt('sex') ?? 1;
  }

  set sex(int value){
    _preferences.setInt('sex', value);
  }

  get secondaryColor{
    return _preferences.getBool('secondary_color') ?? false;
  }

  set secondaryColor(bool value){
    _preferences.setBool('secondary_color', value);
  }





}