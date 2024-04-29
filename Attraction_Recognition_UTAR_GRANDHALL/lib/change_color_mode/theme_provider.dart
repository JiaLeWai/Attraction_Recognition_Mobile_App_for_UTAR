import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system; //Light mode or dark mode depend on user phone setting

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light; //If toggle button On, dark mode; else light mode
    notifyListeners(); // update UI
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF2A363B), //background color
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(), //Change font to white
    iconTheme: IconThemeData(color: Colors.blueGrey[800]),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white, //background color
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(), //Change font to black
    iconTheme: IconThemeData(color: Colors.blueGrey[100]),
  );
}