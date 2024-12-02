import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iroofing/common/Color/Colordata.dart';
import 'package:iroofing/common/Navigation/navigation.dart';
import 'package:iroofing/common/text/textdata.dart';
import 'package:iroofing/main.dart';
import 'package:iroofing/presentation/profile_edit/ui/profilescreenedit.dart';
import 'package:iroofing/presentation/splashscreen/ui/SplashScreen.dart';

import '../controller/profilecontroller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 5,
        color: ColorData.whitecolor,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MyApp.height * .25,
                  width: MyApp.width,
                ),
                Container(
                  height: MyApp.height * .2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logo.png"),
                          fit: BoxFit.contain)),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                      onPressed: () {
                        print("df");
                        Navi.toOff(ProfilescreenEdit());
                        // Get.off(() => ProfilescreenEdit());
                      },
                      icon: Image.asset("assets/prifileedit.png")),
                ),
                Positioned(
                  bottom: 0,
                  left: MyApp.width * .02,
                  child: Material(
                    elevation: 10,
                    shape: CircleBorder(
                        side: BorderSide(
                            color: ColorData.whitecolor,
                            width: MyApp.width * .009)),
                    child: CircleAvatar(
                      radius: MyApp.width * .009 * MyApp.height * .02,
                      backgroundImage: AssetImage('assets/profileimg.png'),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: MyApp.height * .04),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorData.textfieldunfocuscolor,
                    width: 1.0,
                  ),
                ),
              ),
              child: ListTile(
                leading: Icon(Icons.person),
                title: TextThemedel(
                  text: "Akhil C J",
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorData.textfieldunfocuscolor,
                    width: 1.0,
                  ),
                ),
              ),
              child: ListTile(
                leading: Icon(Icons.email),
                title: TextThemedel(
                  text: "akhilcj@gmail.com",
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorData.textfieldunfocuscolor,
                    width: 1.0,
                  ),
                ),
              ),
              child: ListTile(
                leading: Icon(Icons.phone),
                title: TextThemedel(
                  text: "+91 8767 5432 52",
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorData.textfieldunfocuscolor,
                    width: 1.0,
                  ),
                ),
              ),
              child: ListTile(
                leading: Icon(Icons.lock),
                title: TextThemedel(
                  text: "********",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navi.toOff(Splashscreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorData.textfieldunfocuscolor,
                      width: 1.0,
                    ),
                  ),
                ),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: TextThemedel(
                    text: "Logout",
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: ColorData.whitecolor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ColorData.textfieldunfocuscolor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.grid_view_outlined,
                      ),
                      SizedBox(width: MyApp.width * .02),
                      TextThemedel(
                        text: "Project Completed",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextThemedel(
                        text: "55",
                        fontWeight: FontWeight.bold,
                        color: ColorData.maincolor,
                        fontSize: 15,
                      ),
                      SizedBox(width: MyApp.width * .02),
                      Icon(Icons.check, color: Colors.green)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
