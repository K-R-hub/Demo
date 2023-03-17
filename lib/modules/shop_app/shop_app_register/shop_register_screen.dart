import 'package:demo_1/modules/shop_app/shop_app_register/cubit/cubit.dart';
import 'package:demo_1/modules/shop_app/shop_app_register/cubit/states.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shop_app/shop_layout.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cache_helper.dart';

class ShopRegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            if (state.loginModel!.status) {
              print(state.loginModel?.message);
              print(state.loginModel?.data?.token);

              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel?.data?.token,
              ).then((value) {
                token = state.loginModel?.data?.token;

                goToScreenAndFinish(
                  context,
                  ShopLayout(),
                );
              });
            } else {
              print(state.loginModel?.message);

              showToast(
                msg: state.loginModel!.message!,
                state: ToastState.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        Text(
                          'Register now to browse our hot offers',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defultFormField(
                          textControl: nameController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'Name',
                          prefix: Icon(Icons.person),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Your Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defultFormField(
                          textControl: emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'Email',
                          prefix: Icon(Icons.email_outlined),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defultFormField(
                          textControl: phoneController,
                          keyboardType: TextInputType.phone,
                          label: 'Phone',
                          prefix: Icon(Icons.email_outlined),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Your Phone';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defultFormField(
                          textControl: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          label: 'Password',
                          prefix: Icon(Icons.lock),
                          suffix: ShopRegisterCubit.get(context).suffix,
                          obscureText: ShopRegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            ShopRegisterCubit.get(context).changePasswordVisibility();
                          },
                          onSubmit: (v) {
                            if (formKey.currentState!.validate()) {
                              ShopRegisterCubit.get(context).userRegister(
                                name: nameController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),


                    state is! ShopRegisterLoadingState?
                      defultButton(
                         onpressed: () {
                              if (formKey.currentState!.validate()) {
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: 'register'
                      )
                        :  Center(child: CircularProgressIndicator()),


                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
