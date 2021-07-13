import 'package:butcher_core/butcher_core.dart';

class CartModel extends Equatable {
  final CategoryModel category;
  final ProductModel product;
  final List<CartItemOption> options;
  final int count;

  const CartModel({
    required   this.category,
    required this.product,
    required this.options,
    required this.count,
  });

  CartModel copyWith({
    ProductModel? product,
  CategoryModel? category,
    List<CartItemOption>? options,
    int? count,
  }) {
    return CartModel(
      product: product ?? this.product,
      options: options ?? this.options,
      count: count ?? this.count,
    category: category ?? this.category,
    );
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
     category: CategoryModel.fromMap(map['category'] as Map<String, dynamic>),

      options: (map['options'] as List).map((e) => CartItemOption.fromMap(e as Map<String, dynamic>)).toList(),
      count: map['count'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
   'category': category.toMap(),
      'options': options.map((e) => e.toMap()).toList(),
      'count': count,
    };
  }

  @override
  List<Object?> get props => [product, options, count,
     category
  ];
}
