import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../studCourse.dart';

import 'package:cut_correction/avatarIcon.dart';
import 'studCutCard.dart';

class StudCourseCardProfile extends StatefulWidget {
  final studCourse studCourseInfo;

  const StudCourseCardProfile({super.key, required this.studCourseInfo});

  @override
  State<StudCourseCardProfile> createState() => _StudCourseCardProfile(
        studCourseInfo: studCourseInfo,
      );
}

class _StudCourseCardProfile extends State<StudCourseCardProfile> {
  final studCourse studCourseInfo;

  _StudCourseCardProfile({required this.studCourseInfo});

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 33, 36, 1),
      appBar: AppBar(),
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
                  // Teacher's Selected Banner
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
                        studCourseInfo.getTeacherCourse(),
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
                        "Period ${studCourseInfo.getPeriod()}",
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
                        studCourseInfo.getTeacherName(),
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
                        "${studCourseInfo.getCutList().length} Total Cuts",
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
                  // Teacher Profile Picture
                  Positioned(
                    bottom: 15,
                    right: 15 + appWidth * 0.07,
                    child: AvatarIcon(
                      image: "Default.jpg",
                      imageRadius: appHeight * 0.25,
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
                  "All Cuts",
                  textScaleFactor: 2.5,
                ),
              ),
            ),
            Container(
              height: appHeight * 0.005,
              width: appHeight * 0.05,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10.0),
              scrollDirection: Axis.vertical,
              itemCount: studCourseInfo.getCutList().length,
              itemBuilder: (BuildContext context, int index) {
                return StudCutCard(
                  cutDate: studCourseInfo.getCutList()[index].getCutDate(),
                  cutStatus: studCourseInfo.getCutList()[index].getCutStatus(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
