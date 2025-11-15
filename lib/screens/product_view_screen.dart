import 'package:api/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductViewScreen extends StatelessWidget {
  final DataModel dataModel;
  const ProductViewScreen({super.key, required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset("assets/previous.png", width: 30.sp),
            ),
            expandedHeight: 300,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(dataModel.img, fit: BoxFit.cover),
            ),
          ),
          SliverGap(20.h),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Card(
                  child: ListTile(
                    title: Text("Product Name"),
                    subtitle: Text(dataModel.productName),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text("Quantity"),
                    subtitle: Text(dataModel.qty.toString()),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text("Unit Price"),
                    subtitle: Text(dataModel.unitPrice.toString()),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text("Total Price"),
                    subtitle: Text(dataModel.totalPrice.toString()),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
