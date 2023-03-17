import 'package:demo_1/shared/components/components.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   var emailControl = TextEditingController();

   var passwordControl = TextEditingController();

   var formKey = GlobalKey<FormState>();

   bool obscureText = false;
   void initState(){
     super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  defultFormField(
                    textControl: emailControl,
                    label: 'Email address',
                    prefix: Icon(Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },

                  ),
                  SizedBox(height: 20),
                  defultFormField(
                      textControl: passwordControl,
                      keyboardType: TextInputType.visiblePassword,
                      label: 'Password',
                      prefix: Icon(Icons.lock),
                      obscureText: obscureText ,
                      suffix:obscureText ?  Icons.remove_red_eye_outlined : Icons.visibility_off_outlined,
                      suffixPressed:(){
                        obscureText = !obscureText;
                               setState((){});
                      },
                      validator:  (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                  ),
                  SizedBox(height: 20),
                  defultButton(
                      text: 'login',
                    onpressed: () {
                      if(formKey.currentState!.validate()){
                        print(emailControl.text);
                        print(passwordControl.text);
                      }
                    },
                    Color: Colors.green,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an ccount',
                        style: TextStyle(
                          fontSize: 15
                        ),
                      ),
                      TextButton(
                          onPressed: ()
                          {

                          },
                          child:Text(
                              'Registre Now?'
                          )
                      )
                    ],
                  ),

                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}
