// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:project1univ/models/airplanemodel.dart';
// import 'package:project1univ/widgets/hussam_widget/CircularChart.dart';

// class AirplaneDetailsPage extends StatelessWidget {
//   static String id = "Airplane Details";
//   AirplaneDetailsPage({required this.airplanedetailes});
//   final Airplanedata airplanedetailes;

//   getRandomNumber(double min, double max) {
//     final random = Random();
//     return min + random.nextDouble();
//   }

//   double roundToOneDecimal(double number) {
//     return (number * 10).round() / 10;
//   }

//   @override
//   Widget build(BuildContext context) {
//     double? x;

//     if (airplanedetailes.Rate == "1") {
//       x = getRandomNumber(0.5, 1);
//       x = roundToOneDecimal(x!);
//     } else if (airplanedetailes.Rate == "2") {
//       x = getRandomNumber(1, 2);
//       x = roundToOneDecimal(x!);
//     } else if (airplanedetailes.Rate == "3") {
//       x = getRandomNumber(2, 3);
//       x = roundToOneDecimal(x!);
//     } else if (airplanedetailes.Rate == "4") {
//       x = getRandomNumber(3, 4);
//       x = roundToOneDecimal(x!);
//     } else if (airplanedetailes.Rate == "5") {
//       x = getRandomNumber(4, 5);
//       x = roundToOneDecimal(x!);
//     } else {
//       x = 0.0; // Set a default value if the rate is not recognized
//     }

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Image.network(
//                   airplanedetailes.photo,
//                   height: 200,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//                 Positioned(
//                   bottom: 10,
//                   left: 10,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${airplanedetailes.name}',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Icon(Icons.location_on, color: Colors.white),
//                           Text(
//                             '${airplanedetailes.location}',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         'Description',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Spacer(),
//                       Icon(Icons.favorite_border, color: Colors.red),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     '${airplanedetailes.description}',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Text(
//                         '$x',
//                         style: TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       for (int i = 0; i < 5; i++)
//                         Icon(
//                           i < x!.floor()
//                               ? Icons.star
//                               : Icons.star_border,
//                           color: i < x!.floor()
//                               ? Colors.blue
//                               : Colors.grey,
//                           size: 32,
//                         ),
//                     ],
//                   ),
                  
//                   ListView(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     children: [
//                       CircularChart(
//                         valueofrotation: airplanedetailes.service,
//                         category: "Service",
//                       ),
//                       Spacer(flex: 1),
//                       CircularChart(
//                         valueofrotation: airplanedetailes.food,
//                         category: "Food",
//                       ),
//                       Spacer(flex: 1),
//                       // CircularChart(
//                       //   valueofrotation: airplanedetailes.safe,
//                       //   category: "Safe",
//                       // ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/models/airplanemodel.dart';
import 'package:project1univ/widgets/hussam_widget/CircularChart.dart';

class AirplaneDetailsPage extends StatelessWidget {
  static String id = "Airplane Details";
  const AirplaneDetailsPage({super.key, required this.airplanedetailes});
  final Airplanedata airplanedetailes;

  getRandomNumber(double min, double max) {
    final random = Random();
    return min + random.nextDouble();
  }

  double roundToOneDecimal(double number) {
    return (number * 10).round() / 10;
  }

  @override
  Widget build(BuildContext context) {
    double? x;
      
    if (airplanedetailes.Rate == "1") {
    x =1;
    } else if (airplanedetailes.Rate == "2") {
      x =2;
    } else if (airplanedetailes.Rate == "3") {
    x =3;
    } else if (airplanedetailes.Rate == "4") {
    x =4;
    } else if (airplanedetailes.Rate == "5") {
     x =5;
    } else {
      x = 0.0; // Set a default value if the rate is not recognized
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color.fromARGB(255, 11, 173, 176),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  airplanedetailes.photo,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        airplanedetailes.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.white),
                          Text(
                            airplanedetailes.location,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    children: [
                      Text(
                        '${S.of(context).Description}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.favorite_border, color: Colors.red),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    airplanedetailes.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        '$x',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      for (int i = 0; i < 5; i++)
                        Icon(
                          i < x.floor()
                              ? Icons.star
                              : Icons.star_border,
                          color: i < x.floor()
                              ? const Color.fromARGB(255, 112, 120, 126)
                              : Colors.grey,
                          size: 32,
                        ),
                    ],
                  ),
                  // SizedBox(height: 16),
                  // ListView(
                  //   shrinkWrap: true,
                  //   scrollDirection: Axis.vertical,
                  //   physics: NeverScrollableScrollPhysics(),
                    // children: [
                      CircularChart(
                        valueofrotation: airplanedetailes.service,
                        category: S.of(context).Services,
                      ),
                  //     Spacer(flex: 1),
                      CircularChart(
                        valueofrotation: airplanedetailes.food,
                        category: S.of(context).Food,
                      ),
                  //     Spacer(flex: 1),
                      CircularChart(
                        valueofrotation: airplanedetailes.safe,
                        category:  S.of(context).Safety,
                      ),
                      
                      
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 