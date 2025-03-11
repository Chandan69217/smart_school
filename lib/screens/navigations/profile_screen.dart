import 'package:flutter/material.dart';
import 'package:smart_school/utilities/cust_colors.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double stackHeight = screenHeight * 0.3;
    return CustomPaint(
      painter: ProfileCustomPaint(),
      child: Container(
        child: Column(
          children: [
            // Profile Header
            SizedBox(
              height: stackHeight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Person Name & Details Container
                  Positioned(
                    top: (stackHeight * 0.65)/2,
                    right: stackHeight * 0.01,
                    left: stackHeight * 0.01,
                    child: Container(
                      height: stackHeight * 0.65,
                      margin: EdgeInsets.symmetric(horizontal: stackHeight * 0.06),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0,
                            spreadRadius: 2.0
                          )
                        ]
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: stackHeight * 0.2,),
                          Text(
                            "Chandan Sharma",
                            style: TextStyle(fontSize: stackHeight * 0.07, fontWeight: FontWeight.bold),
                          ),
                          Text("STD - X(a)", style: TextStyle(color: Colors.grey[700],fontSize: stackHeight * 0.05)),

                          // Description
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal:  stackHeight * 0.08,vertical:stackHeight * 0.04 ),
                            child: Text(
                              "Lorem Ipsum is simple text of the standard dummy text to fill the content",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey[600],fontSize: stackHeight * 0.05),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: stackHeight * 0.252/8,
                    left: screenWidth / 2 - stackHeight * 0.252,
                    child: CircleAvatar(
                      radius: stackHeight * 0.252,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: stackHeight * 0.245,
                        backgroundImage: NetworkImage(
                          "https://storage.googleapis.com/a1aa/image/w2pGFTnJt3Cq_DbnueI4J-w6JcfntvviUGLumv0gZgg.jpg",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Student Details Section
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 10),
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Student Details",
                    style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  _buildDetailRow("Date of Birth", "30/09/2004"),
                  _buildDetailRow("Class", "10/A"),
                  _buildDetailRow("Roll Number", "04"),
                  _buildDetailRow("Phone Number", "9874567653"),
                  _buildDetailRow("Father Name", "Mohan"),
                  _buildDetailRow("Address", "89/2, T-Nagar, Chennai-006321"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.black87,fontSize: screenWidth * 0.035)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenWidth * 0.035)),
        ],
      ),
    );
  }

}

class ProfileCustomPaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = CustColor.primary;
    final rect = Rect.fromPoints(Offset(0,0), Offset(size.width,size.width * 0.45));
    final rrect = RRect.fromRectAndCorners(rect,bottomLeft: Radius.circular(size.width * 0.12),bottomRight: Radius.circular(size.width * 0.12));
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return false;
  }

}