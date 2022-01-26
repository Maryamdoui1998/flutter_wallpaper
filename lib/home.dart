import 'package:admob/view/search_view.dart';
import 'package:admob/widgets/carosel_widget.dart';
import 'package:admob/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:admob/color.dart' as AppColor;
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController=new TextEditingController();
  @override
  void initState(){
    super.initState();
  }
  // ui of home page 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height:25),
                // app name
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Wallpaper',
                        style: TextStyle(color: Colors.orange, fontSize: 36.0, fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                        text: 'App',
                        style: TextStyle(color: AppColor.navBackground, fontSize: 24.0, fontWeight: FontWeight.bold)
                      ),
                    ]
                  )
                ),
                const SizedBox(height: 16,),
                Container(
                  height: 150,
                  child: CarouselSliderWidget(),
                ),
                const SizedBox(height: 16,),
                // ui and text field search in home screen
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),

                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: searchController ,
                          decoration:InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ) ,
                        )
                      ),
                      InkWell(
                        // code for navigation to search screen
                        onTap: (){
                          if(searchController.text !=''){
                             Navigator.push(
                               context,
                                MaterialPageRoute(builder: (context)=> SearchView(search: searchController.text))
                                );
                          }
                        },
                        child: Container(
                          child: Icon(Icons.search,),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8,),
                Text(
                  'Popular',
                  style: GoogleFonts.openSans(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                const SizedBox(height: 4,),
               SingleChildScrollView(
                 child: Container(
                   height: MediaQuery.of(context).size.height*0.6,
                   child: HomeWidget(
                     home: 'popular',
                   ),
                 ),
               )
                  
                
              ],
            )
          ),
        ),
      ),
      
    );
  }
}