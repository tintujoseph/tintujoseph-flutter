import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/footer_item.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<FooterItem> footerItems = [
  FooterItem(
    iconPath: "assets/phone.png",
    title: "PHONE",
    text1: " +91 8921804013",
  ),
  FooterItem(
    iconPath: "assets/email.png",
    title: "EMAIL",
    text1: "thintujoseph98@gmail.com",
  ),
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.0),
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: footerItems
                        .map(
                          (footerItem) => Container(
                            height: 120.0,
                            width: ScreenHelper.isMobile(context)
                                ? constraints.maxWidth / 2.0 - 20.0
                                : constraints.maxWidth / 4.0 - 20.0,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        footerItem.iconPath,
                                        width: 25.0,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        footerItem.title,
                                        style: GoogleFonts.oswald(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${footerItem.text1}\n",
                                          style: TextStyle(
                                              color: kCaptionColor,
                                              height: 1.8,
                                              fontSize: 14.0),
                                        ),
                                        TextSpan(
                                          style: TextStyle(
                                            color: kCaptionColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Flex(
                    direction: ScreenHelper.isMobile(context)
                        ? Axis.vertical
                        : Axis.horizontal,
                    mainAxisAlignment: ScreenHelper.isMobile(context)
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: []),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Copyright (c) 2022 Tintu Joseph. All rights Reserved",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kCaptionColor, fontSize: 16),
                        ),
                      ),
                    ])
              ]);
        },
      ),
    ),
  );
}
