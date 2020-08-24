import 'catdatablueprint.dart';

String apiKey = "563492ad6f91700001000001209a8066f3794620b1fc5d4082e2867d";

List<categoriemodel> getcategorie() {
  List<categoriemodel> categories = new List();
  categoriemodel catobject = new categoriemodel();

  catobject.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catobject.categorieName = "Street Art";
  categories.add(catobject);
  catobject = new categoriemodel();

  catobject.imgUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catobject.categorieName = "Wild Life";
  categories.add(catobject);
  catobject = new categoriemodel();

  catobject.imgUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catobject.categorieName = "Nature";
  categories.add(catobject);
  catobject = new categoriemodel();

  catobject.imgUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catobject.categorieName = "City";
  categories.add(catobject);
  catobject = new categoriemodel();

  catobject.imgUrl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  catobject.categorieName = "Motivation";
  categories.add(catobject);
  catobject = new categoriemodel();

  catobject.imgUrl =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catobject.categorieName = "Bikes";
  categories.add(catobject);
  catobject = new categoriemodel();

  catobject.imgUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  catobject.categorieName = "Cars";
  categories.add(catobject);
  catobject = new categoriemodel();

  return categories;
}
