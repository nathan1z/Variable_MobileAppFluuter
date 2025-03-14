import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/shoppingList.dart';
import 'package:flutter_application_1/pages/counter.dart';
import 'package:flutter_application_1/styles/styles.dart';
import 'package:flutter_application_1/pages/homeInmobilistico.dart';

void main() {
  runApp(MyApp()); 
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
        '/home': (context) => HomePage(), 
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
 
 ElevatedButton _buildButton(BuildContext context, String text, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      style: buttonStyle,
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(context, 'Go Shopping List', MyShoppingList()),
            const SizedBox(height: 16),
            _buildButton(context, ' Go Counter', CounterWidget()),
            const SizedBox(height: 16),
            _buildButton(context, 'Go Inmobilístico', Homeinmobilistico())
            
          ],
        ),
      ),
    );
  }
}
