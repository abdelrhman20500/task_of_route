import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_of_route/Features/home/presentation/views/product_screen.dart';
import 'Core/uitis/set_up_service_locator.dart';
import 'Core/uitis/simple_bloc_observer.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  Bloc.observer= SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ProductScreen.routeName:(_)=>const ProductScreen(),
      },
      initialRoute: ProductScreen.routeName,
    );
  }
}

