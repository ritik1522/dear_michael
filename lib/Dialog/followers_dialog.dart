import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Utils/Routes/routes_name.dart';
import '../Utils/buttons.dart';
import '../Utils/color.dart';
import '../Utils/common_widget.dart';

class FollowersDialog extends StatelessWidget {
  const FollowersDialog({Key? key}) : super(key: key);

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

          ///-------------------------------Cross Icon----------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BoldText("Followers", 17, AppColor.whiteColor, TextAlign.start),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: Image.asset("assets/icons/cross_icon.png",height: 15,)),
            ],
          ),

          const SizedBox(height: 20,),
          Container(height: 1.5,width: double.infinity,color: AppColor.hintColor,),
          const SizedBox(height: 10,),
          Container(
              height: MediaQuery.of(context).size.height*0.6,
              child: ListView.builder(itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/user_image.png",height: 40,width: 40,),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: CommonTextOverFlowed("Jhon Deo", 16, AppColor.whiteColor, TextAlign.start)),
                          SizedBox(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: CommonTextOverFlowed("jhondeo@yopmail.com", 12, AppColor.whiteColor, TextAlign.start))
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.whiteColor
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: MediumText("Remove", 15, AppColor.dialogBackColor, TextAlign.center),
                  )
                ],
              ),
            );
          })),
        ],
      ),

    );
  }
}
