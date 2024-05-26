import 'package:e_commerce/Features/Auth/Repository/signin_repository.dart';
import 'package:e_commerce/Features/Auth/ViewModel/Services/signin_services.dart';
import 'package:e_commerce/Resources/Components/reusuable_button.dart';
import 'package:e_commerce/Features/Auth/ViewModel/Controller/signin_screen_controller.dart';
import 'package:e_commerce/Resources/Navigate/navigation.dart';
import 'package:e_commerce/Resources/Utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Resources/Constants/app_constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    SigninScreenController signinScreenController = SigninScreenController();
    final signinRepo = SigninRepository();
    final navigation = Navigation();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: signinScreenController.emailController.value,
                focusNode: signinScreenController.emailFocusNode.value,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    Get.snackbar('Email', 'Enter Email');
                  }
                },
                onFieldSubmitted: (value) {
                  Utilities.fieldFocusChange(
                      context,
                      signinScreenController.emailFocusNode.value,
                      signinScreenController.passwordFocusNode.value);
                },
              ),
              SizedBox(
                height: mq.height * 0.015,
              ),
              TextFormField(
                controller: signinScreenController.passwordController.value,
                focusNode: signinScreenController.passwordFocusNode.value,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    Get.snackbar('Password', 'Enter password');
                  }
                },
              ),
              SizedBox(
                height: mq.height * 0.015,
              ),
              Obx(
                () => ReusuableButton(
                    title: 'Signin',
                    loading: signinScreenController.loading.value,
                    onTap: () async{
                      if (formKey.currentState?.validate()?? false) {
                        await signinRepo.signinWithEmail(
                            signinScreenController.emailController.value.text,
                            signinScreenController.passwordController.value.text,
                        context
                        );
                      }
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                      onPressed: () => navigation.navigateToLoginScreenR(context),
                      child: Text(
                        'Login',
                        style: TextStyle(decoration: TextDecoration.underline),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
