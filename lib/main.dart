import 'package:flutter/material.dart';
import 'screens/update_product_screen.dart';
import 'screens/home_page.dart';


void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProductScreen.id: (context) =>  UpdateProductScreen(),

      },
      initialRoute: HomePage.id,
    );
  }
}
