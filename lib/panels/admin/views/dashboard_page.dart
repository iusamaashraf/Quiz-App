import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/auth/controller/auth_controller.dart';
import 'package:quiz_app/panels/admin/views/create/create_quiz.dart';
import 'package:quiz_app/utils/size_config.dart';
import 'package:quiz_app/widgets/primary_button.dart';

import 'previous/previous_quiz.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final AuthController con = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
    con.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Teacher Dashboard',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 20 * SizeConfig.heightMultiplier,
              width: 20 * SizeConfig.widthMultiplier,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(con.getuser.imgPath!)),
                  color: Colors.white,
                  shape: BoxShape.circle),
            ),
            Text(con.getuser.name.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black)),
            Text(con.getuser.email.toString(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black)),
            const Spacer(),
            PrimaryButton(
                onTap: () {
                  Get.to(() => CreateQuiz());
                },
                text: 'Create Quiz'),
            SizedBox(height: 5 * SizeConfig.heightMultiplier),
            PrimaryButton(
                onTap: () {
                  Get.to(() => const PreviousQuiz());
                },
                text: 'Previous Quiz'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
