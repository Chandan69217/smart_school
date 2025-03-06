import 'package:flutter/material.dart';
import 'package:smart_school/screens/navigations/home_screen.dart';
import 'package:smart_school/utilities/cust_colors.dart';
import 'package:smart_school/widgets/custom_navigation_bar.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("SMART SCHOOL"),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Colors.white),
        backgroundColor: CustColor.primary,
        centerTitle: true,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/icons/horizontal_line_icon.webp',
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            radius: 50.0,
            borderRadius: BorderRadius.circular(50.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/icons/bell_icon.webp',
                    width: 25.0,
                    height: 25.0,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 22,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: const Text("3",
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
      body: Stack(children: [
        LayoutBuilder(
          builder:(context,constraints) => SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05, screenWidth * 0.05, screenWidth * 0.05, 80,),
              child: HomeScreen(),
            ),
          ),
        ),
        Positioned(
            bottom: 5,
            left: screenHeight * 0.03,
            right: screenHeight * 0.03,
            child: CustomBottomNavBar(
              onTap: (selectedIndex) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only( left: 20, right: 20,bottom: 80),
                    duration: Duration(milliseconds: 50),
                    content: Center(
                      child: Text('Selected index : $selectedIndex'),
                    )));
              },
            ))
      ]),
      drawer: _drawerUI(),
    );
  }

  Widget _drawerUI(){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Drawer(
      width: screenWidth * 0.8,
    );
  }
}
