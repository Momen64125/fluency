import 'package:fluency/feature/sessions/presentation/widges/status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SessionsDetails extends StatelessWidget {
  final String name;
  final String date;
  final String duration;
  final String status;

  const SessionsDetails({
    super.key,
    required this.name,
    required this.date,
    required this.duration,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // تعيين الـ border radius
      ),
      borderOnForeground: true ,
      color: Color(0xFFFFFFFF),
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
           children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 70,
                  width: 70,
                  child: SvgPicture.asset(
                    'assets/images/Rectangle 1.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                const Image(
                  image: AssetImage(
                      'assets/images/85bbfb100dc9a6444ea4ff1ea2570dbc.png'),
                  height: 60,
                  width: 60,
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,

                     children: [
                      Text(
                        name,
                        style: const TextStyle(

                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                    ],
                  ),
                  status == "Ongoing" ? const SizedBox(height: 8): const SizedBox(height: 0),
                  Row(
                    children: [
                      SvgPicture.asset(

                        'assets/icons/tiem.svg',
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: const TextStyle(

                            fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatusWidget(status: status),


                    ],
                  ),
                ],
              ),


            ),
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 status != "Ongoing"? Container(
                     width: 40,
                     height:40 ,

                     decoration: BoxDecoration(

                       color: Color( 0xFFF6F6F6),
                       borderRadius:BorderRadius.circular(12) ,
                     ),

                     child: const Icon(Icons.more_vert,color: Color(0xFF662D91),))
                     : const SizedBox(height: 40,width: 40,),
                 SizedBox(height: 20,),

                 Row(
                   children: [
                     Text(

                       'Duration:',
                       style: const TextStyle(
                           fontWeight: FontWeight.w600,

                           fontSize: 8, color: Color(0xFF777777)),
                     ),
                     Text(' $duration',

                       style: const TextStyle(
                           fontWeight: FontWeight.w700,
                           fontFamily: 'Nunito',
                           fontSize: 10, color: Color(0xFF777777)),

                     ),
                   ],
                 ),
               ]
             )

          ],
        ),
      ),
    );

  }
}
