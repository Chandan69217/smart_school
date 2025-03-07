import 'package:flutter/material.dart';

import '../utilities/cust_colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  final Function(int? selectedIndex) onTap;
  CustomBottomNavBar({required this.onTap});
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _navItems = [
    {"icon": 'assets/icons/home_regular_icon.webp', "label": "Home"},
    {"icon": 'assets/icons/calendar_ltr_regular_icon.webp', "label": "Attendance"},
    {"icon": 'assets/icons/person_regular_icon.webp', "label": "Profile"},
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0,),
      height: width * 0.18,
      decoration: BoxDecoration(
        color: CustColor.primary,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _navItems.map((item) {
          int index = _navItems.indexOf(item);
          bool isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
                widget.onTap(_selectedIndex);
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              padding: isSelected
                  ? EdgeInsets.symmetric(horizontal: 8, vertical: 8)
                  : EdgeInsets.zero,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white12 : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    item["icon"],
                    color: Colors.white,
                    width: width * 0.07,
                    height: width * 0.07,
                    fit: BoxFit.contain,
                  ),
                  if (isSelected)
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        item["label"],
                        style: TextStyle(color: Colors.white, fontSize: width * 0.04),
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
