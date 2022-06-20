import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _pref;

  static String _name = "";
  static bool _isDarkMode = false;
  static int _gender = 1;

  //Inicializamos las preferencias con un Future
  static Future init() async {
    _pref = await SharedPreferences.getInstance();
  }

  // Get y Set de name
  static String get name {
    return _pref.getString('name') ?? _name;
  }

  static set name(String name) {
    // Primero seteamos el valor en la variable estatica
    _name = name;
    // y ahora lo guardamos en el "localStorage de Flutter"
    _pref.setString('name', name);
  }

  // Get y Set de isDarkMode
  static bool get isDarkMode {
    return _pref.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    // Primero seteamos el valor en la variable estatica
    _isDarkMode = value;
    // y ahora lo guardamos en el "localStorage de Flutter"
    _pref.setBool('isDarkMode', value);
  }

// Get y Set de isDarkMode
  static int get gender {
    return _pref.getInt('gender') ?? _gender;
  }

  static set gender(int value) {
    // Primero seteamos el valor en la variable estatica
    _gender = value;
    // y ahora lo guardamos en el "localStorage de Flutter"
    _pref.setInt('gender', value);
  }
}
