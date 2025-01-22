import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: 1.sh*0.06,
                        width: 1.sw*0.35,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF905EB6)),
                          borderRadius: BorderRadius.circular(10),
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
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6,left:6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,


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
                                    "Mohamed",
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
                                      fontSize:12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF905EB6)),
                          borderRadius: BorderRadius.circular(10),
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
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(

                            children: [
                              Column(
                                mainAxisAlignment:  MainAxisAlignment.start ,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Free Account?",
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        color: Colors.white, fontSize: 10),
                                  ),
                                  Text(
                                    "Subscribe Now",
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_drop_down_circle,color: Color(0xFFFFB215),
                              size: 13,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // width: 56,
                        // height: 56,
                        width: 1.sw*0.1,
                        height: 1.sh*0.06,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10),
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
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: Color(0xFFFFB215),
                          size: 35,
                        ),
                      ),
                    ],
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
                const SizedBox(height: 40,),
                const Icon(
                  Icons.keyboard_double_arrow_down_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
        ),

    );
  }
}
