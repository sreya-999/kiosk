class ProductModel {
  final int id;
  final String name;
  final String image;
  final int categoryId;
  final double price; // <-- Add this

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.categoryId,
    required this.price, // <-- Add this
  });
}

