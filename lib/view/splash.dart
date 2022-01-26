import 'dart:async';
import 'package:admob/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    // control time of splash screen
    Timer(
     Duration(seconds: 3),
     //code of navigation to navigation bar
     ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavBar()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors:  [Color(0xFFFF800B),Color(0xFFCE1010),]
          )
        ),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            //ui for splash screen 
            Column(
              children: [
                Container(
                  color: Colors.white30,
                  //height: 683,
                  //width: 450,
                  child: const Text(
                    'Wallpaper App',
                    style: TextStyle(color: Colors.white,fontSize: 53.0,fontWeight: FontWeight.bold),
                  ),
                  
                ),
              ],
            ),
            const CircularProgressIndicator(
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.orange),
            )
          ],
        ),
      ),
    );
  }
}