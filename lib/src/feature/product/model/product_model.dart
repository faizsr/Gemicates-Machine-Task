class ProductModel {
  final int id;
  final String title;
  final String brand;
  final String description;
  final String category;
  final num price;
  num discountedPrice;
  final num discountPrecentage;
  final num rating;
  final int stock;
  final String thumbnail;
  final List<String> images;
  final List<String> tags;
  final int weight;
  final String warrantyInfo;
  final String shippingInfo;
  final String availabilityStatus;
  final String returnPolicy;
  final int minimumOrderQuantity;
  int totalProducts;

  ProductModel({
    required this.id,
    required this.title,
    required this.brand,
    required this.description,
    required this.category,
    required this.price,
    this.discountedPrice = 0,
    required this.discountPrecentage,
    required this.rating,
    required this.stock,
    required this.thumbnail,
    required this.images,
    required this.tags,
    required this.weight,
    required this.warrantyInfo,
    required this.shippingInfo,
    required this.availabilityStatus,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    this.totalProducts = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      brand: json['brand'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      discountPrecentage: json['discountPercentage'],
      rating: json['rating'],
      stock: json['stock'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(
        json['images']!.map((image) => image.toString()),
      ),
      tags: List<String>.from(
        json['tags']!.map((tag) => tag.toString()),
      ),
      weight: json['weight'],
      warrantyInfo: json['warrantyInformation'],
      shippingInfo: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
    );
  }
}
