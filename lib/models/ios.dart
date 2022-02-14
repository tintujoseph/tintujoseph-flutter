import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

class Ios extends StatelessWidget {
  // We can use same idea as ios_app_ad.dart and swap children order, let's copy code
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Container(
              child: Flex(
                direction: constraints.maxWidth > 720
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PORTFOLIO",
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                            fontSize: 35.0,
                          ),
                        ),
                        Image.asset(
                          "assets/ios.png",
                          // Set width for image on smaller screen
                          width: constraints.maxWidth > 720.0 ? null : 350.0,
                        ),
                        Text(
                          "I build somany projects in flutter .......",
                          style: TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                            fontSize: 20.0,
                          ),
                        ),
                        Row(children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              child: GestureDetector(
                                onTap: () async {
                                  var url = "https://github.com/tintujoseph";
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                    );
                                  } else {
                                    throw "Failed to open LinkedIn";
                                  }
                                },
                                child: Text(
                                  "EXPLORE MORE",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 70.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
