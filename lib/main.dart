import 'package:flutter/material.dart';
import 'package:task_of_route/Features/home/presentation/views/home_screen.dart';
import 'Features/home/data/api_manager/api_manager.dart';



void main() {
  ApiManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ApiManager.getProduct();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

