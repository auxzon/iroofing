import 'package:get/get.dart';

class siteassignment_detailsController extends GetxController {
  var showmeasurment = false.obs;

  togglemeasurmentvalue() {
    showmeasurment.value = !showmeasurment.value;
    if(showestimatecard.value==true)
    {
      showestimatecard.value = false;
    }
    print("showestimatecard.value : ${showestimatecard.value}");
    print("showing measurement :${showmeasurment.value}");
  }

  /// options
  var selectedIndex = (-1).obs;

  // List of dropdown options
  final options = ["Option 1", "Option 2", "Option 3"];

  var edit = true.obs;

  toggleedit() {
    edit.value = !edit.value;
    print("edit.value : ${edit.value}");
  }

  var showestimatecard = false.obs;

  toggleestimtecard() {
    showestimatecard.value = !showestimatecard.value;
    print("showestimatecard.value : ${showestimatecard.value}");
  }
}
