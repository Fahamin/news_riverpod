import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:d_view/d_view.dart';
import 'package:google_fonts/google_fonts.dart';
import '../route/routes.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Get.offNamed(Routes.homePage);
    });

    final height = MediaQuery.sizeOf(context).height * 1 ;
    final width = MediaQuery.sizeOf(context).width * 1 ;

    return  Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/splash_pic.jpg',
              fit: BoxFit.cover,
              height:  height * .5,
            ),
            SizedBox(height: height * 0.04,),
            Text('TOP HEADLINES' ,
              style: GoogleFonts.anton(
                  letterSpacing: .6 ,
                  color: Colors.grey.shade700),),
            SizedBox(height: height * 0.04,),
            SpinKitChasingDots(
              color: Colors.blue ,
              size: 40,
            )

          ],
        ),
      ),
    );
  }
}