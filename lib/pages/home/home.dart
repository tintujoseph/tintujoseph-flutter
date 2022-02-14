import 'package:flutter/material.dart';
import 'package:web_portfolio/models/ios.dart';
import 'package:web_portfolio/pages/home/components/carousel.dart';

import 'package:web_portfolio/pages/home/components/education_section.dart';

import 'package:web_portfolio/pages/home/components/ios_app_ad.dart';

import 'package:web_portfolio/pages/home/components/skill_section.dart';
import 'package:web_portfolio/pages/home/components/testimonial_widget.dart';
import 'package:web_portfolio/pages/home/header.dart';

import 'package:web_portfolio/sponser.dart';

import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/footer.dart';
import 'package:web_portfolio/utils/globals.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems[index].onPressed,
                            child: Text(
                              headerItems[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: Text(
                          headerItems[index].title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child: Header()),
              Carousel(),
              SizedBox(
                height: 20.0,
              ),
              SkillSection(),
              SizedBox(
                height: 20.0,
              ),
              EducationSection(),
              SizedBox(
                height: 20.0,
              ),
              Logo(),
              SizedBox(
                height: 50.0,
              ),
              TestimonialWidget(),
              SizedBox(
                height: 50.0,
              ),
              Ios(),
              SizedBox(
                height: 50.0,
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
