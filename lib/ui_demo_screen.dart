import 'package:aap_check_demo/picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class UiDemoScreen extends StatelessWidget {
  UiDemoScreen({Key? key}) : super(key: key);

  PickerController controller = Get.put(PickerController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onTap: () {
                      controller.isPickerVisible.value = true;
                    },
                    readOnly: true,
                    controller: controller.start,
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ],
            ).paddingAll(16),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            Obx(
              () => Visibility(
                visible: controller.isPickerVisible.value,
                child: Container(
                  child: Column(
                    children: [
                      Obx(
                        () => NumberPicker(
                          textStyle: TextStyle(
                            fontSize: 35,
                            color: Colors.brown.withOpacity(0.7),
                          ),
                          isCustom: true,


                          itemWidth: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2)),
                          value: controller.currentIntValue.value,
                          minValue:0,
                          // 0
                          maxValue: 24000,
                          // 1000
                          step: 200,
                          // Move in steps of 200
                          selectedTextStyle: const TextStyle(
                              fontSize: 37,
                              color: Colors.brown,
                              fontWeight: FontWeight.w600),

                          textMapper: controller.textMapper,
                          haptics: false,
                          onChanged: (value) {
                            controller.currentIntValue.value = value;
                            controller.start.text = value.toString();

                            // Optionally hide the NumberPicker after selection
                            // controller.isPickerVisible.value = false;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
