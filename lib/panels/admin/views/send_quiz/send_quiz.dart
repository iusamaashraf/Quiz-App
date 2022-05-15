import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/size_config.dart';

class SendQuizPage extends StatelessWidget {
  const SendQuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Sends to',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SizedBox.expand(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 8 * SizeConfig.heightMultiplier,
                      width: 100 * SizeConfig.widthMultiplier,
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Text('Baby')),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
