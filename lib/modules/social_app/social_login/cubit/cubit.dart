import 'package:demo_1/modules/social_app/social_login/cubit/states.dart';
import 'package:demo_1/shared/network/remote/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/end_points.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffixIcon = Icons.remove_red_eye_outlined;

  void changIsPassword() {
    isPassword = !isPassword;
    suffixIcon = isPassword
        ? Icons.remove_red_eye_outlined
        : Icons.visibility_off_outlined;
    emit(SocialLoginChangeVisibilityState());
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value) {
      print(value.user?.email);
      emit(SocialLoginSuccessState());

    }).catchError((onError) {
      print(onError.toString());
      emit(SocialLoginErrorState(onError.toString()));
    });
  }
}
