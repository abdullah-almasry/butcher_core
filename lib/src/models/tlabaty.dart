import 'package:butcher_core/butcher_core.dart';

class TlabatyModel  extends Equatable{
  final String name;
  final String user_id;
  final String status;
  final String orderNumper;
  final double allPrice;
  final Timestamp dateTime;
  final bool not;
  final bool not1;
  final bool not2;
  final bool not3;
  final bool not4;
  final bool not5;


  final String payBy;
  final List<CartModel> items;

  const TlabatyModel({
    required this.name,
    required this.user_id,
    required this.status,
    required this.items,
    required this.allPrice,
    required this.payBy,
    required this.dateTime,
    required this.orderNumper,
    required this.not,
    required this.not1,
    required this.not2,
    required this.not3,
    required this.not4,
    required this.not5,

  });

  TlabatyModel copyWith({
    String? name,
    String? user_id,
    String? status,
    String? orderNumper,
    double? allPrice,
    String? payBy,
    Timestamp? dateTime,
    bool? not,
    bool? not1,
    bool? not2,
    bool? not3,
    bool? not4,
    bool? not5,
    List<CartModel>? items,
  }) {


    return TlabatyModel(
      name: name ?? this.name,
      user_id: user_id ?? this.user_id,
      status: status ?? this.status,
      items: items ?? this.items,
      allPrice: allPrice ?? this.allPrice,
      orderNumper: orderNumper ?? this.orderNumper,
      payBy: payBy ?? this.payBy,
      dateTime: dateTime ?? this.dateTime,
      not: not ?? this.not,
      not1: not1 ?? this.not1,
      not2: not2 ?? this.not2,
      not3: not3 ?? this.not3,
      not4: not4 ?? this.not4,
      not5: not5 ?? this.not5,
    );
  }

  factory TlabatyModel.fromMap(Map<String, dynamic> map) {
    return TlabatyModel(
      name: map['name'] as String,
      user_id: map['user_id'] as String,
      orderNumper: map['orderNumper'] as String,
      status: map['status'] as String,
      allPrice: map['All_Price'] as double,
      payBy: map['payBy'] as String,
      dateTime: map['dateTime'] as Timestamp,
      not: map['note'] as bool,
      not1: map['note1'] as bool,
      not2: map['note2'] as bool,
      not3: map['note3'] as bool,
      not4: map['note5'] as bool,
      not5: map['note5'] as bool,
      items: (map['cart'] as List).map((e) => CartModel.fromMap(e as Map<String,dynamic>)).toList() ,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'user_id': user_id,
      'status': status,
      'orderNumper': orderNumper,
      'All_Price': allPrice,
      'payBy': payBy,
      'dateTime': dateTime,
      'note':not,
      'note1':not1,
      'note2':not2,
      'note3':not3,
      'note4':not4,
      'note5':not5,
      'cart': items.map((e) => e.toMap).toList(),
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
