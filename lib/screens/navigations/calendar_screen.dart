import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/cust_colors.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double availableHeight = screenHeight - kToolbarHeight - 100;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
            controller: tabController,
            labelStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: screenWidth * 0.035,
                color: CustColor.primary),
            indicatorColor: CustColor.primary,
            dividerHeight: 0,
            labelColor: CustColor.primary,
            labelPadding: EdgeInsets.symmetric(vertical: 6.0),
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: screenWidth * 0.035,
                color: Colors.grey),
            tabs: <Widget>[
              Text(
                'Attendances',
              ),
              Text('Time Tables'),
              Text('Events')
            ]),
        SizedBox(
          height: availableHeight,
          child: TabBarView(
              controller: tabController,
              children: [
                AttendanceScreen(),
                AttendanceScreen(),
                AttendanceScreen()
              ]),
        )
      ],
    );
  }
}

class AttendanceScreen extends StatefulWidget {
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> with SingleTickerProviderStateMixin{
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double availableHeight = screenHeight - kToolbarHeight - 100;
    return Column(
      children: [
        // Attendance Summary
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Container(
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _summaryItem("98", "Overall Present"),
                _summaryItem("24", "Overall Absent"),
              ],
            ),
          ),
        ),
        // Total Working Days
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Container(
            padding: EdgeInsets.all(screenHeight * 0.015),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Total working days 122",
                style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.045),
              ),
            ),
          ),
        ),
        // Calendar Section
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Container(
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Calendar",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Image.network(
                  "https://storage.googleapis.com/a1aa/image/GJBVUtSQykwewFGq-HvrENplB1dvgxXf86EoEtFXX8Q.jpg",
                  width: screenWidth * 0.3,
                  height: screenWidth * 0.3,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text("Overall Attendance", style: TextStyle(fontSize: screenWidth * 0.045)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabItem(String text, {bool isActive = false}) {
    return Text(
      text,
      style: TextStyle(
        color: isActive ? Colors.blue : Colors.black,
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        decoration: isActive ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }




  Widget _buildSummaryItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(label),
      ],
    );
  }

  Widget _summaryItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.black54)),
      ],
    );
  }

}







