part of 'core_cubit_cubit.dart';

class CoreCubitState extends Equatable {
  final ThemeData? theme;
  const CoreCubitState({this.theme});

  @override
  List<Object?> get props => [theme];

  CoreCubitState copyWith({
    ThemeData? theme,
  }) {
    return CoreCubitState(
      theme: theme ?? this.theme,
    );
  }
}
// class CoreCubitState extends Equatable {
//   const CoreCubitState();

//   @override
//   List<Object> get props => [
//         // to make every state unique so the bloc let it reach the ui
//         UniqueKey(),
//       ];
// }
