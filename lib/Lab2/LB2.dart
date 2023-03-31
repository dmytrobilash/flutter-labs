import 'package:flutter/material.dart';
import 'package:first_lb_flutter/Lab2/Planets.dart';

class LB2 extends StatelessWidget { @override
Widget build(BuildContext context) { return MaterialApp(

  title: "Лабораторна 2", home: Scaffold(
  appBar: AppBar( elevation: 0, title: const Text(
    "Planets",
    style: TextStyle( fontFamily: "Kamerik", fontSize: 40.0,
    ),
  ),
      centerTitle: true, flexibleSpace: Container(
        decoration: const BoxDecoration( gradient: LinearGradient(
            begin: Alignment.bottomLeft, end: Alignment.topCenter,
            colors: <Color>[Color(0xFF5a8bff),
              Color(0xFF74c3ff)]),
        ),
      ),
      toolbarHeight: 70), body: PlanetList(),
  backgroundColor: Color(0xFF726ab7),
),
);
}
}

class PlanetList extends StatelessWidget { final List<Planet> planet = <Planet>[
  Planet(1, "Mars", "Milkyway Galaxy", "54.6m Km", "3.711 m/s ", "Lorem ipsum...", "assets/img/mars.png"),
  Planet(2, "Neptune", "Milkyway Galaxy", "54.6m Km", "3.711 m/s", "Lorem ipsum...", "assets/img/neptune.png"),
  Planet(3, "Moon", "Milkyway Galaxy", "54.6m Km", "3.711 m/s ", "Lorem ipsum...", "assets/img/moon.png"),
  Planet(4, "Earth", "Milkyway Galaxy", "54.6m Km", "3.711 m/s ", "Lorem ipsum...", "assets/img/earth.png"),
  Planet(5, "Mercury", "Milkyway Galaxy", "54.6m Km", "3.711 m/s", "Lorem ipsum...", "assets/img/mercury.png"),
];

Widget build(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
    child: ListView.builder(
      itemCount: planet.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child:
            Stack(alignment: AlignmentDirectional.centerStart, children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Container(
                  height: 185,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(1),
                        spreadRadius: -10,
                        blurRadius: 12,
                        offset: const Offset(0, 15),
                      ),
                    ],
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: const Color(0xFF898AE2),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0, top: 10.0),
                      child: ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                          title: Text(
                            planet[index].name,
                            style: const TextStyle(
                              fontFamily: "Kamerik",
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    planet[index].location,
                                    style: const TextStyle(
                                      fontFamily: "Cyrillic",
                                      fontSize: 16.0,
                                      color: Color(0xFFBEC1FC),
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Container(
                                    height: 4.0,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: Color(0xFF75A7E7),
                                          width: 30.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 13.0),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: Color(0xFFBEC1FC),
                                        size: 12.0,
                                      ),
                                      const SizedBox(width: 2.0),
                                      Text(
                                        planet[index].distance,
                                        style: const TextStyle(
                                          fontFamily: "Cyrillic",
                                          fontSize: 14.0,
                                          color: Color(0xFFBEC1FC),
                                        ),
                                      ),
                                      const SizedBox(width: 15.0),
                                      const Icon(
                                        Icons.flight_land_outlined,
                                        color: Color(0xFFBBBEFF),
                                        size: 12.0,
                                      ),
                                      const SizedBox(width: 7.0),
                                      Text(
                                        planet[index].gravity,
                                        style: const TextStyle(
                                          fontFamily: "Cyrillic",
                                          fontSize: 14.0,
                                          color: Color(0xFFBEC1FC),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                  width: 120,
                  height: 120,
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: DecoratedBox(
                          decoration: ShapeDecoration(
                              shape: const CircleBorder(),
                              image: DecorationImage(
                                  image: AssetImage(
                                    planet[index].image,
                                  )
                              )
                          )
                      )
                  )
              )
            ]));
      },
    ),
  );
}
}