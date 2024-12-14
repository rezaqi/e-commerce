import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/item._controller.dart';
import 'package:rezaqi_ecommerce/data/model/categories.dart';

import '../../../core/constant/colors.dart';
import '../../../core/funcation/tran_data.dart';

class CustomItemsCategories extends GetView<ItemControllerImp> {
  const CustomItemsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    return SizedBox(
      height: 100,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) => Categories(
                i: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]),
              )),
    );
  }
}

class Categories extends StatefulWidget {
  final int i;
  final CategoriesModel categoriesModel;
  const Categories({super.key, required this.i, required this.categoriesModel});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    ItemControllerImp controller = Get.put(ItemControllerImp());

    return Column(
      children: [
        InkWell(
          onTap: () {
            controller.changeCat(
                widget.i, widget.categoriesModel.categoriesId!.toString());
          },
          child: GetBuilder<ItemControllerImp>(builder: (c) {
            return Text(
              " ${TranData(widget.categoriesModel.categoriesNameAr, widget.categoriesModel.categoriesName)}",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: c.selectedCat == widget.i
                      ? AppColor.seCo
                      : AppColor.blackWithOpacity),
            );
          }),
        ),
      ],
    );
  }
}
