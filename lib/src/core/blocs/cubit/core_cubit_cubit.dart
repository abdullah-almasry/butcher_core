import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:butcher_core/butcher_core.dart';

part 'core_cubit_state.dart';

class QCoreCubit extends Cubit<CoreCubitState> {
  static QCoreCubit of(BuildContext context) => BlocProvider.of<QCoreCubit>(context, listen: false);
  QCoreCubit() : super(const CoreCubitState());

  void refresh([CoreCubitState? state]) => emit(state ?? this.state);
  void updateTheme(ThemeData theme) {
    refresh(state.copyWith(theme: theme));
  }
}
