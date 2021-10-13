import 'package:appointment/screens/appointmnentscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF2F2F2),
        // primarySwatch: Colors.white70,
        appBarTheme: const AppBarTheme().copyWith(
          color: const Color(0xFFF2F2F2),
          elevation: 0,
          textTheme: const TextTheme(
            headline6: TextStyle(
              color: Colors.black54,
              fontSize: 1,
            ),
          ),
        ),
      ),
      home: const AppointmentScreen(),
    );
  }
}
