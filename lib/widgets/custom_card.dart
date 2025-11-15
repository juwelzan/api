import 'package:api/controllers/state_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final double height;
  final int isopen;
  final String img;
  final String productName;
  final String price;
  CustomCard({
    super.key,
    required this.isopen,
    required this.height,
    required this.img,
    required this.productName,
    required this.price,
  });
  final stateControl = Get.put<StateController>(StateController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffE9B3FB),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              print("object");
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 190,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.sp),
                      topRight: Radius.circular(10.sp),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(img),
                    ),
                  ),
                ),
                Gap(6.h),
                Padding(
                  padding: EdgeInsets.only(top: 6.sp, right: 6.sp, left: 6.sp),
                  child: SizedBox(
                    height: height, //95,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: AutoSizeText(
                            productName,
                            maxLines: 3,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Gap(6.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 80,
                              child: AutoSizeText(
                                "\$$price",
                                maxLines: 1,

                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.sp),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0.sp),
                                  child: Text(
                                    "Add Card",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            return Visibility(
              visible: stateControl.isOpen.value == isopen,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            stateControl.isOpen.value = 123460908765432;
                          },
                          icon: Icon(Icons.cancel, color: Colors.white),
                        ),
                      ],
                    ),
                    Gap(50.h),
                    ElevatedButton(
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                textAlign: TextAlign.center,
                                "Delete Item",
                              ),
                            );
                          },
                        );
                        stateControl.isOpen.value = 123460908765432;
                      },
                      child: Text("Edit"),
                    ),
                    Gap(10.h),
                    ElevatedButton(
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                textAlign: TextAlign.center,
                                "Delete Item",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Color(0xffE62727),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("No"),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Color(0xffE62727),
                                      ),
                                      onPressed: () {},
                                      child: Text("Yes"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        stateControl.isOpen.value = 123460908765432;
                      },
                      child: Text("Delete"),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
