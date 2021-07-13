import 'package:butcher_core/butcher_core.dart';
import 'package:butcher_core/src/models/prod.dart';
import 'package:butcher_core/src/models/prod_opt.dart';
import 'package:butcher_core/src/models/prod_opt_value.dart';

class AddToCartHelper {
  final ProductModel product;
  final Map<ProductOption, ProductOptionValue> selectedFields;
  final int count;
  factory AddToCartHelper.fromCartItem(CartModel item) {
    final _selOpt = <ProductOption, ProductOptionValue>{};
    for (final opt in item.options) {
      _selOpt[opt.option] = opt.value;
    }
    return AddToCartHelper(
      product: item.product,
      selectedFields: _selOpt,
      count: item.count,
    );
  }
  AddToCartHelper({
    required this.product,
    required this.selectedFields,
    required this.count,
  });

  num   getPrice() {
    num _total = 0;
    for (final option in selectedFields.values) {
      _total += option.price;
    }
    return (_total + product.price) * count;
  }

  /// ! NOTE ::: throws exception
  void validateToAddToCart(){

    final requiredAtr = product.options.where((e) => e.isRequired).toList();
    for (final opt in selectedFields.keys) {
      requiredAtr.removeWhere((e) => e.name.gem == opt.name.gem);
    }
    if (requiredAtr.isNotEmpty) {
      Q.alertWithErr('اختر احد العناصر');
      throw 'must_pick' + requiredAtr.first.name.ruby;
    }
  }
}
