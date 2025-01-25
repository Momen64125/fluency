import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'doubleArrowIcon.dart';

class ExpandableNotificationWidget extends StatefulWidget {
  const ExpandableNotificationWidget({super.key});

  @override
  State<ExpandableNotificationWidget> createState() => _ExpandableNotificationWidgetState();
}

class _ExpandableNotificationWidgetState extends State<ExpandableNotificationWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return
      Align(
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: double.infinity,
            height: isExpanded ? 300 : 180,

            decoration: BoxDecoration(

           gradient: const LinearGradient(
             colors: [Color(0xFF662D91), Color(0xFF905EB6)],
            begin: Alignment.bottomRight,
             end: Alignment.bottomLeft,
    ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(isExpanded ? 20 : 30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment:   CrossAxisAlignment.center,
              children: [
                if (!isExpanded)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 340,
                      height: 56,
                      child: Center(
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [


                            Container(

                              width: 128,
                              height: 56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16), // لجعل الإطار دائري
                                  border: Border.all(
                                    color: const Color(0xFF905EB6),
                                    width: 1,
                                  ),
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF7234A0), Color(0xFF502173)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 0,

                                  )
                                ]
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child:  Stack(
                                       alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 1.sw*0.1,
                                            height: 1.sh*0.05,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xFFFFB215),
                                            ),
                                          ),
                                          Image(image: AssetImage('assets/images/85bbfb100dc9a6444ea4ff1ea2570dbc.png'), width: 1.sw*0.1,
                                            height: 1.sh*0.05,),
                                        ]

                                    ),





                                  ),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Mohamed...",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "May 5, 2024",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),



                            Container(
                              width: 128,
                              height: 56,
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16), // لجعل الإطار دائري
                                  border: Border.all(
                                    color: const Color(0xFF905EB6),
                                    width: 1,
                                  ),
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF7234A0), Color(0xFF502173)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  )
                                ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only( top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                                  children: [
                                    Column(
                                      mainAxisAlignment:  MainAxisAlignment.start ,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Free Account?",
                                          style: TextStyle(

                                              color: Colors.white, fontSize: 10),
                                        ),
                                        Text(
                                          "Subscribe Now",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration:BoxDecoration(
                                        color: Color(0xFFFFB215),
                                        shape: BoxShape.circle,
                                      ) ,
                                      child: Icon(Icons.keyboard_arrow_right,
                                      size: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                               width: 56,
                               height: 56,
                              // width: 1.sw*0.1,
                              // height: 1.sh*0.06,
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16), // لجعل الإطار دائري
                                  border: Border.all(
                                    color: const Color(0xFF905EB6),
                                    width: 1,
                                  ),
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF7234A0), Color(0xFF502173)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                  ),
                                ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SvgPicture.asset(

                                  'assets/icons/Frame.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),


                if (isExpanded)
                  Expanded(
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "You have 3 new notifications",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "View Notifications",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),

                DoubleArrowIcon(),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),

    );
  }
}
