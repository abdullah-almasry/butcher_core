import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String uid;
  final String email;
  final String phone;
  final String name;
final String mapId;
  final String address;
  final bool _isAdmin;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  final bool isActive;
  AppUser({
    bool? isAdmin,
    required this.uid,
    required this.email,
    required this.phone,
    required this.name,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.mapId,
  }) : _isAdmin = isAdmin ?? false;
  bool get isAdmin => _isAdmin;
  AppUser copyWith({
    String? email,
    String? phone,
    String? name,
    String? address,
    String? mapId,
    bool? isAdmin,
    Timestamp? createdAt,
    Timestamp? updatedAt,
    bool? isActive,
  }) {
    return AppUser(
      uid: uid ,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      address: address ?? this.address,
      isAdmin: isAdmin ?? this.isAdmin,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
      mapId: mapId ?? this.mapId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'phone': phone,
      'name': name,
      'address': address,
      'isAdmin': isAdmin,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isActive': isActive,
      'mapId': mapId,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'],
      email: map['email'] ,
      name: map['name'] ,
      phone: map['phone'] ,
      address: map['address'] ,
      isAdmin: map['isAdmin'] ?? false,
      createdAt: map['createdAt'] ?? Timestamp.now(),
      updatedAt: map['updatedAt'] ?? Timestamp.now(),
      isActive: map['isActive'] ?? true,
      mapId: map['mapId'] ?? true,
    );
  }

  @override
  List<Object> get props {
    return [
      uid,
      email,
      phone,
      name,
      address,
      isAdmin,
      createdAt,
      updatedAt,
      isActive,
      mapId,
    ];
  }
}
