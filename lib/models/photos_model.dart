class SrcModel{
  final String portrait;
  final String large;
  final String landscape;
  final String medium;

  SrcModel({this.portrait,this.large,this.landscape,this.medium});

  factory SrcModel.fromMap(Map<String,dynamic>json){
   return SrcModel(
      portrait: json['portrait'],
      large: json['larg'],
      landscape: json['landscape'],
      medium: json['medium'],
    );
  }
}
class PhotoModel1{
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  SrcModel src;

  PhotoModel1({this.photographer,this.photographerId,this.photographerUrl,this.src,this.url});
  factory PhotoModel1.fromMap(Map<String,dynamic>json){
    return PhotoModel1(
      url: json['url'],
      photographer: json['photographer'],
      photographerUrl: json['photographerUrl'],
      photographerId: json['photographerId'],
      src: SrcModel.fromMap(json['src']),
    );
  }
}