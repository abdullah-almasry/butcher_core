import 'package:butcher_core/butcher_core.dart';
import 'package:equatable/equatable.dart';

extension Ruby on List<LangAtr> {
  String get ruby {
    try {
      return firstWhere((atr) => atr.langKey == Q.locale.languageCode).value;
    } catch (e) {
      return first.value;
    }
  }

  String get gem {
    try {
      return firstWhere((atr) => atr.langKey == 'en').value.toLowerCase().replaceAll(' ', '_');
    } catch (e) {
      return first.value.replaceAll(' ', '_');
    }
  }
}

class LangAtr extends Equatable {
  static List<LangAtr> fromList(List<dynamic> list) {
    return list.map((e) => LangAtr.fromMap(e as Map<String, dynamic>)).toList();
  }

  final String langKey;
  final String value;
  LangAtr({
    required this.langKey,
    required this.value,
  });

  LangAtr copyWith({
    String? langKey,
    String? value,
  }) {
    return LangAtr(
      langKey: langKey ?? this.langKey,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'langKey': langKey,
      'value': value,
    };
  }

  factory LangAtr.fromMap(Map<String, dynamic> map) {
    return LangAtr(
      langKey: map['langKey'],
      value: map['value'],
    );
  }

  @override
  List<Object> get props => [langKey, value];
}
