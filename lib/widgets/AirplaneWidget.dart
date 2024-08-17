import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/models/airplanemodel.dart';
import 'package:project1univ/pages/Airplane_details_page.dart';
import 'package:project1univ/pages/tripswithcompany.dart';

class Airplanewidget extends StatelessWidget {
  const Airplanewidget({super.key, required this.airplane,});
  final Airplanedata airplane;

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
  
if (airplane.Rate == "1" ) {
      x = getRandomNumber(0.5, 1);
      x = roundToOneDecimal(x!);
    } else if (airplane.Rate == "2" ) {
      x = getRandomNumber(1,2);
      x = roundToOneDecimal(x!);
    } else if (airplane.Rate == "3" ) {
      x = getRandomNumber(2,3);
      x = roundToOneDecimal(x!);
    }
    else if (airplane.Rate == "4" ) {
      x = getRandomNumber(3,4);
      x = roundToOneDecimal(x!);
    }
    else if (airplane.Rate == "5" ) {
      x = getRandomNumber(4,5);
      x = roundToOneDecimal(x!);
    }
     else {
      x = 0.0; // Set a default value if the rate is not recognized
    }

    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => AirplaneDetailsPage(
                        airplanedetailes: airplane,
                      ))));
        },
        onDoubleTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TripsWithAirplane(airplaneforsearchtrip: airplane.name,),
              ));
        },
        child: Card(
          color: Color.fromARGB(255, 11, 173, 176),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.network(
                    airplane.photo,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      airplane.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                       Text(
                          "${S.of(context).Rate}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(width: 5),
                        
                           for (int i = 0; i < 5; i++)
      Icon(
        i < x.floor()
            ? Icons.star
            : Icons.star_border,
        color: i < x.floor()
            ? Colors.yellow
            : Colors.grey,
        size: 32,
      ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
