import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_school/screens/navigations/attendance_screen.dart';
import 'package:smart_school/screens/navigations/home_screen.dart';
import 'package:smart_school/screens/navigations/profile_screen.dart';
import 'package:smart_school/utilities/cust_colors.dart';
import 'package:smart_school/widgets/custom_navigation_bar.dart';


class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  List<Widget> _screen = [HomeScreen(),AttendanceScreen(),ProfileScreen()];
  List<String> _titles = ['SMART SCHOOL','ATTENDANCE','PROFILE'];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
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
      body: SizedBox(
        height: screenHeight,
        child: Stack(
            children: [
          LayoutBuilder(
            builder:(context,constraints) => SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0,0, 0, screenHeight * 0.11,),
                child: _screen[_selectedIndex],
              ),
            ),
          ),
          Positioned(
              bottom: screenHeight * 0.01,
              left: screenHeight * 0.03,
              right: screenHeight * 0.03,
              child: CustomBottomNavBar(
                onTap: (selectedIndex) {
                  setState(() {
                    _selectedIndex = selectedIndex!;
                  });
                },
              ))
        ]),
      ),
      drawer: _drawerUI(),
    );
  }

  Widget _drawerUI(){
    double screenWidth = MediaQuery.of(context).size.width * 0.7;
    double screenHeight = MediaQuery.of(context).size.height;
    return Drawer(
      width: screenWidth,
      backgroundColor: CustColor.primary,
      child:  SafeArea(
        child: Container(
          height: double.infinity,
          color: CustColor.primary,
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03,horizontal: screenWidth * 0.08),
          child: Column(
            children: [
              // Profile Section
              Row(
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.12,
                    backgroundImage: NetworkImage(
                        "https://storage.googleapis.com/a1aa/image/w2pGFTnJt3Cq_DbnueI4J-w6JcfntvviUGLumv0gZgg.jpg",),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chandan Sharma",
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2,),
                        Text(
                          "View Profile",
                          style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20),

              // Menu Items
              Expanded(
                child: ListView(
                  children: [
                    SidebarItem(icon: FontAwesomeIcons.home, title: "Home"),
                    SidebarItem(
                        icon: FontAwesomeIcons.questionCircle, title: "Daily Quiz"),
                    SidebarItem(
                        icon: FontAwesomeIcons.userPlus, title: "Add Account"),
                    SidebarItem(
                        icon: FontAwesomeIcons.exchangeAlt, title: "Switch Account"),
                    SidebarItem(
                        icon: FontAwesomeIcons.user, title: "Teacher Profile"),
                    SidebarItem(
                        icon: FontAwesomeIcons.creditCard, title: "Payment History"),
                  ],
                ),
              ),
              Spacer(),
              Divider(color: Colors.white70, thickness: 0.5),
              SidebarItem(icon: FontAwesomeIcons.cog, title: "Settings"),
              SidebarItem(
                  icon: FontAwesomeIcons.questionCircle, title: "Help Center"),
            ],
          ),
        ),
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;

  SidebarItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric( vertical: screenWidth * 0.02),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: screenWidth * 0.05),
          SizedBox(width: 10),
          Text(title, style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white)),
        ],
      ),
    );
  }
}
