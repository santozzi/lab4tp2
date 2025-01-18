class ProductCartEntity {
  int productId;
  int quantity;

  ProductCartEntity({
    required this.productId,
    required this.quantity,
  });

  @override
  String toString() {
    return '{productId: $productId, quantity: $quantity}';
  }
}
