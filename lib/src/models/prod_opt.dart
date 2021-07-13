import 'package:butcher_core/src/models/prod_opt_value.dart';

import '../../butcher_core.dart';

class ProductOption extends Equatable {
  final List<LangAtr> name;
  final List<ProductOptionValue> values;
  final bool isRequired;
  ProductOption({
    required this.name,
    required this.values,
    required this.isRequired,
  });

  ProductOption copyWith({
    List<LangAtr>? name,
    List<ProductOptionValue>? values,
    bool? isRequired,
  }) {
    return ProductOption(
      name: name ?? this.name,
      values: values ?? this.values,
      isRequired: isRequired ?? this.isRequired,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name.map((x) => x.toMap()).toList(),
      'values': values.map((x) => x.toMap()).toList(),
      'isRequired': isRequired,
    };
  }

  factory ProductOption.fromMap(Map<String, dynamic> map) {
    return ProductOption(
      name: LangAtr.fromList(map['name']),
      values: List<ProductOptionValue>.from(map['values']?.map((x) => ProductOptionValue.fromMap(x))),
      isRequired: map['isRequired'],
    );
  }

  @override
  List<Object> get props => [name, values, isRequired];
}
