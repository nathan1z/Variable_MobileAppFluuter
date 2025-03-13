import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homePage.dart';

void main() {
  runApp(MyApp()); // Solo una instancia de MaterialApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/home',
      routes: {
        '/home':
            (context) => HomePage(), // Cambiado de MyScanfold a MyScaffold
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child :Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyScaffold()),
            );
          },
          child: Text('Go Counter'),
        ), const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyScaffold()),
            );
          },
          child: Text('Go ShoppingList'),
        ),
        ],
      ),
      ),
    );
  }
}
