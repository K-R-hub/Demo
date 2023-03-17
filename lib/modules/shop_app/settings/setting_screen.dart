import 'package:demo_1/layout/shop_app/cubit/cubit.dart';
import 'package:demo_1/layout/shop_app/cubit/states.dart';
import 'package:demo_1/shared/components/components.dart';
import 'package:demo_1/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/shop_model/shop_login_model.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessUpdateUserState) {
          if (state.updateModel.status) {
            showToast(
              msg: state.updateModel.message!,
              state: ToastState.SUCCESS,
            );
          } else {
            showToast(
              msg: state.updateModel.message!,
              state: ToastState.ERROR,
            );
          }
        }
      },
      builder: (contxt, state) {
        ShopLoginModel? model = ShopCubit.get(context).profileModel;
        name.text = model!.data!.name!;
        email.text = model.data!.email!;
        phone.text = model.data!.phone!;

        return model != null
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      if (state is ShopLoadingUpdateUserState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      defultFormField(
                        textControl: name,
                        keyboardType: TextInputType.name,
                        label: 'name',
                        prefix: Icon(Icons.person),
                        validator: (v) {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defultFormField(
                        textControl: email,
                        keyboardType: TextInputType.emailAddress,
                        label: 'email',
                        prefix: Icon(Icons.email),
                        validator: (v) {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defultFormField(
                        textControl: phone,
                        keyboardType: TextInputType.phone,
                        label: 'phone',
                        prefix: Icon(Icons.phone),
                        validator: (v) {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defultButton(
                          text: 'Modification',
                          onpressed: () {
                            if (formKey.currentState!.validate()) {
                              ShopCubit.get(context).updateUserData(
                                  name: name.text,
                                  email: email.text,
                                  phone: phone.text,

                              );
                            }
                            ;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      defultButton(
                        text: 'Sign Out',
                        onpressed: () {
                          signOut(context);
                        },
                      ),
                    ],
                  ),
                ),
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
