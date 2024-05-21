import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/helper/extentions.dart';
import 'package:tasky/core/styles/colors/colors_light.dart';
import 'package:tasky/core/styles/fonts/font_wieght_helper.dart';

class CustomTapBar extends StatefulWidget {
  final List<String> items;
  final List<Widget> screens;

  const CustomTapBar({super.key, required this.items, required this.screens});
  @override
  State<CustomTapBar> createState() => _CustomTapBarState();
}

int current = 0;
PageController pageController = PageController();

class _CustomTapBarState extends State<CustomTapBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Tab Bar
        SizedBox(
          width: double.infinity,
          height: 60.h,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: widget.items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                        pageController.animateToPage(
                          current,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease,
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        width: 140.w,
                        height: 40.h,
                        child: Container(
                          height: 20.h,
                          width: 80.w,
                          margin: const EdgeInsets.only(right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: current == index
                                ? ColorsLight.blueLight
                                : Colors.white,
                            border: current != index
                                ? Border.all(color: Colors.grey.shade600)
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              widget.items[index],
                              style: current == index
                                  ? context.textStyle.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontweightHelper.bold,
                                    )
                                  : context.textStyle.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontweightHelper.bold,
                                      color: ColorsLight.blueLight,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: current == index,
                      child: Container(
                        width: 5,
                        height: 10,
                        decoration: const BoxDecoration(
                            color: ColorsLight.blueLight,
                            shape: BoxShape.circle),
                      ),
                    )
                  ],
                );
              }),
        ),

        /// MAIN BODY
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height -200.h,
          child:  PageView.builder(
              itemCount: widget.screens.length,
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return widget.screens[index];
            
              },
            ),
       
        ),
      ],
    );
  }
}
