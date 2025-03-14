import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Properties extends StatelessWidget {
  const Properties({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                          autoPlay: false,
                          enlargeCenterPage: true,
                        ),
                        items:
                            [
                              'assets/img1.jpg',
                              'assets/img2.jpg',
                              'assets/img3.jpg',
                            ].map((imgPath) {
                              return Container(
                                margin: EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    imgPath,
                                    fit: BoxFit.cover,
                                    width: 1000.0,
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Casa en Renta, Sector Colegio militar, Ricaurte",
                        style: TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "\$500",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFFD78227),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(),
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                        padding: const EdgeInsets.all(10.0),
                        crossAxisCount: 2,
                        childAspectRatio: 2.5,
                        children: <Widget>[
                          buildFeature(Icons.bed, "4 habitaciones"),
                          buildFeature(Icons.bathtub, "5 baños"),
                          buildFeature(
                            Icons.directions_car,
                            "5 estacionamientos",
                          ),
                          buildFeature(Icons.square_foot, "352.0 m²"),
                        ],
                      ),
                      Divider(),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Detalles Generales",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD78227),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFFD78227),
                              decorationThickness: 2,
                            ),
                          ),
                        ),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        children: [
                          buildDetail("Tipo de propiedad", "Terreno/Lote"),
                          buildDetail("Permite mascotas", "No"),
                          buildDetail("Urbanización cerrada", "No"),
                          buildDetail("Guardianía", "No"),
                          buildDetail("Amoblado", "No"),
                          buildDetail("Condición", "Antiguo"),
                          buildDetail("Servicios incluidos", "No"),
                          buildDetail("Año de construcción", "2020"),
                        ],
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Casa en renta en el sector Colegio Militar, Ricaurte, con 3 habitaciones, 2 baños, sala, comedor, cocina, patio, garaje, cisterna, bomba de agua, tanque de gas, lavandería, terraza, jardín, cerca de escuelas, colegios, universidades, supermercados, farmacias, hospitales, parques, transporte público, seguridad, ideal para vivienda, oficinas, empresas, negocios, etc. Precio: \$500.00 mensuales. Informes: 0995-345-678. Se aceptan mascotas.",
                          textAlign: TextAlign.justify,
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
    );
  }
}

Widget buildFeature(IconData icon, String text) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, size: 30),
      SizedBox(height: 5),
      Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    ],
  );
}

Widget buildDetail(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 16, color: Colors.black),
        children: [
          TextSpan(
            text: "$title: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: value),
        ],
      ),
    ),
  );
}
