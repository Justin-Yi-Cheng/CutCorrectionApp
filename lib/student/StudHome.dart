/* To-Do List:
 * ( Future ): Allow users to edit banners based on a given selection (like Google Classroom)
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Cut.dart';
import '../cutCorrection_db.dart';

import 'studCourseCard.dart';
import '../studCourse.dart';
import 'package:cut_correction/avatarIcon.dart';

//Temporary Data
List<studCourse> studCourses = [
  studCourse(
    teacherProfile: "Default.jpg",
    teacherName: "HAHA",
    teacherCourse: "HAHA",
    period: 0,
    cutList: [
      Cut(
        cutDate: "January 1st, 2023",
        cutStatus: "Detention Served",
      ),
      Cut(
        cutDate: "January 1st, 2023",
        cutStatus: "Late Detention",
      ),
      Cut(
        cutDate: "January 1st, 2023",
        cutStatus: "Pending Request",
      ),
      Cut(
        cutDate: "January 1st, 2023",
        cutStatus: "Request Confirmed",
      ),
      Cut(
        cutDate: "January 1st, 2023",
        cutStatus: "Request Denied",
      ),
    ],
  ),
  studCourse(
    teacherProfile: "Default.jpg",
    teacherName: "HAHA",
    teacherCourse: "HAHA",
    period: 0,
    cutList: [],
  ),
  studCourse(
    teacherProfile: "Default.jpg",
    teacherName: "HAHA",
    teacherCourse: "HAHA",
    period: 0,
    cutList: [],
  ),
];

class StudHome extends StatefulWidget {
  const StudHome({super.key});

  @override
  StudHomePage createState() => StudHomePage();
}

class StudHomePage extends State<StudHome> {
  var db = Dbhelper();
  bool profileIsHovered = false;

  @override
  void initState() {
    super.initState();
    db.initDb();
  }

  void isProfileHover(bool isHovered) {
    setState(() {
      profileIsHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;

    int setCrossAxisCount() {
      if (appWidth < 730) {
        return 2;
      } else if (appWidth < 940) {
        return 3;
      }
      return 4;
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 33, 36, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: appWidth,
              height: appHeight * 0.45,
              color: Colors.transparent,
              child: Stack(
                children: [
                  // Banner
                  Positioned(
                    top: appHeight * 0.05,
                    left: appWidth * 0.02,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: SizedBox(
                        width: appWidth * 0.94,
                        height: appHeight * 0.3,
                        child: Image.asset(
                          "banner.webp",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: appHeight * 0.05,
                    left: appWidth * 0.02,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        width: appWidth * 0.94,
                        height: appHeight * 0.3,
                        color: const Color.fromRGBO(48, 48, 48, 0.25),
                      ),
                    ),
                  ),
                  Positioned(
                    top: appHeight * 0.07,
                    left: appWidth * 0.08,
                    child: DefaultTextStyle(
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text(
                        "Name (Student)",
                        textScaleFactor: appHeight * 0.004,
                      ),
                    ),
                  ),
                  Positioned(
                    top: appHeight * 0.14,
                    left: appWidth * 0.08,
                    child: DefaultTextStyle(
                      style: GoogleFonts.lexend(color: Colors.white),
                      child: Text(
                        "Email",
                        textScaleFactor: appHeight * 0.003,
                      ),
                    ),
                  ),
                  Positioned(
                    top: appHeight * 0.20,
                    left: appWidth * 0.08,
                    child: DefaultTextStyle(
                      style: GoogleFonts.lexend(color: Colors.white),
                      child: Text(
                        "Osis",
                        textScaleFactor: appHeight * 0.003,
                      ),
                    ),
                  ),
                  Positioned(
                    top: appHeight * 0.26,
                    left: appWidth * 0.08,
                    child: DefaultTextStyle(
                      style: GoogleFonts.lexend(color: Colors.white),
                      child: Text(
                        "Total Cuts",
                        textScaleFactor: appHeight * 0.003,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: appWidth * 0.07,
                    child: Container(
                      height: appHeight * 0.3,
                      width: appHeight * 0.3,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(32, 33, 36, 1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 15 + appWidth * 0.07,
                    child: AvatarIcon(
                      image: "Default.jpg",
                      imageRadius: appHeight * 0.25,
                    ),
                  ),

                  // On-Hover, allow edits to banner
                  Positioned(
                    bottom: 15,
                    right: 15 + appWidth * 0.07,
                    child: MouseRegion(
                      onEnter: (event) => isProfileHover(true),
                      onExit: (event) => isProfileHover(false),
                      child: AnimatedOpacity(
                        opacity: profileIsHovered ? 0.65 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: GestureDetector(
                          child: Container(
                            height: appHeight * 0.25,
                            width: appHeight * 0.25,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(48, 48, 48, 0.85),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: DefaultTextStyle(
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lexend(color: Colors.white),
                                child: const Text(
                                  "Edit Profile / Banner",
                                  textScaleFactor: 1.25,
                                ),
                              ),
                            ),
                          ),
                          onTap: () => null,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: appHeight * 0.36,
                    left: appWidth * 0.03,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          width: 95,
                          height: appHeight * 0.05,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 241, 0, 0.9),
                          ),
                          child: Center(
                            child: Text(
                              "Logout",
                              style: GoogleFonts.lexend(
                                color: Colors.white,
                              ),
                              textScaleFactor: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
              child: DefaultTextStyle(
                textAlign: TextAlign.start,
                style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                child: const Text(
                  "All Courses",
                  textScaleFactor: 1.75,
                ),
              ),
            ),
            Container(
              height: appHeight * 0.005,
              width: appHeight * 0.10,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10.0),
              scrollDirection: Axis.vertical,
              itemCount: studCourses.length,
              itemBuilder: (BuildContext context, int index) {
                return StudCourseCard(
                  studCourseInfo: studCourses[index],
                  courseBanner: "banner.webp",
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: setCrossAxisCount(),
                crossAxisSpacing: appWidth * 0.01,
                childAspectRatio: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
