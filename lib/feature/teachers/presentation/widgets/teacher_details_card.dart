import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeacherCard extends StatelessWidget {
  final String name;
  final String nationality;
  final String accent;
  final String image;
  final Color backgroundColor;

  TeacherCard({
    required this.name,
    required this.nationality,
    required this.accent,
    required this.image,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(

      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:  SvgPicture.asset(
                image,

              ),

              // Image(image: AssetImage(image),height: 100,width: 100,),

              ),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
             Container(
               child: Row(
                 children: [
                   Text(
                     "Nationality: $nationality",
                     style: TextStyle(fontSize: 14),
                   ),

                 ],
               ),
             ),
                Spacer(),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Accent: $accent",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),




          ],
        ),
        // child: Row(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(10.0),
        //       child: CircleAvatar(
        //         backgroundImage: AssetImage(image),
        //         radius: 40,
        //
        //       ),
        //     ),
        //     Expanded(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             name,
        //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //           ),
        //           Row(
        //             children: [
        //               Text(
        //                 "Nationality: $nationality",
        //                 style: TextStyle(fontSize: 14),
        //               ),
        //               Spacer(),
        //               Text(
        //                 "Accent: $accent",
        //                 style: TextStyle(fontSize: 14),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}