import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/properties.dart';

class Homeinmobilistico extends StatelessWidget {
  const Homeinmobilistico({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'Descubre tu propiedad perfecta en el lugar ideal',
                    style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold),
                    textAlign:
                        TextAlign.center, 
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Iniciar Sesión'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/properties');
                },
                child: Text('Ver Propiedades'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
