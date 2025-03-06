import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Profile Section
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://storage.googleapis.com/a1aa/image/V8zgxnQS4gzqVgOc8vGI11Sw6-464zsG7ir0ICfvR5M.jpg"),
                radius: 25,
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Surya",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Class XI-B | Roll no: 04",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 5),
                    LinearProgressIndicator(
                      value: 0.8,
                      backgroundColor: Colors.white,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        // Academics Section
        Text("Academics",
            style:
            TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     _buildAcademicItem(Icons.person, "Attendance"),
        //     _buildAcademicItem(Icons.money, "Fees"),
        //     _buildAcademicItem(Icons.question_mark, "Ask Doubt"),
        //     _buildAcademicItem(Icons.map, "Live Tracking"),
        //   ],
        // ),
        SizedBox(height: 20),
        // Updates Section
        _buildSection(
            "Updates",
            "https://storage.googleapis.com/a1aa/image/DAf8meCZscl-Oks4eHveO6-1bHP6M0qAdH_M3q6Eo98.jpg",
            "Live location"),
        SizedBox(height: 20),
        // Events Section
        _buildSection(
            "Upcoming Events",
            "https://storage.googleapis.com/a1aa/image/5zcus5ED9TTCwlfEWMmyCe9hgE_XMxKOg2BEqqnAp40.jpg",
            "Cycling Event"),
      ],
    );
  }

  Widget _buildAcademicItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blue),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildSection(String title, String imageUrl, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(imageUrl,
              width: double.infinity, height: 150, fit: BoxFit.cover),
        ),
        SizedBox(height: 5),
        Text(description, style: TextStyle(fontSize: 14)),
      ],
    );
  }

}