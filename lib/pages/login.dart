import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/properties.dart';
import 'package:flutter_application_1/styles/styles.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // Sección de Login
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo.png', height: 64),
                      SizedBox(height: 20),
                      Text(
                        "Inicia sesión",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Correo electrónico',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Contraseña',
                                border: OutlineInputBorder(),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                Text("Recordarme"),
                              ],
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Properties()),
                                );

                                //if (_formKey.currentState?.validate() ?? false) {
                                // Acción de inicio de sesión
                                //}
                              },
                              style: buttonStyle,
                              child: Text("Inicia sesión"),
                            ),
                            SizedBox(height: 20),
                            Divider(),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "¿No tienes una cuenta? Registrarme",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
