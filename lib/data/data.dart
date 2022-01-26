import 'package:admob/models/categorie_model.dart';

// list of category image Url that showed in category screen: Copied from pixel site


List<CategoryModel> getCategorie() {
   List<CategoryModel> categories =new List();
   CategoryModel categoryModel= new CategoryModel();

  categoryModel.imagUrl='https://images.pexels.com/photos/7790344/pexels-photo-7790344.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoryModel.categoryName='happy birthday';
  categories.add(categoryModel);
  categoryModel= new CategoryModel();
  categoryModel.imagUrl =
      "https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  categoryModel.categoryName = "Animals";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  /// 3 ///
  categoryModel.imagUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryModel.categoryName = "Nature";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  /// 4 ///
  categoryModel.imagUrl =
      "https://images.pexels.com/photos/3214982/pexels-photo-3214982.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoryModel.categoryName = "Tourism";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  /// 5 ///
  categoryModel.imagUrl =
      "https://images.pexels.com/photos/5442472/pexels-photo-5442472.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoryModel.categoryName = "Jewelry";

  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  /// 6 ///
  categoryModel.imagUrl =
      "https://images.pexels.com/photos/2943358/pexels-photo-2943358.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoryModel.categoryName = "Bikes";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  /// 7 ///
  categoryModel.imagUrl =
      "https://images.pexels.com/photos/3156482/pexels-photo-3156482.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoryModel.categoryName = "Cars";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  /// 8 ///
  categoryModel.imagUrl =
      "https://images.pexels.com/photos/776636/pexels-photo-776636.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoryModel.categoryName = "Love";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  /// 9 ///
  categoryModel.imagUrl =
      "https://images.pexels.com/photos/5952647/pexels-photo-5952647.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoryModel.categoryName = "Coding";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  /// 10 ///
  categoryModel.imagUrl =
      "https://images.pexels.com/photos/2448749/pexels-photo-2448749.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoryModel.categoryName = "Raining";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  /// 11 ///
  categoryModel.imagUrl =
      "https://images.pexels.com/photos/9392358/pexels-photo-9392358.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoryModel.categoryName = "History";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  /// 12 ///
  categoryModel.imagUrl =
      "https://images.pexels.com/photos/39649/solar-flare-sun-eruption-energy-39649.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoryModel.categoryName = "Space";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  /// 13 ///
  categoryModel.imagUrl =
      "https://images.pexels.com/photos/1431282/pexels-photo-1431282.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoryModel.categoryName = "Sport";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  /// 14 ///
  categoryModel.imagUrl =
      "https://images.pexels.com/photos/1109197/pexels-photo-1109197.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  categoryModel.categoryName = "Food";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();


  return categories;

}