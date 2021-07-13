class PlacesModel {
  final String titleAr;
  final String titleEn;

  PlacesModel copyWith({
     String? titleAr,
     String? titleEn,
  }) {
    if ((titleAr == null || identical(titleAr, this.titleAr)) &&
        (titleEn == null || identical(titleEn, this.titleEn))) {
      return this;
    }

    return  PlacesModel(
      titleAr: titleAr ?? this.titleAr,
      titleEn: titleEn ?? this.titleEn,
    );
  }

  PlacesModel({required this.titleAr, required this.titleEn});

  static PlacesModel fromMap(map) {
    return PlacesModel(
      titleAr: map['titleAr'],
      titleEn: map['titleEn'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titleAr': titleAr,
      'titleEn': titleEn,
    };
  }
}
