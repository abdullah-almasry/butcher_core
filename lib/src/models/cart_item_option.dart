import 'package:butcher_core/butcher_core.dart';
import 'package:equatable/equatable.dart';

class CartItemOption extends Equatable {
  final ProductOption option;
  final ProductOptionValue value;
  CartItemOption({
    required this.option,
    required this.value,
  });

  CartItemOption copyWith({
    ProductOption? option,
    ProductOptionValue? value,
  }) {
    return CartItemOption(
      option: option ?? this.option,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'option': option.toMap(),
      'value': value.toMap(),
    };
  }

  factory CartItemOption.fromMap(Map<String, dynamic> map) {
    return CartItemOption(
      option: ProductOption.fromMap(map['option']),
      value: ProductOptionValue.fromMap(map['value']),
    );
  }

  @override
  List<Object> get props => [option, value];
}
