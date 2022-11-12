import 'package:first/shared/components/components.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordShow=true ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'SHE IN',
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormFeild(
                      controller: emailController,
                      label: 'email address',
                      prefix: Icons.email,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'email must not be empty';
                        } else {
                          return null;
                        }
                      },
                      type: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormFeild(
                      controller: passWordController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'password  must not be empty';
                        } else {
                          return null;
                        }
                      },
                      label: 'PassWord',
                      prefix: Icons.lock,
                      suf:  isPasswordShow?Icons.visibility:Icons.visibility_off,
                      isPassword: isPasswordShow,
                      onPress:(){
                        setState(() {
                           isPasswordShow = !isPasswordShow;
                        });

                      } ,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text: 'log in',
                    function: () {
                      if (formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passWordController.text);
                      }
                    },
                    hieght: 50.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text: 'register',
                    function: () {},
                    hieght: 50.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have account?'),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Register Now',
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
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
