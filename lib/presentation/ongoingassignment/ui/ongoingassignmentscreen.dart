import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iroofing/common/Color/Colordata.dart';
import 'package:iroofing/common/Navigation/navigation.dart';
import 'package:iroofing/common/elevted_button/ElevatedButton.dart';
import 'package:iroofing/common/text/textdata.dart';
import 'package:iroofing/core/ongoingassignmentWidgets/clientdetailssec.dart';
import 'package:iroofing/presentation/ongoingassignment/controller/ongoingassignment_controller.dart';
import 'package:iroofing/presentation/ongoingassignment_updatestatus/ui/ongoingassignmentupdatestatus.dart';

import '../../../common/common_textfield/common_textfield.dart';
import '../../../core/ongoingassignmentWidgets/card.dart';
import '../../../main.dart';

class Ongoingassignmentscreen extends StatelessWidget {
  const Ongoingassignmentscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchtext = TextEditingController();
    var controller = Get.put(OngoingScrrenController());
    return Container(
      color: ColorData.bgcolor,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Obx(
                () => Row(
              children: [
                Visibility(
                  child: TextThemedel(
                    text: "Ongoing Assignment",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: ColorData.maincolor,
                  ),
                  visible: controller.search.value,
                ),
                Visibility(
                  visible: controller.search.value,
                  child: SizedBox(
                    width: MyApp.width * .04,
                  ),
                ),
                controller.search.value ? Spacer() : SizedBox.shrink(),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: controller.search.value
                        ? IconButton(
                      key: ValueKey('searchIcon'),
                      onPressed: () {
                        controller.seesearch();
                      },
                      icon: Icon(Icons.search),
                      color: ColorData.maincolor,
                    )
                        : SizedBox(
                      key: ValueKey('searchField'),
                      height: MyApp.height * .04,
                      child: CommonTextField(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.seesearch();
                          },
                          child: Icon(Icons.cancel_outlined),
                        ),
                        controller: searchtext,
                        border: 10,
                        focusborder: 10,
                        enableborder: 10,
                        maxLines: 1,
                        maxLength: 20,
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorData.maincolor,
                        ),
                        contentpadding: 0,
                        hintText: "Search",
                        hintstyle: TextStyle(
                          color: ColorData.textfieldunfocuscolor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MyApp.height * .02,
          ),
          Obx(
            () => Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.search.value == false ? 1 : 10,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Obx(
                  () => controller.indexval.value != index
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Material(
                            elevation: 5,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.copy,
                                        size: 12,
                                        color: ColorData.textfieldunfocuscolor,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "VS 2351",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              ColorData.textfieldunfocuscolor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Circle Icon
                                      CircleAvatar(
                                        backgroundColor:
                                            ColorData.textfieldfocuscolor,
                                        child: Icon(
                                          Icons.content_paste_search_sharp,
                                          color: ColorData.whitecolor,
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      // Text Details
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: "Roofing type: ",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: ColorData.maincolor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: "Car Porch",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          ColorData.maincolor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            RichText(
                                              text: TextSpan(
                                                text: "Customer Name: ",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: ColorData
                                                      .textfieldunfocuscolor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: "Amal",
                                                    style: TextStyle(
                                                      color: ColorData
                                                          .textfieldunfocuscolor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: ColorData.maincolor,
                                                  size: 18,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "Kochi",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: ColorData.maincolor,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      // "See Details" Button
                                      CommonMaterialButton(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        elevation: 5,
                                        color: ColorData.maincolor,
                                        onPressed: () {
                                          controller.seedetailsfun(index);
                                        },
                                        child: TextThemedel(
                                          text: "See details",
                                          fontWeight: FontWeight.bold,
                                          color: ColorData.whitecolor,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  // Bottom Row with Location Icon and Address
                                ],
                              ),
                            ),
                          ))
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Material(
                            elevation: 5,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomRowWidget(
                                      controller: controller,
                                      tittle: "Client details",
                                      subtitle: "Car Porch",
                                      toptext: "VS 2351"),
                                  SizedBox(height: MyApp.height * .01),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ClientInfoCard(
                                          title: "Client Name",
                                          subtitle: "Arun K Thomas",
                                          Icons: CupertinoIcons
                                              .person_crop_circle),
                                      ClientInfoCard(
                                          title: "Phone no",
                                          subtitle: "+91 9876544356",
                                          Icons: CupertinoIcons.phone_fill),
                                      ClientInfoCard(
                                          title: "Location",
                                          subtitle: "Kochi",
                                          Icons: CupertinoIcons.location_solid),
                                      ClientInfoCard(
                                        title: "Total sq. ft ",
                                        subtitle: "1023.54 sq. ft",
                                        Icons: Icons.straighten,
                                        detailsiconinactive:
                                            Icons.arrow_drop_down,
                                        controller: controller,
                                        detailsiconctive: Icons.arrow_drop_up,
                                      ),
                                      ClientInfoCard(
                                          title: "Total Cost",
                                          subtitle: "₹57800/-",
                                          Icons: Icons.currency_rupee),
                                      ClientInfoCard(
                                          title: "Site Visited ",
                                          subtitle: "20-08-2024",
                                          Icons: Icons.calendar_month),
                                      ClientInfoCard(
                                          title: "Work Started",
                                          subtitle: "25-08-2024",
                                          Icons: Icons.calendar_month),
                                    ],
                                  ),
                                  SizedBox(height: MyApp.height * .02),
                                  Row(
                                    children: [
                                      TextThemedel(text: "Status"),
                                      SizedBox(width: MyApp.width * .05),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: ColorData.greebuttoncolorbg,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: TextThemedel(
                                          text: "Ongoing",
                                          fontWeight: FontWeight.bold,
                                          color: ColorData.greebuttoncolor,
                                        ),
                                      ),
                                      Spacer(),
                                      TextButton.icon(
                                          icon: Icon(
                                            Icons.image,
                                            color:
                                                ColorData.textfieldunfocuscolor,
                                          ),
                                          onPressed: () {},
                                          label: TextThemedel(
                                            text: "View image",
                                            color: ColorData.textbluecolor,
                                          ))
                                    ],
                                  ),
                                  SizedBox(height: MyApp.height * .02),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: ColorData
                                                    .textfieldunfocuscolor,
                                                width: 1)),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(CupertinoIcons.share),
                                            TextThemedel(text: "Export")
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: MyApp.width * .02),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: ColorData
                                                    .textfieldunfocuscolor,
                                                width: 1)),
                                        child: Icon(
                                          Icons.share,
                                          color:
                                              ColorData.textfieldunfocuscolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MyApp.height * .02),
                                  Center(
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Please",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              ColorData.textfieldunfocuscolor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: " ",
                                          ),
                                          TextSpan(
                                            text: "Click here",
                                            style: TextStyle(
                                              color: ColorData.textbluecolor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navi.toOff(
                                                    Ongoingassignmentupdatestatus());
                                                print("ji"); // Action on click
                                              },
                                          ),
                                          TextSpan(
                                            text: " to update the status.",
                                            style: TextStyle(
                                              color: ColorData
                                                  .textfieldunfocuscolor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MyApp.height * .02),
                                ],
                              ),
                            ),
                          )),
                );
              },
            )),
          )
        ],
      ),
    );
  }
}
