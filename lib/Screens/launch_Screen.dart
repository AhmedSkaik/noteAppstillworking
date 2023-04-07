import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainingproj/sharedprefrancess/shared_controller.dart';
  class LaunchSreen extends StatefulWidget {
    const LaunchSreen({Key? key}) : super(key: key);



    @override
    State<LaunchSreen> createState() => _LaunchSreenState();
  }

  class _LaunchSreenState extends State<LaunchSreen> {
    @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      String route = SharedPrefController().loggedIn ? '/homeScreen' : '/loginScreen';
     Navigator.pushReplacementNamed(context, '/loginScreen') ;

    });
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration : const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topEnd,
              end:AlignmentDirectional.bottomStart,
              colors: [
                Colors.blue,
                Colors.pink
              ]
            ),
          ),
          child: Text("flutter App" , style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),),
        ),
      );
    }
  }
