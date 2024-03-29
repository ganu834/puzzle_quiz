import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterquiz/features/auth/authRepository.dart';

import 'authCubit.dart';

//State
@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInProgress extends SignInState {
  final AuthProviders authProvider;

  SignInProgress(this.authProvider);
}

class SignInSuccess extends SignInState {
  final User user;
  final AuthProviders authProvider;
  final bool isNewUser;

  SignInSuccess(
      {required this.authProvider,
      required this.user,
      required this.isNewUser});
}

class SignInFailure extends SignInState {
  final String errorMessage;
  final AuthProviders authProvider;

  SignInFailure(this.errorMessage, this.authProvider);
}

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository _authRepository;

  SignInCubit(this._authRepository) : super(SignInInitial());

  //to signIn user
  void signInUser(
    AuthProviders authProvider, {
    String? email,
    String? verificationId,
    String? smsCode,
    String? password,
  }) {
    //emitting signInProgress state
    emit(SignInProgress(authProvider));
    //signIn user with given provider and also add user detials in api
    _authRepository
        .signInUser(
      authProvider,
      email: email ?? "",
      password: password ?? "",
      smsCode: smsCode ?? "",
      verificationId: verificationId ?? "",
    )
        .then((result) {
      //success
      emit(SignInSuccess(
          user: result['user'],
          authProvider: authProvider,
          isNewUser: result['isNewUser']));
    }).catchError((e) {
      //failure
      emit(SignInFailure(e.toString(), authProvider));
    });
  }
}
