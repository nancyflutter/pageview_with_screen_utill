import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pageview_with_screen_utill/controller/home_controller.dart';
import 'package:pageview_with_screen_utill/ui/tabbar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("CarouselSlider, PageView, card_swiper"),
            backgroundColor: Colors.orange,
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(
                    () => const TabBarScreen(),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
              )
            ],
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "CarouselSlider",
                ),
              ),
              // 1.  Using CarouselSlider
              CarouselSlider.builder(
                carouselController: controller.carouselController,
                options: CarouselOptions(
                  aspectRatio: 1.8,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  // autoPlay: true,
                  onPageChanged: (index, reason) {
                    controller.current.value = index;
                    controller.current.refresh();
                  },
                ),
                itemCount: controller.listData.length,
                itemBuilder: (context, index, realIndex) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.sp),
                        ),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.color),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("${controller.listData[index].image}"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.sp, left: 18.sp, right: 18.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${controller.listData[index].time}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.isBookMarked.value = !controller.isBookMarked.value;
                                    // controller.listData[index].isBookmarked = !controller.listData[index].isBookmarked!;
                                  },
                                  child: Icon(
                                    Icons.bookmark,
                                    color: controller.isBookMarked.value == true ? Colors.orange : Colors.white,
                                    size: 28.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.sp, left: 18.sp, right: 18.sp),
                            child: Text(
                              "A ruggedly beautiful quarantine site",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              DotIndicator(
                currentPage: controller.current.value,
                pageCount: 3,
              ),
              const SizedBox(
                height: 30,
              ),

              // 2. PageView Builder
              const Center(child: Text("CarouselSlider")),
              SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: 3,
                  physics: const BouncingScrollPhysics(),
                  controller: controller.pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {},
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15),
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              /// DOTED INDICATOR
              DotIndicator(
                currentPage: controller.currentPage.value.toInt(),
                pageCount: 3,
              ),

              // 3. Card Swiper
              const Center(child: Text("Swiper")),
              SizedBox(
                height: 300,
                child: Swiper(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 28.0),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  autoplay: true,
                  itemCount: 3,
                  pagination: const SwiperPagination(),
                  viewportFraction: 0.8,
                  scale: 0.9,
                  fade: 1,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class DotIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const DotIndicator({super.key, required this.currentPage, required this.pageCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => Container(
          margin: EdgeInsets.all(8.sp),
          width: 12.sp,
          height: 12.sp,
          decoration: index == currentPage
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.orange,
                    width: 1.5.sp,
                  ),
                )
              : BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5.sp,
                  ),
                ),
        ),
      ),
    );
  }
}
