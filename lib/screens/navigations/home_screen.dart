import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utilities/cust_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;
  List<Map<String, dynamic>> menuItems = [
    {"title": "Attendance", "icon": "assets/icons/calendar_sharp_icon.webp"},
    {"title": "Home Works", "icon": "assets/icons/book_sharp_icon.webp"},
    {
      "title": "Assignment",
      "icon": "assets/icons/document_attach_sharp_icon.webp"
    },
    {"title": "Exams List", "icon": "assets/icons/school_sharp_cap_icon.webp"},
    {"title": "Events", "icon": "assets/icons/trophy_sharp_icon.webp"},
    {"title": "Result", "icon": "assets/icons/podium_sharp_icon.webp"},
    {"title": "Classes", "icon": "assets/icons/easel_sharp_icon.webp"},
  ];
  final List<Map<String, String>> upcomingEvents = [
    {
      "name": "Science Fair",
      "imageUrl":
          "https://img.freepik.com/free-vector/school-kids-doing-chemistry-experiment-classroom_1308-61829.jpg?t=st=1741344697~exp=1741348297~hmac=f6e36c94465d0f7d315d932c203f4718a59fbf3a9d05f6609ec90f5f6b5a9f8c&w=1800"
    },
    {
      "name": "Sports Day",
      "imageUrl":
          "https://img.freepik.com/free-vector/flat-national-sports-day-illustration_23-2149004633.jpg?t=st=1741344812~exp=1741348412~hmac=435c469accfe000235808ba6ae506eb122b2dcddff29c57a43df3f331c87137b&w=1060"
    },
    {
      "name": "Music Concert",
      "imageUrl":
          "https://img.freepik.com/free-photo/dancing-concert-while-singer-is-performing-surrounded-with-lights_181624-9688.jpg?t=st=1741344862~exp=1741348462~hmac=d074e9e8895d242f42b37e800713f174a09122692937b1cc28148b9962b2c430&w=1800"
    },
    {
      "name": "Art Exhibition",
      "imageUrl":
          "https://img.freepik.com/free-vector/watercolor-art-exhibition-event-landing-page-template_23-2149487941.jpg?t=st=1741344906~exp=1741348506~hmac=0682c952b012ffb5186c3d5283f7da52ddd43649514c1a3b351e36598f84b9a1&w=1800"
    },
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    int crossAxisCount = screenWidth > 600 ? 4 : 3;
    int visibleItems = crossAxisCount;
    return Padding(
      padding: EdgeInsets.fromLTRB(screenWidth * 0.05,screenWidth * 0.05,screenWidth * 0.05,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Punch-IN or Punch-OUT Section
          _buildCard(),
          SizedBox(height: 20),
          Text(
            "Academics",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          // Academics Section
          Column(children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              height: isExpanded
                  ? (menuItems.length / crossAxisCount).ceil() *
                      screenHeight *
                      0.15
                  : screenHeight * 0.15, // Adjust height dynamically
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 1,
                ),
                itemCount: isExpanded ? menuItems.length : visibleItems,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print("Selected: ${menuItems[index]['title']}");
                    },
                    child: _buildMenuIcons(
                        iconPath: menuItems[index]['icon'],
                        label: menuItems[index]['title']),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Container(
                width: 110.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                // padding: const EdgeInsets.only(top: 10),
                child: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: screenWidth * 0.08,
                  color: CustColor.primary,
                ),
              ),
            ),
          ]),
          SizedBox(height: 20),

          //Upcoming Events

          Text(
            'Upcoming Events',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: screenHeight * 0.2,
            child: PageView.builder(
              itemCount: upcomingEvents.length,
              scrollDirection: Axis.horizontal,
              padEnds: false,
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (context, index) {
                return _buildEventCard(
                  upcomingEvents[index]["name"]!,
                  upcomingEvents[index]["imageUrl"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuIcons({required String iconPath, required String label}) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath,
              width: screenWidth * 0.09,
              height: screenWidth * 0.09,
              color: CustColor.secondary),
          SizedBox(height: 8),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildEventCard(String name, String imageUrl) {
    double cardHeight = MediaQuery.of(context).size.height * 0.2;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              width: double.infinity,
              height: cardHeight,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: cardHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: cardHeight * 0.04,
              left: cardHeight * 0.04,
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: cardHeight * 0.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenWidth * 0.03),
      decoration: BoxDecoration(
        color: CustColor.primary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: screenWidth * 0.09,
            backgroundImage: NetworkImage(
                "https://storage.googleapis.com/a1aa/image/w2pGFTnJt3Cq_DbnueI4J-w6JcfntvviUGLumv0gZgg.jpg"),
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Chandan Sharma",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: screenWidth * 0.038,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2,
                                      color: Colors.white,
                                    )),
                        Text(
                          "5th grade | AE156478955",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: screenWidth * 0.032,
                                  color: Colors.white70,
                                  height: 1.2),
                        ),
                        Text(
                          "Dayscholar",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: screenWidth * 0.032,
                                  color: Colors.white70,
                                  height: 1.2),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          "In: 08:23 AM, 07-Mar-25",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: screenWidth * 0.032,
                                  color: Colors.white70,
                                  height: 1.2),
                        ),
                        Text(
                          "Out: N/A",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: screenWidth * 0.032,
                                  color: Colors.white70,
                                  height: 1.2),
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(50),
                        radius: 50.0,
                        child: Image.asset(
                          'assets/icons/exit_out_close_icon.webp',
                          width: screenWidth * 0.06,
                          height: screenWidth * 0.06,
                          color: Colors.white,
                          fit: BoxFit.contain,
                        ))
                  ],
                ),
                SizedBox(height: screenHeight * 0.012),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: screenWidth * 0.09,
                      width: screenWidth * 0.18,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 0,
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: (screenWidth * 0.09) * 0.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: (screenWidth * 0.09) * 0.04,
                              vertical: (screenWidth * 0.09) * 0.008),
                        ),
                        onPressed: () {},
                        child:
                            Text("In", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    SizedBox(
                      height: screenWidth * 0.09,
                      width: screenWidth * 0.18,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          elevation: 0,
                          disabledBackgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: (screenWidth * 0.09) * 0.4),
                          padding: EdgeInsets.symmetric(
                              horizontal: (screenWidth * 0.09) * 0.04,
                              vertical: (screenWidth * 0.09) * 0.008),
                        ),
                        onPressed: null,
                        child:
                            Text("Out", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
