import 'package:butcher_core/butcher_core.dart';

class PaymentModel extends Equatable {
  final String id;
  final String accountName;
  final String accountNumber;
  final String ibanNumber;
  final String bankName;
  final String img;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  const PaymentModel({
    required this.id,
    required this.accountName,
    required this.accountNumber,
    required this.ibanNumber,
    required this.bankName,
    required this.img,
    required this.createdAt,
    required this.updatedAt,
  });

  PaymentModel copyWith({
    String? id,
    String? accountName,
    String? accountNumber,
    String? ibanNumber,
    String? bankName,
    String? img,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return PaymentModel(
      id: id ?? this.id,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      ibanNumber: ibanNumber ?? this.ibanNumber,
      bankName: bankName ?? this.bankName,
      img: img ?? this.img,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      id: map['id'] as String,
      accountName: map['accountName'] as String,
      accountNumber: map['accountNumber'] as String,
      ibanNumber: map['ibanNumber'] as String,
      bankName: map['bankName'] as String,
      img: map['img'] as String,
      createdAt: map['createdAt'] as Timestamp,
      updatedAt: map['updatedAt'] as Timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'accountName': accountName,
      'accountNumber': accountNumber,
      'ibanNumber': ibanNumber,
      'bankName': bankName,
      'img': img,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  List<Object?> get props => [accountName, accountNumber, ibanNumber, bankName, img, createdAt, updatedAt];
}
