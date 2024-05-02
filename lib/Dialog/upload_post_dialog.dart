import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/Routes/routes_name.dart';
import '../Utils/buttons.dart';
import '../Utils/color.dart';
import '../Utils/common_widget.dart';

class UploadPostDialog extends StatefulWidget {
  const UploadPostDialog({Key? key}) : super(key: key);

  @override
  State<UploadPostDialog> createState() => _UploadPostDialogState();
}

class _UploadPostDialogState extends State<UploadPostDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 16.0,
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          // To make the card compact
          children: <Widget>[
            ///---------------------------------Video---------------------------------
        
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/images/reel_img.png"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MediumText("30s", 14, AppColor.whiteColor, TextAlign.start),
                  Image.asset("assets/icons/sound_icon.png",height: 20,width: 20,),
                ],
              ),
            ),
        
            const SizedBox(
              height: 15,
            ),
        
            ///--------------------------------Title--------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: MediumText(
                            "Title", 15, AppColor.whiteColor, TextAlign.start),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: AppColor.whiteColor, fontSize: 13),
                    cursorColor: AppColor.whiteColor,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: AppColor.hintColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: AppColor.hintColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: AppColor.hintColor)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        hintText: 'Title',
                        hintStyle:
                            TextStyle(color: AppColor.hintColor, fontSize: 13)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
        
            ///--------------------------------Description--------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: MediumText("Description", 15, AppColor.whiteColor,
                            TextAlign.start),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 5,
                    style: TextStyle(color: AppColor.whiteColor, fontSize: 13),
                    cursorColor: AppColor.whiteColor,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: AppColor.hintColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: AppColor.hintColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: AppColor.hintColor)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        hintText: 'Description',
                        hintStyle:
                            TextStyle(color: AppColor.hintColor, fontSize: 13)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
        
            ///--------------------------------Button--------------------------
        
            Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RoundedButton(
                  text: "Yes",
                  color: AppColor.whiteColor,
                  buttonColor: AppColor.buttonColor,
                  radios: 30,
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutesName.login, (route) => false);
                  }),
            ),
        
            ///--------------------------------Cancel Button--------------------------
        
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: SizedBox(
                width: double.infinity,
                  child: MediumText("Cancel", 15, AppColor.whiteColor, TextAlign.center)),
            ),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
