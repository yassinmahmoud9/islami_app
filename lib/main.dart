import 'package:flutter/material.dart';
import 'package:islami/ui/screens/detials_screen/details_screen.dart';
import 'package:islami/ui/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      routes: {
        HomeScreen.routeName:(_) => HomeScreen(),
        DetailsScreen.routeName:(_) => DetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
