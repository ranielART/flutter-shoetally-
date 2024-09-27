class Product {
  final String id;
  final String name;
  final double selling_price;
  final int total_purchase;
  final int product_stock;
  final String gender;
  final String category;

  Product(
      {required this.id,
      required this.name,
      required this.selling_price,
      required this.total_purchase,
      required this.product_stock,
      required this.gender,
      required this.category});

  factory Product.fromFireStore(Map<String, dynamic> data, String userDoc) {
    return Product(
        id: userDoc,
        name: data['name'],
        selling_price: data['selling_price'],
        total_purchase: data['total_purchase'],
        product_stock: data['product_stock'],
        gender: data['gender'],
        category: data['category']);
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'selling_price': selling_price,
      'total_purchase': total_purchase,
      'product_stock': product_stock,
      'gender': gender,
      'category': category
    };
  }
}
