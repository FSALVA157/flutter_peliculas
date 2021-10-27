import 'package:flutter/material.dart';
import 'package:peliculas/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'peliculas',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {'home': (_) => HomeScreen(), 'details': (_) => DetailsScreen()},
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(color: Colors.indigo),
          textTheme: TextTheme(
              caption: TextStyle(color: Colors.white),
              bodyText1: TextStyle(color: Colors.white, fontSize: 10.0))),
    );
  }
}
