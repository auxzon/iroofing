import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iroofing/common/Color/Colordata.dart';
import 'package:iroofing/common/Navigation/navigation.dart';
import 'package:iroofing/presentation/Notification/ui/notificationscreen.dart';
import '../../../main.dart';
import '../../../presentation/ongoingassignment/ui/ongoingassignmentscreen.dart';
import '../../../presentation/profile/ui/profilescreen.dart';
import '../../../presentation/sitevisitassignment/ui/sitevisitorassignment_screen.dart';
import '../../../presentation/sitevisitor/ui/sitevisitor_screen.dart';
import '../../text/textdata.dart';
import '../controller/bottomsheetcontroller.dart';

class Bottomsheet extends StatelessWidget {
  Bottomsheet({Key? key}) : super(key: key);

  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BottomSheetcntroller());

    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (lastPressed == null || now.difference(lastPressed!) > const Duration(seconds: 2)) {
          lastPressed = now;
          Fluttertoast.showToast(
            msg: "Press back button twice to exit",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
          return false; // Do not exit the app
        }
        SystemNavigator.pop(); // Exit the app
        return true;
      },
      child: Scaffold(
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
              ),
            )
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
                    : ProfileScreen(),
              ),
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
                          : Image.asset("assets/unhome.png"),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.ongoingassignmentfun();
                      },
                      icon: controller.ongoingassignment.value
                          ? Image.asset("assets/ongoingass.png")
                          : Image.asset("assets/unongoingass.png"),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.sitevisitorassignmentfun();
                      },
                      icon: controller.sitevisitorassignment.value
                          ? Image.asset("assets/sitevisit.png")
                          : Image.asset("assets/unsitevisit.png"),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.profilefun();
                      },
                      icon: controller.profile.value
                          ? Image.asset("assets/profile.png")
                          : Image.asset("assets/unprofile.png"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
