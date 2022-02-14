import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

class Carousel extends StatelessWidget {
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return Container(
        color: kBackgroundColor,
        height: carouselContainerHeight,
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Im Tintu Joseph',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 30,
                fontStyle: FontStyle.italic,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Text(
            'Flutter Developer',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.white),
            textAlign: TextAlign.center,
          )
        ]));
  }
}
