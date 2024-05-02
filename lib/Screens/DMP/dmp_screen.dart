import 'package:flutter/material.dart';

import '../../Utils/color.dart';

class DmpScreen extends StatefulWidget {
  const DmpScreen({Key? key}) : super(key: key);

  @override
  State<DmpScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<DmpScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: AppColor.whiteColor,)),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2 ,
                children: List.generate(50,(index){
                  return Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/dummy_img.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
