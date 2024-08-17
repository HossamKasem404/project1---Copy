import 'dart:math';

import 'package:flutter/material.dart';

class CircularChart extends StatelessWidget {
  CircularChart({super.key, required this.valueofrotation, required this.category});
  String valueofrotation;
  String category;
  getRandomNumber(double min, double max) {
    final random = Random();
    return min + random.nextDouble();
  }
   double roundToOneDecimal(double number) {
    return (number * 10).round() / 10;}
  @override
  Widget build(BuildContext context) {
     double? x;
 
if (valueofrotation == "1" ) {
      x =0.1;

     
    } else if (valueofrotation == "2" ) {
    x =0.2;

      
    } else if (valueofrotation == "3" ) {
     x =0.3;
    }
    else if (valueofrotation == "4" ) {
     x =0.4;
    }
    else if (valueofrotation == "5" ) {
      x =0.5;
    }
    else if (valueofrotation == "6" ) {
     x =0.6;
    }else if (x == "7" ) {
      x =0.7;
    }else if (valueofrotation == "8" ) {
      x =0.8;
    }else if (valueofrotation == "9" ) {
     x =0.9;

    }else if (valueofrotation == "10" ) {
      x =1; 
    }
     else {
      x = 0.0; // Set a default value if the rate is not recognized
    }
    return Row(
      //   children: [
      //     Text('Services'),
      //     SizedBox(height: 16),
      //     Container(
      //       height: 200,
      //       width: 200,
      //       child: Stack(
      //         children: [
      //           Center(
      //             child: CircularProgressIndicator(
      //               value: 0.364,
      //               strokeWidth: 16,
      //               backgroundColor: Colors.grey[200],
      //               valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      //             ),
      //           ),
      //           Center(
      //             child: Text(
      //               '36.4%',
      //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(height: 16),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Column(
      //           children: [
      //             Container(
      //               height: 10,
      //               width: 10,
      //               color: Colors.blue,
      //             ),
      //             Text('Save'),
      //           ],
      //         ),
      //         Column(
      //           children: [
      //             Container(
      //               height: 10,
      //               width: 10,
      //               color: Colors.grey,
      //             ),
      //             Text('Food'),
      //           ],
      //         ),
      //         Column(
      //           children: [
      //             Container(
      //               height: 10,
      //               width: 10,
      //               color: Colors.blueGrey,
      //             ),
      //             Text('Comforts'),
      //           ],
      //         ),
      //         Column(
      //           children: [
      //             Container(
      //               height: 10,
      //               width: 10,
      //               color: Colors.black,
      //             ),
      //             Text('The Cost'),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ],
      // );
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$category    :',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          width: 200,
          child: Stack(
            children: [
              Center(
                child: CircularProgressIndicator(
                  value: x,
                  strokeWidth: 50,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
              Center(
                child: Text(
                  '${x*100}''%',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Column(
        //       children: [
        //         Container(
        //           height: 10,
        //           width: 10,
        //           color: Colors.blue,
        //         ),
        //         Text('Save'),
        //       ],
        //     ),
        //     Column(
        //       children: [
        //         Container(
        //           height: 10,
        //           width: 10,
        //           color: Colors.grey,
        //         ),
        //         Text('Food'),
        //       ],
        //     ),
        //     Column(
        //       children: [
        //         Container(
        //           height: 10,
        //           width: 10,
        //           color: Colors.blueGrey,
        //         ),
        //         Text('Comforts'),
        //       ],
        //     ),
        //     Column(
        //       children: [
        //         Container(
        //           height: 10,
        //           width: 10,
        //           color: Colors.black,
        //         ),
        //         Text('The Cost'),
        //       ],
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
