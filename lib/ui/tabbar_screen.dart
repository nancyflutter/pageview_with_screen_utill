import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pageview_with_screen_utill/controller/tabbar_controller.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: TabBarController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("TabBar"),
            backgroundColor: Colors.orange,
          ),
          body: DefaultTabController(
            length: controller.sports.length,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    color: Colors.white,
                    child: TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 3,
                      indicatorColor: Colors.orange,
                      dividerColor: Colors.transparent,
                      unselectedLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      labelStyle: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),
                      tabs: controller.sports.map(
                        (NameModel sport) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Tab(
                              child: Text(
                                sport.name!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
