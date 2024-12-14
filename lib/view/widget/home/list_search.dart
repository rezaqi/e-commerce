import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rezaqi_ecommerce/controller/appPages/search_conntroller.dart';
import 'package:rezaqi_ecommerce/links.dart';

import '../../../data/model/items_model.dart';

class CustomListSearch extends GetView<SearchMaxController> {
  final List<ItemsModel> listSearch;
  const CustomListSearch({super.key, required this.listSearch});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchMaxController());
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listSearch.length,
      itemBuilder: (context, i) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: SizedBox(
          height: 80,
          width: Get.width,
          child: InkWell(
            onTap: () {
              controller.goToProductSearch(listSearch[i]);
            },
            child: Card(
              color: Colors.white.withOpacity(0.6),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                          "${AppLinks.imageItem}/${listSearch[i].itemsImage}")),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "${listSearch[i].itemsName}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
