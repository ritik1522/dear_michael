import 'package:dear_michael/Utils/buttons.dart';
import 'package:dear_michael/Utils/color.dart';
import 'package:dear_michael/Utils/common_widget.dart';
import 'package:flutter/material.dart';

import '../../Utils/Routes/routes_name.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_img.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", height: 75,),
            const SizedBox(height: 20,),
            MediumText(
                "Welcome to the Dear Michael Project. For many decades now, we have read, watched, listened, and consumed any, and all pieces of media that would help teach us more about Michael Jordan. We learned about his passion for the game, his unrelenting desire to win, and his drive for excellence. We have gotten to hear the legend tell us in his own words what drove him to greatness, but he has never heard from us, the bystanders, on how his strive for greatness inspired and motivated us.",
                12, AppColor.whiteColor, TextAlign.center),
            const SizedBox(height: 10,),
            MediumText(
                "The purpose of this website is to serve as a thank you to Michael Jordan. To let him know how much we appreciate him and all that he gave to the game of basketball, and our lives. Join in, create an account, and post your happy birthday video to his airness",
                12, AppColor.whiteColor, TextAlign.center),

            const SizedBox(height: 20,),
            SizedBox(
              width: width,
              height: 50,
              child: RoundedButton(text: "Continue",
                  color: AppColor.whiteColor,
                  buttonColor: AppColor.buttonColor,
                  radios: 30,
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.login);

                  }),
            )
          ],
        ),
      ),
    );
  }
}
