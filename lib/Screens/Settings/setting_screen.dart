import 'package:dear_michael/Dialog/delete_account_dialog.dart';
import 'package:dear_michael/Screens/Settings/setting_vm.dart';
import 'package:dear_michael/Utils/Routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../Utils/color.dart';
import '../../Utils/common_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColor.whiteColor,
            )),
        backgroundColor: AppColor.appBarBackground,
        elevation: 0.0,
      ),
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
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoldText("Settings", 18, AppColor.whiteColor, TextAlign.start),
                Row(
                  children: [
                    MediumText(
                        "Home / ", 15, AppColor.whiteColor, TextAlign.start),
                    MediumText(
                        "Settings", 15, AppColor.buttonColor, TextAlign.start)
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              width: width,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColor.dialogBackColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: BoldText("Manage account", 17, AppColor.whiteColor,
                        TextAlign.start),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: BoldText("Account control", 15, AppColor.whiteColor,
                        TextAlign.start),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BoldText("Delete account", 15, AppColor.whiteColor,
                            TextAlign.start),
                        GestureDetector(
                          onTap: (){
                            showDialog(context: context, builder: (context)=> const DeleteAccountDialog());
                          },
                          child: BoldText(
                              "Delete", 15, AppColor.buttonColor, TextAlign.start),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BoldText("Change password", 15, AppColor.whiteColor,
                            TextAlign.start),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, RoutesName.changePassword);
                          },
                          child: BoldText(
                              "Change", 15, AppColor.buttonColor, TextAlign.start),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: AppColor.textColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: BoldText("Push notification", 17, AppColor.whiteColor,
                        TextAlign.start),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText("Desktop notifications", 17,
                                AppColor.whiteColor, TextAlign.start),
                            const SizedBox(
                              height: 10,
                            ),
                            MediumText("Allow in browser", 13,
                                AppColor.whiteColor, TextAlign.start),
                          ],
                        ),
                        Consumer<SettingVm>(builder: (context, value, child) {
                          return CupertinoSwitch(
                            activeColor: AppColor.buttonColor,
                            trackColor: AppColor.textColor,
                            value: value.check,
                            onChanged: (values) {
                              value.checkChange(values);
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CommonText("Stay on top of notifications for likes, comments, the latest videos, and more on desktop. You can turn them off anytime.", 12, AppColor.textColor, TextAlign.start),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
