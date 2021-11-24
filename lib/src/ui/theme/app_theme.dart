import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final Color error = Colors.red;
  static final Color cor = Color(0xffffd102);
  static final Color color = Colors.black;

  static final MaterialColor myColor = const MaterialColor(
    0xffffdd00,
    const {
      50 : const Color(0xffffd102),
      100 : const Color(0xffffd102),
      200 : const Color(0xffffd102),
      300 : const Color(0xffffd102),
      400 : const Color(0xffffd102),
      500 : const Color(0xffffd102),
      600 : const Color(0xffffd102),
      700 : const Color(0xffffd102),
      800 : const Color(0xffffd102),
      900 : const Color(0xffffd102)
    }
  );

  static final ThemeData theme3 = lightTheme.copyWith(
    scaffoldBackgroundColor: Color(0xfff1e9de),
    backgroundColor: Color(0xffebcac1),
    appBarTheme: lightTheme.appBarTheme.copyWith(
      backgroundColor: Color(0xfff1e9de),
    ),
    bottomAppBarColor: Color(0xfff1e9de),
    navigationBarTheme: lightTheme.navigationBarTheme.copyWith(
      backgroundColor: Color(0xfffef6eb),
    ),
    bottomNavigationBarTheme: lightTheme.bottomNavigationBarTheme.copyWith(
      backgroundColor: Color(0xfffef6eb),
    ),
    cardColor: Color(0xfffef6eb),
  );

  static final ThemeData theme4 = darkTheme.copyWith(
    scaffoldBackgroundColor: Color(0xff1d2a3b),
    appBarTheme: darkTheme.appBarTheme.copyWith(
      backgroundColor: Color(0xff1d2a3b),
    ),
    bottomAppBarColor: Color(0xff1d2a3b),
    navigationBarTheme: darkTheme.navigationBarTheme.copyWith(
      backgroundColor: Color(0xff2a3748),
    ),
    bottomNavigationBarTheme: darkTheme.bottomNavigationBarTheme.copyWith(
      backgroundColor: Color(0xff2a3748),
    ),
    cardColor: Color(0xff2a3748),
  );

  static final ThemeData theme5 = darkTheme.copyWith(
    scaffoldBackgroundColor: Color(0xff383e3e),
    appBarTheme: darkTheme.appBarTheme.copyWith(
      backgroundColor: Color(0xff383e3e),
    ),
    bottomAppBarColor: Color(0xff383e3e),
    navigationBarTheme: darkTheme.navigationBarTheme.copyWith(
      backgroundColor: Color(0xff2b3131),
    ),
    bottomNavigationBarTheme: darkTheme.bottomNavigationBarTheme.copyWith(
      backgroundColor: Color(0xff2b3131),
    ),
    cardColor: Color(0xff2b3131),
  );

  static final ThemeData theme6 = lightTheme.copyWith(
    scaffoldBackgroundColor: Color(0xfffcedea),
    backgroundColor: Color(0xfff48ec2),
    appBarTheme: lightTheme.appBarTheme.copyWith(
      backgroundColor: Color(0xfffcedea),
    ),
    bottomAppBarColor: Color(0xfffcedea),
    navigationBarTheme: lightTheme.navigationBarTheme.copyWith(
      backgroundColor: Color(0xfff5beb8),
      indicatorColor: Color(0xffff6d5f)
    ),
    bottomNavigationBarTheme: lightTheme.bottomNavigationBarTheme.copyWith(
      backgroundColor: Color(0xfff5beb8),
    ),
    floatingActionButtonTheme: lightTheme.floatingActionButtonTheme.copyWith(
      backgroundColor: Color(0xffff6d5f),
      foregroundColor: Colors.white,
    ),
    cardColor: Color(0xfff5beb8),
    colorScheme: lightTheme.colorScheme.copyWith(
      secondary: Color(0xffff6d5f),
    ),
  );

  static final ThemeData theme7 = lightTheme.copyWith(
    scaffoldBackgroundColor: Color(0xffecefe7),
    backgroundColor: Color(0xffbdec9f),
    appBarTheme: lightTheme.appBarTheme.copyWith(
      backgroundColor: Color(0xffecefe7),
    ),
    bottomAppBarColor: Color(0xffecefe7),
    navigationBarTheme: lightTheme.navigationBarTheme.copyWith(
      backgroundColor: Color(0xffc7d4bb),
      indicatorColor: Color(0xff3b4734),
    ),
    bottomNavigationBarTheme: lightTheme.bottomNavigationBarTheme.copyWith(
      backgroundColor: Color(0xffc7d4bb),
    ),
    floatingActionButtonTheme: lightTheme.floatingActionButtonTheme.copyWith(
      backgroundColor:  Color(0xff3b4734),
      foregroundColor: Colors.white,
    ),
    cardColor: Color(0xffc7d4bb),
    colorScheme: lightTheme.colorScheme.copyWith(
      secondary: Color(0xff3b4734),
    ),
  );

  static final ThemeData theme8 = lightTheme.copyWith(
    scaffoldBackgroundColor: Color(0xfff8fbff),
    backgroundColor: Color(0xff9afced),
    appBarTheme: lightTheme.appBarTheme.copyWith(
      backgroundColor: Color(0xfff8fbff),
    ),
    bottomAppBarColor: Color(0xfff8fbff),
    navigationBarTheme: lightTheme.navigationBarTheme.copyWith(
      backgroundColor: Color(0xffe1f1ff),
      indicatorColor: Color(0xff0b56cd),
    ),
    bottomNavigationBarTheme: lightTheme.bottomNavigationBarTheme.copyWith(
      backgroundColor: Color(0xffe1f1ff),
    ),
    floatingActionButtonTheme: lightTheme.floatingActionButtonTheme.copyWith(
      backgroundColor:  Color(0xff0b56cd),
      foregroundColor: Colors.white,
    ),
    cardColor: Color(0xffe1f1ff),
    colorScheme: lightTheme.colorScheme.copyWith(
      secondary: Color(0xff0b56cd),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: myColor,
    toggleableActiveColor: cor,
    unselectedWidgetColor: cor,
    backgroundColor: cor,
    bottomAppBarColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme(
      primary: cor, 
      primaryVariant: cor, 
      secondary: cor, 
      secondaryVariant: cor, 
      surface: cor, 
      background: Color(0xfffff6cc), 
      error: error, 
      onPrimary: cor, 
      onSecondary: cor, 
      onSurface: cor, 
      onBackground: cor, 
      onError: Colors.white, 
      brightness: Brightness.light,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Color(0xfffff6cc),
      indicatorColor: cor,
      iconTheme: MaterialStateProperty.all(
        IconThemeData(
          color: Colors.black,
        ),
      ),
      labelTextStyle: MaterialStateProperty.all(
        TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xfffff6cc),
      elevation: 5,
      selectedItemColor: cor,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed
    ),
    primaryColor: cor,
    secondaryHeaderColor: Colors.grey[300],
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: cor,
      foregroundColor: color,
      elevation: 6,
      focusElevation: 2,
      hoverElevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      sizeConstraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      extendedSizeConstraints: BoxConstraints.tightFor(
        height: 56,
      ),
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(
        color: Colors.black
      ),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    ),
    cardColor: Color(0xfffff6cc),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black
      ),
      bodyText2: TextStyle(
        color: Colors.black
      ),
      headline1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 35
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 24
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 18
      ),
      headline5: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 16
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 15,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: myColor,
    toggleableActiveColor: cor,
    unselectedWidgetColor: cor,
    backgroundColor: Colors.grey[900],
    bottomAppBarColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme(
      primary: cor, 
      primaryVariant: cor, 
      secondary: cor, 
      secondaryVariant: cor, 
      surface: cor, 
      background: Colors.grey[900]!, 
      error: error, 
      onPrimary: cor, 
      onSecondary: cor, 
      onSurface: cor, 
      onBackground: cor, 
      onError: Colors.white, 
      brightness: Brightness.light,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.grey[900],
      indicatorColor: cor,
      iconTheme: MaterialStateProperty.all(
        IconThemeData(
          color: Colors.white,
        ),
      ),
      labelTextStyle: MaterialStateProperty.all(
        TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900],
      elevation: 5,
      selectedItemColor: cor,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed
    ),
    primaryColor: cor,
    secondaryHeaderColor: Colors.grey[850],
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: cor,
      foregroundColor: color,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      extendedSizeConstraints: BoxConstraints.tightFor(
        height: 60,
      ),
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.white,
    ),
    indicatorColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.black,
      actionsIconTheme: IconThemeData(
        color: Colors.white
      ),
      centerTitle: false,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      )
    ),
    cardColor: Colors.grey[900],
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white
      ),
      bodyText2: TextStyle(
        color: Colors.white
      ),
      headline1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 35
      ),
      headline2: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 24
      ),
      headline4: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 18
      ),
      headline5: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 16
      ),
      headline6: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 15,
      ),
    ),
  );

  static const Color errorColor = Color.fromARGB(0xFF, 239, 83, 80);

}