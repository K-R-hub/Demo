import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_1/modules/social_app/social_register/cubit/states.dart';
import 'package:demo_1/shared/network/remote/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/network/end_points.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);


  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value)
    {
    print(value.user?.email);
    print(value.user?.uid);

    emit(SocialRegisterSuccessState());
    }).catchError((onError)
    {
    print(onError.toString());
    emit(SocialRegisterErrorState(onError.toString()));
    });
  }void createUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String uId,
  }) {
    FirebaseFirestore.instance.collection('users').doc(uId).set({

    }).then((value)
    {


    emit(SocialRegisterSuccessState());
    }).catchError((onError)
    {
    print(onError.toString());
    emit(SocialRegisterErrorState(onError.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SocialRegisterChangePasswordVisibilityState());
  }
}