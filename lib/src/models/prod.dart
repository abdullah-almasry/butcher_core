import 'package:butcher_core/src/models/prod_opt.dart';
import 'package:equatable/equatable.dart';

import 'package:butcher_core/butcher_core.dart';

class ProductModel extends Equatable {
  final String id;
  final List<LangAtr> name;
  final List<LangAtr> desc;
  final num price;
  final List<ProductOption> options;
  final bool applyTax;
  final int maxCount;
  final String image;
  //final Timestamp createdAt;
  //final Timestamp updatedAt;
  ProductModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.options,
    required this.applyTax,
    required this.maxCount,
    required this.image,
   // required this.createdAt,
    //required this.updatedAt,
  });

  ProductModel copyWith({
    String? id,
    List<LangAtr>? name,
    List<LangAtr>? desc,
    num? price,
    List<ProductOption>? options,
    bool? applyTax,
    int? maxCount,
    String? image,
   // Timestamp? createdAt,
    //Timestamp? updatedAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      options: options ?? this.options,
      applyTax: applyTax ?? this.applyTax,
      maxCount: maxCount ?? this.maxCount,
      image: image ?? this.image,
  //    createdAt: createdAt ?? this.createdAt,
   //   updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name.map((x) => x.toMap()).toList(),
      'desc': desc.map((x) => x.toMap()).toList(),
      'price': price,
      'options': options.map((x) => x.toMap()).toList(),
      'applyTax': applyTax,
      'maxCount': maxCount,
      'image': image,
      //   'createdAt': createdAt,
      // 'updatedAt': updatedAt,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: LangAtr.fromList(map['name']),
      desc: LangAtr.fromList(map['desc']),
      price: map['price'],
      options: List<ProductOption>.from(map['options']?.map((x) => ProductOption.fromMap(x))),
      applyTax: map['applyTax'],
      maxCount: map['maxCount'],
      image: map['image'],
    //  createdAt: map['createdAt'],
     // updatedAt: map['updatedAt'],
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      desc,
      price,
      options,
      applyTax,
      maxCount,
      image,
   //   createdAt,
     // updatedAt,
    ];
  }
}
