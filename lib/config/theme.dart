import 'package:flutter/material.dart';

ThemeData basicTheme(){
  TextTheme _basicTextTheme(TextTheme base){
    return base.copyWith(
      headline5: base.headline5!.copyWith(
        fontSize: 22.0,
        color: Colors.black 
      ),
      headline4: base.headline4!.copyWith(
        fontFamily: 'Sen-Regular',
        fontSize: 18.0,
        color: Colors.white
      ),
      headline3: base.headline3!.copyWith(
        fontFamily: 'Sen-Regular',
        fontSize: 18.0,
        color: const Color(0xFF0C71C3)
      ),
      headline2: base.headline2!.copyWith(
        fontFamily: 'Lato',
        fontSize: 14.0,
        color: Colors.white
      ),
    );
  }
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: const Color(0xFF0C71C3)
  );
}