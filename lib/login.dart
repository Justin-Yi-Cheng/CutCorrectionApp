/* To Do List:
 * 
 * Add ACTUAL Username / Password Functions
 * ( Future ): Create / Add Duct Tape Logo
 * ( Future ): Cycle login screen images amongst multiple images ( - )
 * ( Future ): Create 'Forgot Password' Function ( - )
 * ( Future ): Add cool animations ( - )
 * ( Future ): Make 'Wrong Password' Popout less obtrusive ( - )
 * ( Future ): Fix Wide-Screen Image Panning (Refocus the Zoom to Center Location)
 * */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cut_correction/student/StudHome.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String showOrHidePassword = "Show Password";
  bool passwordVisible = true;
  TextDecoration? showOrHideUnderline;
  TextDecoration? forgotPasswordUnderline;

  void _setPasswordVisibility() {
    setState(
      () {
        passwordVisible = !passwordVisible;

        if (showOrHidePassword == "Show Password") {
          showOrHidePassword = "Hide Password";
        } else {
          showOrHidePassword = "Show Password";
        }
      },
    );
  }

  void _setPasswordUnderlineHover(bool hover) {
    setState(
      () {
        if (hover) {
          showOrHideUnderline = TextDecoration.underline;
        } else {
          showOrHideUnderline = null;
        }
      },
    );
  }

  void _forgotPasswordHover(bool hover) {
    setState(
      () {
        if (hover) {
          forgotPasswordUnderline = TextDecoration.underline;
        } else {
          forgotPasswordUnderline = null;
        }
      },
    );
  }

  void login() {
    setState(
      () {
        if (true) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StudHome()),
          );
          return;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: IntrinsicWidth(
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Incorrect Username / Password!",
                      style: GoogleFonts.lexend(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          );
          username.clear();
          password.clear();
          return;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;

    // Depending on screen size, returns the COMPUTER login
    if (appWidth > 700) {
      return Scaffold(
        body: Stack(
          children: [
            InteractiveViewer(
              constrained: false,
              child: Image.asset("login.jpg", fit: BoxFit.fitWidth),
            ),
            Positioned(
              top: 0,
              left: appWidth * 0.02,
              child: DefaultTextStyle(
                style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                child: Text(
                  "Duct Tape",
                  textScaleFactor: appHeight * 0.003,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntrinsicWidth(
                  child: IntrinsicHeight(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(48, 48, 48, 1),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(32, 33, 36, 1),
                              offset: Offset(0.0, 1.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 5),
                                  child: DefaultTextStyle(
                                    style: GoogleFonts.lexend(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      "Stop Coming Back!",
                                      textScaleFactor: appHeight * 0.003,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 25),
                                  child: DefaultTextStyle(
                                    style: GoogleFonts.lexend(
                                      color: Colors.grey,
                                    ),
                                    child: Text(
                                      "You got cut again?",
                                      textScaleFactor: appHeight * 0.0015,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(25, 0, 0, 5),
                                child: DefaultTextStyle(
                                  style: GoogleFonts.lexend(
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    "Email",
                                    textScaleFactor: appHeight * 0.002,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 0, 25, 0),
                                child: SizedBox(
                                  width: appHeight * 0.65,
                                  child: TextField(
                                    controller: username,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 15, 0, 5),
                                child: DefaultTextStyle(
                                  style: GoogleFonts.lexend(
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    "Password",
                                    textScaleFactor: appHeight * 0.002,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 0, 25, 0),
                                child: SizedBox(
                                  width: appHeight * 0.65,
                                  child: TextField(
                                    controller: password,
                                    obscureText: passwordVisible,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                child: TextButton(
                                  onPressed: () => _setPasswordVisibility(),
                                  onHover: (bool hover) =>
                                      _setPasswordUnderlineHover(hover),
                                  child: DefaultTextStyle(
                                    style: GoogleFonts.lexend(
                                      color: Colors.grey,
                                      decoration: showOrHideUnderline,
                                    ),
                                    child: Text(
                                      showOrHidePassword,
                                      textScaleFactor: appHeight * 0.0018,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      login();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: const Color.fromRGBO(
                                          255, 241, 0, 0.9),
                                      fixedSize:
                                          Size.fromWidth(appHeight * 0.65),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Text(
                                        'Login',
                                        style: GoogleFonts.lexend(),
                                        textScaleFactor: appHeight * 0.0023,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 0, 25, 30),
                                child: TextButton(
                                  onPressed: () => null,
                                  onHover: (bool hover) =>
                                      _forgotPasswordHover(hover),
                                  child: DefaultTextStyle(
                                    style: GoogleFonts.lexend(
                                      color: const Color.fromRGBO(
                                          255, 241, 0, 0.9),
                                      decoration: forgotPasswordUnderline,
                                    ),
                                    child: Text(
                                      "Forgot Password?",
                                      textScaleFactor: appHeight * 0.0018,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
      );
    }
    // Depending on screen size, returns MOBILE login
    else {
      return Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "login.jpg",
              fit: BoxFit.contain,
            ),
            Positioned(
              top: 0,
              left: appWidth * 0.02,
              child: DefaultTextStyle(
                style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                child: Text(
                  "Duct Tape",
                  textScaleFactor: appWidth * 0.0025,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: appHeight * 0.5,
                width: appWidth,
                color: const Color.fromRGBO(32, 33, 36, 1),
              ),
            ),
            Center(
              child: IntrinsicHeight(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: appWidth * 0.75,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(48, 48, 48, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(32, 33, 36, 1),
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: DefaultTextStyle(
                                style: GoogleFonts.lexend(
                                  color: Colors.white,
                                ),
                                child: Text(
                                  "Stop Coming Back!",
                                  textScaleFactor: appWidth * 0.003,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                              child: DefaultTextStyle(
                                style: GoogleFonts.lexend(
                                  color: Colors.grey,
                                ),
                                child: Text(
                                  "You got cut again?",
                                  textScaleFactor: appWidth * 0.0015,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 0, 5),
                            child: DefaultTextStyle(
                              style: GoogleFonts.lexend(
                                color: Colors.white,
                              ),
                              child: Text(
                                "Email",
                                textScaleFactor: appWidth * 0.002,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: SizedBox(
                              width: appWidth * 0.6,
                              child: TextField(
                                controller: username,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 15, 0, 5),
                            child: DefaultTextStyle(
                              style: GoogleFonts.lexend(
                                color: Colors.white,
                              ),
                              child: Text(
                                "Password",
                                textScaleFactor: appWidth * 0.002,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: SizedBox(
                              width: appWidth * 0.6,
                              child: TextField(
                                controller: password,
                                obscureText: passwordVisible,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: TextButton(
                              onPressed: () => _setPasswordVisibility(),
                              onHover: (bool hover) =>
                                  _setPasswordUnderlineHover(hover),
                              child: DefaultTextStyle(
                                style: GoogleFonts.lexend(
                                  color: Colors.grey,
                                  decoration: showOrHideUnderline,
                                ),
                                child: Text(
                                  showOrHidePassword,
                                  textScaleFactor: appWidth * 0.0015,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  login();
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      const Color.fromRGBO(255, 241, 0, 0.9),
                                  fixedSize: Size.fromWidth(appWidth * 0.6),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.lexend(),
                                    textScaleFactor: appWidth * 0.0025,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                            child: TextButton(
                              onPressed: () => null,
                              onHover: (bool hover) =>
                                  _forgotPasswordHover(hover),
                              child: DefaultTextStyle(
                                style: GoogleFonts.lexend(
                                  color: const Color.fromRGBO(255, 241, 0, 0.9),
                                  decoration: forgotPasswordUnderline,
                                ),
                                child: Text(
                                  "Forgot Password?",
                                  textScaleFactor: appWidth * 0.0015,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
