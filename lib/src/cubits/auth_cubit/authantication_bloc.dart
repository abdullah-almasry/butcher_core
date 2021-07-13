import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../butcher_core.dart';

part 'authantication_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit of(BuildContext context, {bool listen = false}) => BlocProvider.of<AuthCubit>(context, listen: listen);

  final AuthService _authRepo = AuthService();
  AuthCubit() : super(const NotLogin());

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    return checkUserAuthStats();
  }

  Future<void> checkUserAuthStats() async {
    // AuthService().logout();
    print('called');
    try {
      if (AuthService.isLoggedIn) {
        final appUser = await _authRepo.getUserFromDatabase();
        emit(LoggedIn(appUser));
      } else {
        emit(const LoggedOut());
      }
    } catch (e, st) {
      log(st.toString());
      emit(const LoggedOut());
    }
  }
}
