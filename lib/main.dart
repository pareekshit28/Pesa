import 'package:flutter/material.dart';
import 'package:pesa/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pésa',
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: const Color(0xff121212),
          textTheme: const TextTheme(
            headline1: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            headline2: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            headline3: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            headline4: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            headline5: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            subtitle1: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            subtitle2: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xff121212),
            unselectedItemColor: Colors.grey,
          )),
      home: const MainScreen(),
    );
  }
}
