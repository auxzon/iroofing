import 'package:get/get.dart';

class BottomSheetcntroller extends GetxController {
  var sitevisitor = true.obs;
  var ongoingassignment = true.obs;
  var sitevisitorassignment = true.obs;
  var profile = true.obs;

  sitevisitorfun() {
    sitevisitor.value = true;
    ongoingassignment.value = false;
    sitevisitorassignment.value = false;
    profile.value = false;
  }

  ongoingassignmentfun() {
    ongoingassignment.value = true;
    sitevisitor.value = false;
    sitevisitorassignment.value = false;
    profile.value = false;
  }

  sitevisitorassignmentfun() {
    sitevisitorassignment.value = true;
    ongoingassignment.value = false;
    sitevisitor.value = false;
    profile.value = false;
  }

  profilefun() {
    profile.value = true;
    ongoingassignment.value = false;
    sitevisitorassignment.value = false;
    sitevisitor.value = false;
  }

  @override
  void onInit() {
    sitevisitorfun();
    // TODO: implement onInit
    super.onInit();
  }
}
