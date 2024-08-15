import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pageview_with_screen_utill/models/slider_model.dart';

class HomeController extends GetxController {
  /// PageView Builder
  PageController pageController = PageController(
    viewportFraction: 0.877,
  );
  RxDouble currentPage = RxDouble(0);



  RxInt current = RxInt(0);
  final CarouselController carouselController = CarouselController();
  RxBool isBookMarked = RxBool(false);
  RxList<SliderModel> listData = RxList<SliderModel>([
    SliderModel(
      image: "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
      description: "A ruggedly beautiful quarantine site",
      isBookmarked: false,
      time: "2 hours ago",
    ),
    SliderModel(
      image: "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
      description: "A ruggedly beautiful quarantine site",
      isBookmarked: false,
      time: "2 hours ago",
    ),
    SliderModel(
      image: "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
      description: "A ruggedly beautiful quarantine site",
      isBookmarked: false,
      time: "2 hours ago",
    ),
  ]);

  @override
  void onInit() {
    // TODO: implement onInit
/*    pageController.addListener(() {
      currentPage.value = pageController.page!.toDouble();
      print("-currentPage---------------> $currentPage");
    });*/
    super.onInit();
  }
}
