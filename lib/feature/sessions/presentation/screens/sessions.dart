import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/session_provider.dart';
import '../widges/sessions_details.dart';
import '../widges/tabItem.dart';
import '../widges/notification_widget.dart';


class SessionsScreen extends ConsumerWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionController = ref.watch(sessionControllerProvider);

    return Scaffold(
      body: Column(

        children: [
          const ExpandableNotificationWidget(),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(

              textAlign: TextAlign.center,


              'My sessions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                height: 27.28 / 20,
                color: Color(0xFF362E3C),

              ),
            ),
          ),
          // Tabs
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabItem(
                  label: "Ongoing",
                  isSelected: sessionController.selectedTab == "Ongoing",
                  onTap: () {
                    sessionController.setTab("Ongoing");
                  },
                ),
                TabItem(
                  label: "History",
                  isSelected: sessionController.selectedTab == "History",
                  onTap: () {
                    sessionController.setTab("History");
                  },
                ),
              ],
            ),
          ),
      const Divider(
            height: 1,
            color: Color(0xFFD3B8EE), // لون الخط
            thickness: 1, // سمك الخط

          ),



          Expanded(
            child: sessionController.isLoading
                ? const Center(child: CircularProgressIndicator())
                : sessionController.errorMessage != null
                ? Center(child: Text(sessionController.errorMessage!))
                //: sessionController.sessions.isEmpty
                : sessionController.filteredSessions.isEmpty
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/Group 7.svg',
                  width: 1.sw * 0.5,
                  height: 1.sh * 0.3,
                ),
                const Text(
                  'No sessions',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const Text(
                  'Looks like there arent any sessions \n scheduled yet!',
                  style: TextStyle(
                      color: Color(0xFF777777),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ],
            )
                : ListView.builder(
              itemCount: sessionController.filteredSessions.length,
              itemBuilder: (context, index) {
                final session = sessionController.filteredSessions[index];
                return SessionsDetails(
                  name: session.name,
                  date: session.date,
                  duration: session.duration,
                  status: session.status,
                );
              },
            ),
          ),

          // Expanded(
          //   child: sessionController.isLoading
          //       ? const Center(child: CircularProgressIndicator())
          //       : sessionController.errorMessage != null
          //       ? Center(child: Text(sessionController.errorMessage!))
          //       : sessionController.filteredSessions.isEmpty
          //       ? Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //        crossAxisAlignment: CrossAxisAlignment.center,
          //        children: [
          //       SvgPicture.asset(
          //         'assets/images/Group 7.svg',
          //         width: 1.sw * 0.5,
          //         height: 1.sh * 0.3,
          //       ),
          //       const Text('No sessions' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
          //       const Text('Looks like there arent any sessions \n scheduled yet!' ,style: TextStyle(
          //           color: Color(0xFF777777),
          //
          //           fontWeight: FontWeight.bold,fontSize: 14),),
          //     ],
          //   )
          //       : ListView.builder(
          //     itemCount: sessionController.filteredSessions.length,
          //     itemBuilder: (context, index) {
          //       final session =
          //       sessionController.filteredSessions[index];
          //       return SessionsDetails(
          //         name: session.name,
          //         date: session.date,
          //         duration: session.duration,
          //         status: session.status,
          //       );
          //     },
          //   ),
          // ),

        ],
      ),
    );
  }
}
