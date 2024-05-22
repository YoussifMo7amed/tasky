import 'package:flutter/material.dart';

import 'package:tasky/core/styles/colors/colors_dark.dart';
import 'package:tasky/core/styles/colors/colors_light.dart';
import 'package:tasky/core/styles/fonts/font_family_helper.dart';


ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions:const<ThemeExtension<dynamic>> [ ],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: FontFamilyHelper.getlocalizedFontFamily().copyWith(
        fontSize: 14,
        color: ColorsDark.white,
      
      )
    )
  );
}

ThemeData themelight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions:const<ThemeExtension<dynamic>> [ ],
    useMaterial3: true,
  );
}
