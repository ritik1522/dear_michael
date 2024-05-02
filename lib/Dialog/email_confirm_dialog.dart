import 'package:flutter/material.dart';

import '../Utils/Routes/routes_name.dart';
import '../Utils/buttons.dart';
import '../Utils/color.dart';
import '../Utils/common_widget.dart';

class EmailConfirmDialog extends StatelessWidget {
  const EmailConfirmDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      decoration: BoxDecoration(
        color: AppColor.dialogBackColor, //Colors.black.withOpacity(0.3),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),

        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,// To make the card compact
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.all(10),
            child:  Image.asset('assets/images/dialog_tick.png'),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: MediumText("Congratulations", 16, AppColor.whiteColor, TextAlign.center)),
          const SizedBox(height: 10,),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: CommonText("Your email has been verified succesfully", 13, AppColor.hintColor, TextAlign.center)),

          const SizedBox(height: 20,),
          ///--------------------------------Button--------------------------

          SizedBox(
            width: double.infinity,
            height: 50,
            child: RoundedButton(
                text: "Continue",
                color: AppColor.whiteColor,
                buttonColor: AppColor.buttonColor,
                radios: 30,
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.newPasswords);
                }),
          )

        ],
      ),

    );
  }
}
