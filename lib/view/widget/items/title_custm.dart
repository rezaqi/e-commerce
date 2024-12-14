import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controller/appPages/item._controller.dart';

class CustomTitlee extends StatefulWidget {
  final String title;
  final void Function()? ontapNotification;
  final void Function()? ontapMyfavorite;

  const CustomTitlee({
    super.key,
    required this.title,
    required this.ontapNotification,
    required this.ontapMyfavorite,
  });

  @override
  // ignore: no_logic_in_create_state
  State<CustomTitlee> createState() => _CustomTitleeState(
        title: title,
        ontapNotification: ontapNotification,
        ontapMyfavorite: ontapMyfavorite,
      );
}

class _CustomTitleeState extends State<CustomTitlee> {
  final String title;
  final void Function()? ontapNotification;
  final void Function()? ontapMyfavorite;

  _CustomTitleeState({
    required this.title,
    required this.ontapNotification,
    required this.ontapMyfavorite,
  });

  bool _long = true;
  String val = '';

  @override
  Widget build(BuildContext context) {
    // HomeControllerImp controller = Get.put(HomeControllerImp());
    ItemControllerImp controller = Get.put(ItemControllerImp());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.linear,
            height: _long ? 50 : 0,
            width: _long ? 140 : 0,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      height: _long ? 40 : 40,
                      width: _long ? 30 : 250,
                      decoration: BoxDecoration(
                        color: _long ? null : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: controller.search,
                        onChanged: (valk) {
                          controller.checkSearch(valk, controller.isSearch);
                          val = valk;
                          print("$val 0000000 val");
                        },
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0.5,
                                color: Color.fromARGB(0, 255, 255, 255)),
                          ),
                          prefixIcon: InkWell(
                            onTap: () async {
                              if (_long == true) {
                                setState(() {
                                  _long = false;
                                });
                                print("long = true");
                              } else if (_long == false) {
                                print("$val ------------- val");
                                controller.checkSearch(
                                    controller.search,
                                    val == ""
                                        ? {
                                            _long = true,
                                            controller.isSearch = false
                                          }
                                        : {
                                            _long = false,
                                            controller.isSearch = true,
                                            controller.onSearch(val),
                                          });
                              }
                            },
                            child: const Icon(
                              Icons.search_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: ontapNotification,
                    child: const Icon(Icons.notifications_on_outlined)),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: ontapMyfavorite,
                    child: const Icon(Icons.favorite_outline_rounded))
              ],
            ),
          )
        ],
      ),
    );
  }
}
