class ProductsCartEntity {
  final int productId;
  final int quantity;

  ProductsCartEntity({
    required this.productId,
    required this.quantity,
  });

  factory ProductsCartEntity.fromJson(Map<String, dynamic> json) {
    return ProductsCartEntity(
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
    );
  }
}
