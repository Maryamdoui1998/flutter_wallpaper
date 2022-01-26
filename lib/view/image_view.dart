import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:admob/color.dart' as AppColor;
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class ImageView extends StatefulWidget {
 final String imgPath;

  const ImageView({Key key, this.imgPath}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    var filePaths;
    ByteData byteData;
    return Scaffold(
      body: Stack(
        children:<Widget> [
          // ui for show image from imagPath in imge view
          Hero(
            tag: widget.imgPath,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: widget.imgPath,
                fit: BoxFit.cover,
                placeholder: (context,url)=>Container(color: AppColor.navBackground.withOpacity(0.2) ,),
                ),
            ),
          ),
          // ui & code for share image to another device
          Padding(
            padding: const EdgeInsets.all(40),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: ()async{
                   var request =
                   await HttpClient().getUrl(Uri.parse(widget.imgPath));
                  var response = await request.close();
                  Uint8List bytes =
                  await consolidateHttpClientResponseBytes(response);
                  await Share.file('Download Wallify Now!', 'amlog.jpg', bytes, 'image/jpg');
                },
                icon: Icon(
                  Icons.share,
                  color: AppColor.navBackground,
                  size: 34,
                ),
              ),
            ),
          ),
        
          // ui for materialButton for Apply or cancel
          Positioned(
            top: MediaQuery.of(context).size.height*0.8,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                  height: MediaQuery.of(context).size.height*0.05,
                  minWidth: MediaQuery.of(context).size.width*0.60,
                  onPressed: (){
                    bottomSheet(context);
                  },
                  color: AppColor.navBackground,
                  shape: StadiumBorder(),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      color:Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                 onPressed:(){
                   _save(context);
                 },
                 icon: Icon(
                   Icons.save_alt_rounded,
                   color:AppColor.navBackground,
                   size: 34,
                 ),
                ),
                ]
              ),
            ),
          ),

          // ui for materialButton for Cancel or cancel
          Positioned(
            top: MediaQuery.of(context).size.height*0.88,
            left: MediaQuery.of(context).size.width*0.30,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: MaterialButton(
                  height: MediaQuery.of(context).size.height*0.05,
                  minWidth: MediaQuery.of(context).size.width*0.30,
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  color: AppColor.navBackground,
                  shape: StadiumBorder(),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color:Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ),

          )
          
          
          

        ],
      ),
    );
  }
  // code for save image 
_save(context)async{
   await _askPermission();
    var response = await Dio().get(widget.imgPath,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    if (result != null) {
      var snackBar = SnackBar(content: Text('Wallpaper Downloaded'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    Navigator.pop(context);
}
//code of permission ask to allow use storage , camera and location when you click download and share image
_askPermission() async {
    if (Platform.isIOS) {
      await PermissionHandler().requestPermissions([PermissionGroup.photos]);
    } else {
      PermissionHandler permission = PermissionHandler();
      await permission.requestPermissions([
        PermissionGroup.storage,
        PermissionGroup.camera,
        PermissionGroup.location
      ]);
      await permission.checkPermissionStatus(PermissionGroup.storage);
    }
  }
  // ui for buttomSheet
  void bottomSheet(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        )),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(FontAwesomeIcons.lock),
                  title: Text(
                    'Lock Screen',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    setWallpaperlock(context, widget.imgPath);
                  },
                ),
                ListTile(
                    leading: Icon(FontAwesomeIcons.home),
                    title: Text(
                      'Home Screen',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      setWallpaperhome(context, widget.imgPath);
                    }),
                ListTile(
                  leading: Icon(FontAwesomeIcons.android),
                  title: Text(
                    'Both',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () => {setWallpaperboth(context, widget.imgPath)},
                ),
              ],
            ),
          );
        });
  }
// code for show image look screen
          
         
  void setWallpaperlock(context, String image) async{
      try {
      var file = await DefaultCacheManager().getSingleFile(image);

      int location = WallpaperManager.LOCK_SCREEN;

      String result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);

      if (result != null) {
        var snackBar = SnackBar(content: Text('Wallpaper set'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
      }
    } catch (e) {
      print("exception e");
    }
  }
// code for set image in home screen
  void setWallpaperhome(context, String image)async {
    try {
      var file = await DefaultCacheManager().getSingleFile(image);

      int location = WallpaperManager.HOME_SCREEN;

      String result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);

      if (result != null) {
        var snackBar = SnackBar(content: Text('Wallpaper set'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
      }
    } catch (e) {
      print("exception e");
    }
  }
 // code for set image both
  setWallpaperboth(context, String image)async {
    try {
      var file = await DefaultCacheManager().getSingleFile(image);

      int location = WallpaperManager.BOTH_SCREENS;

      String result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);

      if (result != null) {
        var snackBar = SnackBar(content: Text('Wallpaper set'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
      }
    } catch (e) {
      print("exception e");
    }
  }
}



