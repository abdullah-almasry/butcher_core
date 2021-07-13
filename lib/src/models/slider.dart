import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'lang_atr.dart';

class SliderEnitiy extends Equatable {
  final String id;
  final List<LangAtr> image;
  final List<LangAtr> title;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  SliderEnitiy({
    required this.id,
    required this.image,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  SliderEnitiy copyWith({
    String? id,
    List<LangAtr>? image,
    List<LangAtr>? title,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return SliderEnitiy(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image.map((e) => e.toMap()),
      'title': title.map((e) => e.toMap()),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory SliderEnitiy.fromMap(Map<String, dynamic> map) {
    return SliderEnitiy(
      id: map['id'],
      image: LangAtr.fromList(map['image']),
      title: LangAtr.fromList(map['title']),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      image,
      title,
      createdAt,
      updatedAt,
    ];
  }
}
