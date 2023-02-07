/* To Do List:
 * After pressing button, disable button
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudCutCard extends StatefulWidget {
  StudCutCard({super.key, required this.cutDate, required this.cutStatus});

  final String cutDate;
  String cutStatus;

  @override
  StudCutCardPage createState() => StudCutCardPage(
        cutDate: cutDate,
        cutStatus: cutStatus,
      );
}

class StudCutCardPage extends State<StudCutCard> {
  StudCutCardPage({required this.cutDate, required this.cutStatus});

  final String cutDate;
  String cutStatus;
  Color? requestButtonColor = const Color.fromRGBO(31, 81, 255, 1);
  Color? requestTextColor = const Color.fromRGBO(255, 255, 255, 1);

  Function? setPendingRequest() {
    setState(() {
      if (requestButtonColor == const Color.fromRGBO(31, 81, 255, 1) &&
          requestTextColor == const Color.fromRGBO(255, 255, 255, 1)) {
        cutStatus = "Pending Request";
        requestButtonColor = const Color.fromRGBO(31, 81, 255, 0.5);
        requestTextColor = const Color.fromRGBO(255, 255, 255, 0.5);
        return;
      }
    });
    return null;
  }

  @override
  void initState() {
    super.initState();
    if (cutStatus == "Pending Request" ||
        cutStatus == "Request Confirmed" ||
        cutStatus == "Request Denied") {
      requestButtonColor = const Color.fromRGBO(31, 81, 255, 0.5);
      requestTextColor = const Color.fromRGBO(255, 255, 255, 0.5);
    }
  }

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
      child: Card(
        elevation: 8.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cute Date: $cutDate",
                style: GoogleFonts.lexend(
                  color: Colors.white,
                ),
                textScaleFactor: 1.25,
              ),
              Row(
                children: [
                  Text(
                    "Cut Status: $cutStatus",
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                    ),
                    textScaleFactor: 1.25,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: setPendingRequest,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        width: 95,
                        height: appHeight * 0.05,
                        color: requestButtonColor,
                        child: Center(
                          child: Text(
                            "Request",
                            style: GoogleFonts.lexend(color: requestTextColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
