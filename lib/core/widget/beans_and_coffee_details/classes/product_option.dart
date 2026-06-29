class ProductOption {
  /// Small / Medium / Large
  /// أو
  /// 250g / 500g / 1kg
  final String name;

  final double price;

  const ProductOption({
    required this.name,
    required this.price,
  });
}