import 'package:flutter/material.dart';

import '../config_file.dart';

class AppColors {
  static const Color paleWhite = Color(0xfff2f4f7);
}

Color searchTextColor = currentTheme.currentTheme() != ThemeMode.dark
    ? const Color(0xff667085)
    : const Color(0xffeaecf0);
Color countryTextColor = currentTheme.currentTheme() != ThemeMode.dark
    ? const Color(0xff1c1917)
    : const Color(0xfff2f4f7);
Color stateTextColor = currentTheme.currentTheme() != ThemeMode.dark
    ? const Color(0xff667085)
    : const Color(0xff98a2b3);
Color searchBarColor = currentTheme.currentTheme() != ThemeMode.dark
    ? const Color(0xfff2f4f7)
    : const Color(0xff98a2b3);
