import 'package:demo_1/layout/shop_app/shop_layout.dart';
import 'package:demo_1/modules/shop_app/login/cubit/cubit.dart';
import 'package:demo_1/modules/shop_app/login/cubit/states.dart';
import 'package:demo_1/modules/shop_app/shop_app_register/shop_register_screen.dart';
import 'package:demo_1/shared/components/components.dart';
import 'package:demo_1/shared/components/constants.dart';
import 'package:demo_1/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (BuildContext context, state) {
          if (state is ShopLoginSuccsessState) {
            if (state.shopModel.status) {
              print(state.shopModel.message);
              print(state.shopModel.data!.token);
              showToast(
                msg: state.shopModel.message!,
                state: ToastState.SUCCESS,
              );
              CacheHelper.saveData(
                key: 'token',
                value: state.shopModel.data!.token,
              ).then((value) {
                token = state.shopModel.data!.token;
                goToScreenAndFinish(context, ShopLayout());
              });
            } else {
              showToast(
                msg: state.shopModel.message!,
                state: ToastState.ERROR,
              );
            }
          }
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defultFormField(
                          textControl: emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'email',
                          prefix: Icon(Icons.email_outlined),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defultFormField(
                          textControl: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          label: 'password',
                          prefix: Icon(Icons.lock),
                          suffix: ShopLoginCubit.get(context).suffixIcon,
                          obscureText: ShopLoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            ShopLoginCubit.get(context).changIsPassword();
                          },
                          onSubmit: (v) {
                            if (formkey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
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
                          height: 30,
                        ),
                        state is! ShopLoginLodingState
                            ? defultButton(
                                onpressed: () {
                                  if (formkey.currentState!.validate()) {
                                    ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'login',
                              )
                            : Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: 22,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            TextButton(
                              onPressed: () {
                                goToScreen(
                                  context,
                                  ShopRegisterScreen(),
                                );
                              },
                              child: Text(
                                'REGISTER',
                              ),
                            )
                          ],
                        )
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
