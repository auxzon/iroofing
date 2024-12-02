import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iroofing/common/Color/Colordata.dart';
import 'package:iroofing/common/Navigation/navigation.dart';
import 'package:iroofing/common/bottomsheet/controller/bottomsheetcontroller.dart';
import 'package:iroofing/main.dart';
import 'package:iroofing/presentation/ongoingassignment/ui/ongoingassignmentscreen.dart';
import 'package:iroofing/presentation/profile/ui/profilescreen.dart';
import 'package:iroofing/presentation/sitevisitassignment/ui/sitevisitorassignment_screen.dart';
import 'package:iroofing/presentation/sitevisitor/ui/sitevisitor_screen.dart';

import '../../../presentation/Notification/ui/notificationscreen.dart';
import '../../text/textdata.dart';

class Bottomsheet extends StatelessWidget {
  Bottomsheet();
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BottomSheetcntroller());
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
      body: Column(
        children: [
          Obx(
            () => Expanded(
                child: controller.sitevisitor.value
                    ? SitevisitorScreen()
                    : controller.ongoingassignment.value
                        ? Ongoingassignmentscreen()
                        : controller.sitevisitorassignment.value
                            ? SitevisitorassignmentScreen()
                            : ProfileScreen()),
          ),
          Material(
            color: ColorData.whitecolor,
            elevation: 20,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.sitevisitorfun();
                      },
                      icon: controller.sitevisitor.value
                          ? Image.asset("assets/home.png")
                          : Image.asset("assets/unhome.png")),
                  IconButton(
                      onPressed: () {
                        controller.ongoingassignmentfun();
                      },
                      icon: controller.ongoingassignment.value
                          ? Image.asset("assets/ongoingass.png")
                          : Image.asset("assets/unongoingass.png")),
                  IconButton(
                      onPressed: () {
                        controller.sitevisitorassignmentfun();
                      },
                      icon: controller.sitevisitorassignment.value
                          ? Image.asset("assets/sitevisit.png")
                          : Image.asset("assets/unsitevisit.png")),
                  IconButton(
                      onPressed: () {
                        controller.profilefun();
                      },
                      icon: controller.profile.value
                          ? Image.asset("assets/profile.png")
                          : Image.asset("assets/unprofile.png")),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
