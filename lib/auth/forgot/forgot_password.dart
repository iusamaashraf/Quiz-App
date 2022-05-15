import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/auth/login/login_screen.dart';
import 'package:quiz_app/utils/size_config.dart';
import 'package:quiz_app/widgets/my_input_field.dart';
import 'package:quiz_app/widgets/primary_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 4 * SizeConfig.widthMultiplier),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password',
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
                  validator: (email) {},
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                PrimaryButton(
                  onTap: () {
                    resetPassword();
                  },
                  text: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Get.snackbar('Reset', 'link sent to your email');
    } catch (e) {
      print(e.toString());
    }
  }
}
