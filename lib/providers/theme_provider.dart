import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarBrightness: isOn ? Brightness.dark : Brightness.light,
    //     statusBarIconBrightness: isOn ? Brightness.light : Brightness.dark,
    //   ),
    // );
    notifyListeners();
  }

  // void setStatusBar() {
  //   final darkTheme = themeMode == ThemeMode.dark;
  //   SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(
  //       statusBarBrightness: darkTheme ? Brightness.dark : Brightness.light,
  //       statusBarIconBrightness: darkTheme ? Brightness.light : Brightness.dark,
  //     ),
  //   );
  // }
}

class Themes {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    useMaterial3: true,
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    useMaterial3: true,
  );
}
