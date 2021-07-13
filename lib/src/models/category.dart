import 'package:butcher_core/butcher_core.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final List<LangAtr> name;
  final String id;
  final String imagePath;
  // final Timestamp createdAt;
  // final Timestamp updatedAt;
  CategoryModel({
    required this.name,
    required this.id,
    // required this.createdAt,
    //  required this.updatedAt,
    required this.imagePath,
  });

  CategoryModel copyWith({
    List<LangAtr>? name,
    String? id,
    String? imagePath,
    // Timestamp? createdAt,
    // Timestamp? updatedAt,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      // createdAt: createdAt ?? this.createdAt,
      //  updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name.map((e) => e.toMap()).toList(),
      'id': id,
      // 'createdAt': createdAt,
      // 'updatedAt': updatedAt,
      'imagePath': imagePath,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: LangAtr.fromList(map['name']),
      id: map['id'],
      // createdAt: map['createdAt'],
      // updatedAt: map['updatedAt'],
      imagePath: map['imagePath'],
    );
  }

  @override
  List<Object> get props => [name, id, imagePath];
}
