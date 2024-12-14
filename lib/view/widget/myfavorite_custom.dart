import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/favorite_controller.dart';
import 'package:rezaqi_ecommerce/controller/appPages/myfavorite_controller.dart';
import 'package:rezaqi_ecommerce/data/model/items_model.dart';
import 'package:rezaqi_ecommerce/data/model/myfavorite_model.dart';
import '../../core/constant/colors.dart';
import '../../core/funcation/tran_data.dart';

class CustomMyfavorite extends GetView<MyfavoriteController> {
  const CustomMyfavorite(
      {super.key, required this.itemsModel, required this.myfavoriteModel});
  final ItemsModel itemsModel;
  final MyfavoriteModel myfavoriteModel;

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return Container(
      decoration: BoxDecoration(
        color: AppColor.seCo,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 155,
                width: double.infinity,
                child: Image.network(
                  '${itemsModel.itemsImage}',
                  fit: BoxFit.cover,
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
            InkWell(
              onTap: () {
                (controller.deletData(myfavoriteModel.favoriteId!));
                Get.appUpdate();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 130, vertical: 5),
                child: Icon(
                  Icons.favorite_sharp,
                  color: Colors.redAccent,
                  size: 30,
                ),
              ),
            ),
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
                    children: [
                      ...List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star_outline_sharp,
                                size: 19,
                              )),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "\$ ${itemsModel.itemsPrice}",
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 120, 255, 215)),
                              ),
                            ],
                          ),
                        ),
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
