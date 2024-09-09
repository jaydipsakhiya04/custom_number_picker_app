import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PickerController extends GetxController {
  RxInt currentIntValue = 800.obs;
  RxString number = ''.obs;
  String Function(String)? textMapper;
  var isPickerVisible = false.obs;
  TextEditingController start=TextEditingController();
}
