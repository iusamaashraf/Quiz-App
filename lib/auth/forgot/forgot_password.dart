import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/auth/login/login_screen.dart';
import 'package:quiz_app/utils/size_config.dart';
import 'package:quiz_app/widgets/my_input_field.dart';
import 'package:quiz_app/widgets/primary_button.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

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
                  validator: (val) {
                    return '';
                  },
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                PrimaryButton(
                  onTap: () {
                    Get.to(() => LoginScreen());
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
}
