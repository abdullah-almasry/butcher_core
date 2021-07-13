import '../../butcher_core.dart';

class ProductOptionValue extends Equatable {
  final List<LangAtr> name;
  final int price;
  ProductOptionValue({
    required this.name,
    required this.price,
  });

  ProductOptionValue copyWith({
    List<LangAtr>? name,
    int? price,
  }) {
    return ProductOptionValue(
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name.map((x) => x.toMap()).toList(),
      'price': price,
    };
  }

  factory ProductOptionValue.fromMap(Map<String, dynamic> map) {
    return ProductOptionValue(
      name: LangAtr.fromList(map['name']),
      price: map['price'],
    );
  }

  @override
  List<Object> get props => [name, price];
}
