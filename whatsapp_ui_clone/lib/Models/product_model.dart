class ProductModel {
  int id;
  String name;
  double price;
  ProductModel({required this.id, required this.name, required this.price});

  factory ProductModel.fromJson({required Map json}) {
    return ProductModel(
      id: json['i'],
      name: json['name'],
      price: json['price'],
    );
  }
}
