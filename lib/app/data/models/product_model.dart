class ProductModel {
  final String title;
  final String description;
  final double price;
  final double rating;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  ProductModel({
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    //Chave é String e Recebe valores dinâmicos
    return ProductModel(
      title: map['title'],
      description: map['description'],
      price: map['price'] * 1.0, // Para transformar em double
      rating: map['rating'] * 1.0,
      brand: map['brand'],
      category: map['category'],
      thumbnail: map['thumbnail'],
      images: List<String>.from((map['images'] as List)), // Recebe lista de Strings
    );
  }
}
