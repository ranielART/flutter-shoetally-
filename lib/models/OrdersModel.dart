
class Orders {
  final String id;
  final String transaction_id;
  final String product_id;
  final double total_price;
  final int quantity;

  Orders(
      {required this.id,
      required this.transaction_id,
      required this.product_id,
      required this.total_price,
      required this.quantity});

  factory Orders.fromFireStore(Map<String, dynamic> data, String orderDoc) {
    return Orders(
      id: orderDoc,
      transaction_id: data['transaction_id'],
      product_id: data['product_id'],
      total_price: data['total_price'],
      quantity: data['quantity'],
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'transaction_id': transaction_id,
      'product_id': product_id,
      'total_price': total_price,
      'quantity': quantity
    };


  }
}
