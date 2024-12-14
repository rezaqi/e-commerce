import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/home/home_controller.dart';
import 'package:rezaqi_ecommerce/data/model/categories.dart';

import '../../../core/constant/colors.dart';
import '../../../core/funcation/tran_data.dart';

class CustomCategories extends GetView<HomeControllerImp> {
  const CustomCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
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

class Categories extends GetView<HomeControllerImp> {
  final int i;

  final CategoriesModel categoriesModel;
  const Categories({super.key, required this.i, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            controller.goToItem(
              controller.categories,
              i,
              categoriesModel.categoriesId!,
            );
          },
          child: Text(
            "${TranData(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColor.blackWithOpacity),
          ),
        ),
      ],
    );
  }
}
