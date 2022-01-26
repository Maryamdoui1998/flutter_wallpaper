import 'dart:convert';

import 'package:admob/models/photos_model.dart';
import 'package:admob/view/image_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class CarouselSliderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        //to control of carousel slider place , shape and movement in home screen
        CarouselSlider(
          options: CarouselOptions(
            height: 158,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16/9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 1200),
          ),
          // list path of items that show in carousel slider from asset carousel
          items: [
            Content(
                img: 'assets/carousel/motivation.jpg',
                title: 'Motivation',
                tag: 'motivation'
                ),
            
            Content(
                img: 'assets/carousel/fashion.jpg',
                title: 'Fashion',
                tag: 'fashion'
            ),
            Content(
              img: 'assets/carousel/anime.jpg', 
              title: 'Anime', 
              tag: 'anime'
            ),
            Content(
              img: 'assets/carousel/art.jpg',
              title: 'Street Art',
              tag: 'art'
            ),
            Content(
              img: 'assets/carousel/roses.jpg',
               title: 'Roses',
                tag: 'roses'
            ),
            Content(
              img: 'assets/carousel/concert.jpg',
              title: 'Concert',
              tag: 'concert'
            )
          ],
        ),
      ],
    );
  }
}
// ui of CarouselSlider content[ img, title, tag ]
class Content extends StatelessWidget {
 final  String img, title,tag;
  Content({this.img,this.tag,this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
           MaterialPageRoute(
             builder: (context)=>CarouselGrid(carousel:tag))
           );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize:18.0,
                fontWeight: FontWeight.bold,
              )
                )
          ],
        ),
      ),
    );
  }
}
class CarouselGrid extends StatefulWidget {
final String carousel;
CarouselGrid({@required this.carousel});

  @override
  State<CarouselGrid> createState() => _CarouselGridState();
}

class _CarouselGridState extends State<CarouselGrid> {
  List<PhotoModel1> photos=new List();
  final String apiKEY='563492ad6f91700001000001fd17d16b9fed4cb69f430a4c3d0d1c57';
  @override
  void initState(){
    super.initState();
    getCarouselWallpaper();
  }
  getCarouselWallpaper()async{
  await http.get(
        "https://api.pexels.com/v1/search?query=${widget.carousel}&per_page=50&page=2",
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: wallpaperCarousel(photos, context),
      ),
    );
  }
}
//ui of wallpaperCarousel  to show images in grid view inside Carousel slider
Widget wallpaperCarousel(List<PhotoModel1> listPhotos, BuildContext context){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal:16),
    child: GridView.count(
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
                     builder: (context)=> ImageView(imgPath: photoModel1.src.portrait)
                     )
                   );
               },
               child: Hero(
              /// /// to determine the type of collection of image from it's tag /// ///
              tag: photoModel1.src.portrait,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: kIsWeb
                        ? Image.network(
                            photoModel1.src.portrait,
                            color: Colors.pink[200],
                            height: 50,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: photoModel1.src.portrait,
                            placeholder: (context, url) => Container(
                                  color: Colors.pink[200],
                                ),
                            fit: BoxFit.cover)
                            ),
              ),
            ),
             )
             );
        }).toList()
      ),
  );
}