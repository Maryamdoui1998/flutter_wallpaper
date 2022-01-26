import 'package:admob/data/data.dart';
import 'package:admob/models/categorie_model.dart';
import 'package:admob/models/photos_model.dart';
import 'package:admob/widgets/category_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admob/color.dart' as AppColor;
class Category extends StatefulWidget {

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<PhotoModel1> photos=new List();
  List<CategoryModel> categories =new List();
  ScrollController _scrollController= new ScrollController();
  @override
  void initState(){
    super.initState();
    categories=getCategorie();
    _scrollController.addListener(() { 
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){}
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Categories',
                  style: GoogleFonts.openSans(
                    color: AppColor.navBackground,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ), 
                ),
                SizedBox(
                  height: 16,
                ),
               StaggeredGridView.countBuilder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                crossAxisCount: 4,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index)=>
                StageCategory(
                  imagUrls: categories[index].imagUrl,
                  categoryName: categories[index].categoryName,
                ),
                staggeredTileBuilder: (int intdex)=>
                new StaggeredTile.fit(2),
                mainAxisSpacing:8,
                crossAxisSpacing:8,
                ),
                wallpaperCategory(photos, context),
                SizedBox(
                  height: 24,
                ),

              ],
            ),
          )
        ],
      )
    );
  }
}
class StageCategory extends StatelessWidget {
   final String imagUrls, categoryName;

  const StageCategory({Key key, this.imagUrls, this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context)=>CategoryWidget(category: categoryName)
            )
          );
      },
      child: Container(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: kIsWeb
              ? Image.network(
                imagUrls,
                color: AppColor.navBackground.withOpacity(0.2),
    
              )
              : CachedNetworkImage(
                imageUrl:imagUrls,
                fit: BoxFit.cover,
                placeholder: (context,url)=>Container(
                color:AppColor.navBackground.withOpacity(0.2)),
                )
            ),
            kIsWeb
            ? Positioned(
              bottom: 5,
              left: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    categoryName,
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
            : Positioned(
              bottom: 5,
              left: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    categoryName,
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}