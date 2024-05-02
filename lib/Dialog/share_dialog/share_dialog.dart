import 'package:dear_michael/Dialog/share_dialog/share_dialog_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Utils/Routes/routes_name.dart';
import '../../Utils/buttons.dart';
import '../../Utils/color.dart';
import '../../Utils/common_widget.dart';

class ShareDialog extends StatelessWidget {
  const ShareDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.transparent,
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          // To make the card compact
          children: <Widget>[
            ///-------------------------------Cross Icon----------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoldText("Likes", 17, AppColor.whiteColor, TextAlign.start),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icons/cross_icon.png",
                      height: 15,
                    )),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1.5,
              width: double.infinity,
              color: AppColor.hintColor,
            ),
            const SizedBox(
              height: 10,
            ),

            Container(
              decoration: BoxDecoration(
                color: AppColor.searchBackColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextFormField(
                style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 13
                ),

                cursorColor: AppColor.whiteColor,

                decoration:  InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset("assets/icons/search_icn.png",height: 10,width: 10,),
                  ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    hintText: 'Search..',
                    hintStyle: TextStyle(
                        color: AppColor.hintColor,
                        fontSize: 13
                    )
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/user_image.png",
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CommonTextOverFlowed("Jhon Deo", 16,
                                    AppColor.whiteColor, TextAlign.start)),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: CommonTextOverFlowed(
                                    "jhondeo@yopmail.com",
                                    12,
                                    AppColor.whiteColor,
                                    TextAlign.start))
                          ],
                        ),
                      ],
                    ),
                    Consumer<ShareDialogVM>(builder: (context,value,child){
                      return GestureDetector(
                          onTap: () {

                            if (value.check) {
                              value.checkFalse();
                            } else {
                              value.checkTrue();
                            }

                          },

                          child: Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              (value.check)
                                  ? "assets/icons/check.png"
                                  : "assets/icons/uncheck.png",

                            ),
                          ));
                    }),
                  ],
                ),
              );
            })),
          ],
        ),
      ),
    );
  }
}
