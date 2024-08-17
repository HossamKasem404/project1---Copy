import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project1univ/generated/l10n.dart';
import 'package:project1univ/models/countrymodel.dart';
import 'package:project1univ/pages/tripsWithCountry.dart';

class CountrWidget extends StatelessWidget {
  final CountryData country;

  const CountrWidget({super.key, required this.country});
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
  
if (country.rate == "Low" ||country.rate == "low"   ) {
      x = getRandomNumber(0.5, 3);
      x = roundToOneDecimal(x!);
    } else if (country.rate== "High" || country.rate== "high" ) {
      x = getRandomNumber(4,5);
      x = roundToOneDecimal(x!);
    } else if (country.rate== "Medium" || country.rate== "medium" ) {
      x = 3;
     
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
                builder: (context) => TripsWithCountry(
                  countryforsearchtrip: country.name,
                ),
              ));
        },
        child: Card(
          color:  const Color.fromARGB(255, 11, 173, 176),
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
                    country.photo,
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
                      country.name,
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
