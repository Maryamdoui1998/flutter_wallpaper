import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:admob/color.dart' as AppColor;
import 'package:google_fonts/google_fonts.dart';
import 'trending.dart';
import 'category.dart';
import 'settings.dart';
import 'package:admob/home.dart';


class NavBar extends StatefulWidget {

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex;
  @override
  void initState(){
    super.initState();
    currentIndex=0;
  }
  void changePage(int index){
    setState(() {
      currentIndex=index;
    });
  }
  // name of screens that show in navigation bar for each tab
  var screens =[Home(),Category(),Trending(),Settings()];
  int selectTab =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: AppColor.navBackground,
        opacity: 0.2,
        currentIndex: currentIndex,
        onTap: changePage,

        // ui navigation bar for all screens [home,category,trend,setting]
        items: <BubbleBottomBarItem>[
          // ui for screeen home for icons,text and color
          BubbleBottomBarItem(
            backgroundColor: AppColor.backBeubble,
            icon: const Icon(
              Icons.home,
              color:Colors.black,
            ),
            activeIcon: const Icon(
              Icons.home,
              color:Colors.white,
            ),
            title: Text(
              'home',
              style: GoogleFonts.poppins(color:Colors.white)
          )
          ),
          // ui for screen category for icon,text,color
          BubbleBottomBarItem(
            backgroundColor: AppColor.backBeubble,
            icon: const Icon(
              Icons.category,
              color:Colors.black,
            ),
            activeIcon: const Icon(
              Icons.category,
              color:Colors.white,
            ),
            title: Text(
              'category',
              style: GoogleFonts.poppins(color:Colors.white)
          )
          ),
          // ui for trend screen icon, text,color 
          BubbleBottomBarItem(
            backgroundColor: AppColor.backBeubble,
            icon: const Icon(
              Icons.trending_up,
              color:Colors.black,
            ),
            activeIcon: const Icon(
              Icons.trending_up,
              color:Colors.white,
            ),
            title: Text(
              'trending',
              style: GoogleFonts.poppins(color:Colors.white)
          )
          ),
          // ui for setting screen text icon color
          BubbleBottomBarItem(
            backgroundColor: AppColor.backBeubble,
            icon: const Icon(
              Icons.settings,
              color:Colors.black,
            ),
            activeIcon: const Icon(
              Icons.settings,
              color:Colors.white,
            ),
            title: Text(
              'settings',
              style: GoogleFonts.poppins(color:Colors.white)
          )
          ),
        ],
    
      ),
      body: screens[currentIndex],
    );
  }
}