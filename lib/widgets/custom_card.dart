import 'package:api/controllers/controller.dart';
import 'package:api/controllers/state_controller.dart';
import 'package:api/models/data_model.dart';
import 'package:api/screens/product_view_screen.dart';
import 'package:api/widgets/product_edit_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  final String id;
  final DataModel model;
  final int tag;

  CustomCard({
    super.key,
    required this.isopen,
    required this.height,
    required this.img,
    required this.productName,
    required this.price,
    required this.id,
    required this.model,
    required this.tag,
  });
  final stateControl = Get.put<StateController>(StateController());
  final controller = Get.put<Controller>(Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff62109F),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductViewScreen(dataModel: model, tag: tag),
                ),
              );
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
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.sp),
                      topRight: Radius.circular(10.sp),
                    ),
                    child: Hero(
                      tag: tag,
                      child: CachedNetworkImage(
                        imageUrl: img,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, _) =>
                            Center(child: Icon(Icons.broken_image, size: 40)),
                      ),
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
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
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

                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
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
                  color: Colors.black87,
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
                    Builder(
                      builder: (ctx) {
                        return ElevatedButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: ctx,
                              builder: (context) {
                                return ProductEditDialog(context, model);
                              },
                            );
                            stateControl.isOpen.value = 123460908765432;
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff49FF00),
                            foregroundColor: Colors.black,
                            textStyle: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                            ),
                          ),
                          child: Text("Edit"),
                        );
                      },
                    ),
                    Gap(10.h),
                    Builder(
                      builder: (ctx) {
                        return ElevatedButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: ctx,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text(
                                    textAlign: TextAlign.center,
                                    "Delete Item",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.black,
                                            backgroundColor: Color(0xff49FF00),
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
                                          onPressed: () {
                                            controller.deleteProduct(id);
                                            Navigator.pop(context);
                                          },
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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffE62727),
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                            ),
                          ),
                          child: Text("Delete"),
                        );
                      },
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
