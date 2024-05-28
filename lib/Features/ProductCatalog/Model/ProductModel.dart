/// images : ""
/// name : ""
/// price : ""
/// rating : 5.02
/// description : ""

class ProductModel {
  ProductModel({
      String? images, 
      String? name, 
      String? price, 
      double? rating,
      String? description,}){
    _images = images;
    _name = name;
    _price = price;
    _rating = rating;
    _description = description;
}

  ProductModel.fromJson(dynamic json) {
    _images = json['images'];
    _name = json['name'];
    _price = json['price'];
    _rating = json['rating'];
    _description = json['description'];
  }
  String? _images;
  String? _name;
  String? _price;
  double? _rating;
  String? _description;
ProductModel copyWith({  String? images,
  String? name,
  String? price,
  double? rating,
  String? description,
}) => ProductModel(  images: images ?? _images,
  name: name ?? _name,
  price: price ?? _price,
  rating: rating ?? _rating,
  description: description ?? _description,
);
  String? get images => _images;
  String? get name => _name;
  String? get price => _price;
  double? get rating => _rating;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['images'] = _images;
    map['name'] = _name;
    map['price'] = _price;
    map['rating'] = _rating;
    map['description'] = _description;
    return map;
  }

}