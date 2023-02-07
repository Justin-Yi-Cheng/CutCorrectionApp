import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../studCourse.dart';
import '../Cut.dart';

import 'package:cut_correction/avatarIcon.dart';
import 'StudCourseCardProfile.dart';

class StudCourseCard extends StatelessWidget {
  StudCourseCard(
      {super.key, required this.studCourseInfo, required this.courseBanner});

  final studCourse studCourseInfo;
  final String courseBanner;

  bool isVisible = false;

  List<Cut> truncateCutList() {
    if (studCourseInfo.getCutList().length > 3) {
      List<Cut> truncatedList = [];
      isVisible = true;

      for (int i = 0; i < 3; i++) {
        truncatedList.add(studCourseInfo.getCutList()[i]);
      }

      return truncatedList;
    } else {
      isVisible = false;
      return studCourseInfo.getCutList();
    }
  }

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;

    double setMaskHeight() {
      if (appWidth < 730) {
        return appWidth * 0.15;
      } else if (appWidth < 940) {
        return appWidth * 0.1;
      }
      return appWidth * 0.08;
    }

    double setAvatarSize() {
      if (appWidth < 730) {
        return appWidth * 0.1;
      } else if (appWidth < 940) {
        return appWidth * 0.07;
      }
      return appWidth * 0.05;
    }

    double setContainerHeight(double initialHeight) {
      if (appWidth < 730) {
        return initialHeight;
      } else if (appWidth < 940) {
        return (initialHeight * 0.4) + (appWidth * 0.02);
      }
      return (initialHeight * 0.5) + (appWidth * 0.01);
    }

    double setTitleTextScale() {
      if (appWidth < 730) {
        return appWidth * 0.0035;
      } else if (appWidth < 940) {
        return appWidth * 0.0025;
      }
      return appWidth * 0.0015;
    }

    double setTextScale() {
      if (appWidth < 730) {
        return appWidth * 0.0015;
      } else if (appWidth < 940) {
        return appWidth * 0.001;
      }
      return appWidth * 0.0008;
    }

    double setSpacing(double initialPosition) {
      if (appWidth < 730) {
        return initialPosition + (appWidth * 0.02);
      } else if (appWidth < 940) {
        return (initialPosition * 0.6) + (appWidth * 0.02);
      }
      return (initialPosition * 0.5) + (appWidth * 0.005);
    }

    double setAvatarSpacing(double initialPosition) {
      if (appWidth < 730) {
        return initialPosition + (appWidth * 0.02);
      } else if (appWidth < 940) {
        return (initialPosition * 0.6) + (appWidth * 0.02);
      }
      return (initialPosition * 0.5) + (appWidth * 0.02);
    }

    return GestureDetector(
      child: Card(
        elevation: 8.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(
            children: [
              SizedBox(
                width: appWidth * 0.85,
                height: appHeight * 0.25,
                child: Image.asset(
                  "banner.webp",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: appWidth * 0.85,
                height: appHeight * 0.25,
                color: const Color.fromRGBO(48, 48, 48, 0.25),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: appWidth * 0.85,
                  height: setMaskHeight(),
                  color: const Color.fromRGBO(48, 48, 48, 1),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: DefaultTextStyle(
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lexend(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text(
                    studCourseInfo.getTeacherCourse(),
                    textScaleFactor: setTitleTextScale(),
                  ),
                ),
              ),
              Positioned(
                top: setSpacing(appWidth * 0.06),
                left: 10,
                child: DefaultTextStyle(
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lexend(
                    color: Colors.white,
                  ),
                  child: Text(
                    "Period ${studCourseInfo.getPeriod()}",
                    textScaleFactor: setTextScale(),
                  ),
                ),
              ),
              Positioned(
                top: setSpacing(appWidth * 0.09),
                left: 10,
                child: DefaultTextStyle(
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lexend(
                    color: Colors.white,
                  ),
                  child: Text(
                    studCourseInfo.getTeacherName(),
                    textScaleFactor: setTextScale(),
                  ),
                ),
              ),
              Positioned(
                bottom: setAvatarSpacing(appWidth * 0.09),
                right: 10,
                child: AvatarIcon(
                  image: studCourseInfo.getTeacherProfile(),
                  imageRadius: setAvatarSize(),
                ),
              ),
              Positioned(
                bottom: setSpacing(appHeight * 0.005),
                left: 10,
                child: Container(
                  width: appWidth * 0.435,
                  height: setContainerHeight(appWidth * 0.11),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: truncateCutList().length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Text(
                          "Cut: ${truncateCutList()[index].getCutDate()}",
                          style: GoogleFonts.lexend(
                            color: Colors.white,
                          ),
                          textScaleFactor: setTextScale(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Positioned(
                  bottom: appHeight * 0.01,
                  right: 10,
                  child: IntrinsicWidth(
                    child: IntrinsicHeight(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 49, 49, 1),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "+${studCourseInfo.getCutList().length - truncateCutList().length} more",
                              style: GoogleFonts.lexend(
                                color: Colors.white,
                              ),
                              textScaleFactor: setTextScale(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudCourseCardProfile(
            studCourseInfo: studCourseInfo,
          ),
        ),
      ),
    );
  }
}
