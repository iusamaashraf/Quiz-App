import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/auth/controller/auth_controller.dart';
import 'package:quiz_app/auth/forgot/forgot_password.dart';
import 'package:quiz_app/auth/signup/signup_page.dart';
import 'package:quiz_app/panels/admin/views/dashboard_page.dart';
import 'package:quiz_app/panels/user/views/student_attempt_page.dart';
import 'package:quiz_app/utils/size_config.dart';
import 'package:quiz_app/widgets/my_input_field.dart';
import 'package:quiz_app/widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    void inputValidation() {
      if (_formKey.currentState!.validate()) {
        // print('not validate');
      } else {
        Get.to(() => const DashboardPage());
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 4 * SizeConfig.widthMultiplier),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 10 * SizeConfig.heightMultiplier),
                  MyInputField(
                    controller: emailController,
                    hint: 'Email',
                    textInputType: TextInputType.emailAddress,
                    validator: (val) {
                      // ignore: unnecessary_null_comparison
                      if (val!.isEmpty || val == null) {
                        return 'required';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  MyInputField(
                    controller: passwordController,
                    hint: 'Password',
                    textInputType: TextInputType.emailAddress,
                    isObsure: true,
                    validator: (val) {
                      // ignore: unnecessary_null_comparison
                      if (val!.isEmpty || val == null) {
                        return 'required';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  PrimaryButton(
                    onTap: () {
                      // if (emailController.text == 'teacher') {
                      //   inputValidation();
                      // }
                      // if (emailController.text == 'student') {
                      //   Get.to(() => StudentAttemptPage());
                      // }
                      controller.login(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                    text: 'Login',
                  ),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[800]),
                    ),
                    onPressed: () {
                      Get.to(() => SignupPage());
                    },
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[800]),
                    ),
                    onPressed: () {
                      Get.to(() => ForgotPasswordPage());
                    },
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white),
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
