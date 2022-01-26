import 'dart:convert';

import 'package:admob/models/photos_model.dart';
import 'package:admob/view/image_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:admob/color.dart' as AppColor;


class HomeWidget extends StatefulWidget {
final String home;

  const HomeWidget({Key key, this.home}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<PhotoModel1> photos=new List();
  final String apiKEY ='563492ad6f91700001000001fd17d16b9fed4cb69f430a4c3d0d1c57';
  getWallpaperHome()async{
    await http.get(
        "https://api.pexels.com/v1/curated?per_page=50&page=1",
        headers: {"Authorization": apiKEY}).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        PhotoModel1 photoModel = new PhotoModel1();
        photoModel = PhotoModel1.fromMap(element);
        photos.add(photoModel);
      });

      setState(() {});
    });
  }
  @override
  void initState(){
    super.initState();
    getWallpaperHome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: wallpaperHome(photos, context)
      ),
    );
}
}

Widget wallpaperHome(List<PhotoModel1> listPhotos, BuildContext context){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal:16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.6,
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 6.0,
          crossAxisSpacing: 6.0,
          children: listPhotos.map((PhotoModel1 photoModel1){
            return GridTile(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=>ImageView(imgPath: photoModel1.src.portrait,))
                    );
                },
                child: Hero(
                  tag: photoModel1.src.portrait,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: kIsWeb
                      ? Image.network(
                        photoModel1.src.portrait,
                        color: AppColor.navBackground.withOpacity(0.2),
                        fit: BoxFit.cover,
                      )
                      : CachedNetworkImage(
                        imageUrl: photoModel1.src.portrait,
                        fit: BoxFit.cover,
                        placeholder: (context,url)=>Container(
                          color:AppColor.navBackground.withOpacity(0.2)
                        ),
                      )
                    ),
                  ),
                ),
              )
            );
          }).toList()
          )  
      ],
    )
  );
}
