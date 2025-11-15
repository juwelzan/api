import 'package:api/controllers/controller.dart';
import 'package:api/controllers/state_controller.dart';
import 'package:api/widgets/custom_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final stateControl = Get.put<StateController>(StateController());
  final controller = Get.put<Controller>(Controller());

  bool isopen = false;
  double mainAxisExtent = 325;
  double height = 95;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    if (size < 600) {
      mainAxisExtent = 325;
      height = 97;
    } else {
      mainAxisExtent = 350;
      height = 124;
    }
    return Scaffold(
      appBar: AppBar(title: Text("API Calling")),
      body: Obx(() {
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 6.sp),
          itemCount: controller.allProduct.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisExtent: mainAxisExtent, //325,
          ),
          itemBuilder: (context, index) {
            final data = controller.allProduct.value[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onLongPress: () {
                  stateControl.isOpen.value = index;
                },

                child: CustomCard(
                  isopen: index,
                  height: height,
                  img: data.img,
                  productName: data.productName,
                  price: data.unitPrice.toString(),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
