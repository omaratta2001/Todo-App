import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todoapp1/view/HomeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo',
        theme: ThemeData(
          textTheme: GoogleFonts.akronimTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(nextScreen: HomeScreen(),
          backgroundColor: Colors.black,
          duration: 4000,
          splash: Image.asset("assets/images/net.gif",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,),
          splashIconSize: double.infinity,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.topToBottom,
        )
    );
  }
}

