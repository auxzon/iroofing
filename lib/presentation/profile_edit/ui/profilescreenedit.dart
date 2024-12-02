import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iroofing/common/bottomsheet/ui/BottomSheet.dart';
import 'package:iroofing/common/common_textfield/common_textfield.dart';
import 'package:iroofing/common/elevted_button/ElevatedButton.dart';
import 'package:iroofing/common/text/textdata.dart';

import '../../../common/Color/Colordata.dart';
import '../../../common/Navigation/navigation.dart';
import '../../../common/bottomsheet/controller/bottomsheetcontroller.dart';
import '../../../main.dart';
import '../../Notification/ui/notificationscreen.dart';

class ProfilescreenEdit extends StatelessWidget {
  ProfilescreenEdit({super.key});

  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.bgcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorData.maincolor,
        title: Image.asset(
          "assets/logo.png",
          height: MyApp.height * .05,
        ),
        actions: [
              IconButton(
              onPressed: () {
                Navi.toOff(NotificationScreen());
              },
              icon: Badge(
                label: TextThemedel(text: "5"),
                child: Icon(
                  CupertinoIcons.bell_fill,
                  color: ColorData.whitecolor,
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      var controller = Get.put(BottomSheetcntroller());
                      controller
                          .profilefun(); // Set the profile observable to true
                      Navi.to(Bottomsheet());
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ],
              ),
              Material(
                elevation: 10,
                child: Container(
                  height: MyApp.height * .75,
                  decoration: BoxDecoration(
                      color: ColorData.whitecolor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MyApp.height * .02,
                      ),
                      Stack(
                        children: [
                          Material(
                            shape: CircleBorder(
                              side: BorderSide(
                                color: ColorData.whitecolor,
                                width: MyApp.width * 0.008,
                              ),
                            ),
                            elevation: 5, // Softer shadow
                            child: CircleAvatar(
                              radius: MyApp.width * 0.15, // Simplified radius calculation
                              backgroundImage: AssetImage('assets/profileimg.png'),
                            ),
                          ),
                          // Positioned Edit Icon
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                // Handle edit button press
                              },
                              child: Material(
                                shape: CircleBorder(),
                                color: ColorData.maincolor, // Background color for edit button
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0), // Add padding around the icon
                                  child: Icon(
                                    Icons.edit,
                                    color: ColorData.whitecolor,
                                    size: 16, // Adjust icon size
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MyApp.height * .05,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextThemedel(
                                    text: "name       ",
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                  ),
                                  Expanded(
                                    child: CommonTextField(
                                      useUnderlineBorder: true,
                                      controller: name,
                                      contentpadding: 10,
                                      border: 5,
                                      enableborder: 5,
                                      focusborder: 5,
                                      labelstyle: TextStyle(
                                          color:
                                              ColorData.textfieldunfocuscolor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MyApp.height * .02,
                              ),
                              Row(
                                children: [
                                  TextThemedel(
                                    text: "Email id   ",
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                  ),
                                  Expanded(
                                    child: CommonTextField(
                                      useUnderlineBorder: true,
                                      controller: email,
                                      contentpadding: 10,
                                      border: 5,
                                      enableborder: 5,
                                      focusborder: 5,
                                      labelstyle: TextStyle(
                                          color:
                                              ColorData.textfieldunfocuscolor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MyApp.height * .02,
                              ),
                              Row(
                                children: [
                                  TextThemedel(
                                    text: "Phone no  ",
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                  ),
                                  Expanded(
                                    child: CommonTextField(
                                      useUnderlineBorder: true,
                                      controller: phone,
                                      contentpadding: 10,
                                      border: 5,
                                      enableborder: 5,
                                      focusborder: 5,
                                      labelstyle: TextStyle(
                                          color: ColorData.textfieldunfocuscolor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MyApp.height * .02,
                              ),
                              Row(
                                children: [
                                  TextThemedel(
                                    text: "Password  ",
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                  ),
                                  Expanded(
                                    child: CommonTextField(
                                      useUnderlineBorder: true,
                                      controller: pass,
                                      contentpadding: 10,
                                      border: 5,
                                      enableborder: 5,
                                      focusborder: 5,
                                      labelstyle: TextStyle(
                                          color: ColorData.textfieldunfocuscolor),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CommonMaterialButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: TextThemedel(
                                      text: "Save",
                                      color: ColorData.whitecolor,
                                    ),
                                    color: ColorData.textbluecolor,
                                    onPressed: () {
                                      Navi.toOff(Bottomsheet());
                                    },
                                  ),
                                  SizedBox(
                                    width: MyApp.width * .1,
                                  ),
                                  CommonMaterialButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    color: ColorData.cancelbuttoncolor,
                                    child: TextThemedel(
                                      text: "Cancel",
                                      color: ColorData.whitecolor,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MyApp.height * .05,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
