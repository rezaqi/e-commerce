import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/favorite_controller.dart';
import 'package:rezaqi_ecommerce/controller/appPages/item._controller.dart';
import 'package:rezaqi_ecommerce/data/model/items_model.dart';
import 'package:rezaqi_ecommerce/links.dart';

import '../../../core/constant/colors.dart';
import '../../../core/funcation/tran_data.dart';

class CustomListItems extends GetView<ItemControllerImp> {
  final ItemsModel itemsModel;
  //final RatingModel ratingModel;

  const CustomListItems({
    super.key,
    required this.itemsModel,
    //  required this.ratingModel,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return Container(
      decoration: BoxDecoration(
        color: AppColor.seCo,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          controller.goToProduct(itemsModel);
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 155,
                width: double.infinity,
                child: Hero(
                  tag: "${itemsModel.itemsId}",
                  child: Image.network(
                    "${AppLinks.imageItem}/${itemsModel.itemsImage}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: 155,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [
                        AppColor.blackWithOpacity,
                        const Color.fromARGB(255, 255, 255, 255).withOpacity(0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      tileMode: TileMode.mirror,
                      stops: const [0, 1])),
            ),
            GetBuilder<FavoriteController>(builder: (controller) {
              return Positioned(
                right: 10,
                child: InkWell(
                  onTap: () {
                    if (controller.isFav[itemsModel.itemsId.toString()] ==
                        '1') {
                      print("remove");
                      controller.setFav(itemsModel.itemsId.toString(), '0');
                      controller.removetFav(itemsModel.itemsId.toString());
                    } else {
                      print("adds");
                      controller.setFav(itemsModel.itemsId.toString(), '1');
                      controller.addFav(itemsModel.itemsId.toString());
                    }

                    print(controller.isFav);
                  },
                  child: Icon(
                    controller.isFav[itemsModel.itemsId] == '1'
                        ? Icons.favorite_sharp
                        : Icons.favorite_border_rounded,
                    color: controller.isFav[itemsModel.itemsId] == '1'
                        ? Colors.redAccent
                        : Colors.white,
                    size: 30,
                  ),
                ),
              );
            }),
            itemsModel.itemsDiscount != '0'
                ? Container(
                    height: 20,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: const BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10))),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "${itemsModel.itemsDiscount}%",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ))
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${TranData(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star_outline_sharp,
                                size: 19,
                              )),
                      // controller.start(
                      // ratingModel.stars!,
                      // itemsModel.itemsId!.toString(),
                      // ratingModel.itemsId.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "\$ ${itemsModel.itemsPriceDiscount}",
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 120, 255, 215)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
