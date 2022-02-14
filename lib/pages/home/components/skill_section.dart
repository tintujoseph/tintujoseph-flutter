import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/models/skill.dart';

import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

List<Skill> skills = [
  Skill(
    skill: "Dart",
    percentage: 80,
  ),
  Skill(
    skill: "Javascript",
    percentage: 50,
  ),
  Skill(
    skill: "C++",
    percentage: 90,
  ),
  Skill(
    skill: "Python",
    percentage: 75,
  ),
  Skill(
    skill: "CSS",
    percentage: 40,
  ),
  Skill(
    skill: "Java",
    percentage: 60,
  ),
];

class SkillSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text("About",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 28.0,
                        height: 1.3,
                      ))
                ]),
                SizedBox(height: 20),
                Expanded(
                  child: Image.asset(
                    "assets/123.png",
                    width: 450.0,
                    height: 400.0,
                  ),
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                ),
                Expanded(
                    flex: ScreenHelper.isMobile(context) ? 0 : 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 60.0),
                        Text("Hello",
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                            )),
                        SizedBox(height: 4.0),
                        Text(
                            "I am Tintu and I enjoy learn new things that developed in the internet. My interest in both mobile and web application development started back in 2021.Now I am working inLuminar Technolab as a flutter developer intern.",
                            style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontWeight: FontWeight.normal)),
                        SizedBox(height: 14.0),
                        GestureDetector(
                          onTap: () async {
                            var url =
                                "https://tintujoseph.github.io/tintujoseph/";
                            if (await canLaunch(url)) {
                              await launch(
                                url,
                              );
                            } else {
                              throw "Failed to open LinkedIn";
                            }
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              "More...",
                              textAlign: TextAlign.end,
                              style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        Text("* NAME : Tintu Joseph",
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                            )),
                        SizedBox(height: 14.0),
                        Text("* Qualification : Btech",
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                            )),
                        SizedBox(height: 14.0),
                        Text("* Place : Kottayam",
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                            )),
                        SizedBox(height: 16.0),
                        Text("* Email : thintujoseph98@gmail.com",
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                            )),
                        SizedBox(height: 16.0),
                        Text("* Mobile : 8921804013",
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                            )),
                        SizedBox(height: 16.0),
                        Column(
                          children: skills
                              .map(
                                (skill) => Container(
                                  margin: EdgeInsets.only(bottom: 15.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: skill.percentage,
                                          child: Container(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              alignment: Alignment.centerLeft,
                                              height: 38.0,
                                              child: Text(skill.skill,
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              color: Colors.deepOrange[600])),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                        // remaining (blank part)
                                        flex: 100 - skill.percentage,
                                        child: Divider(
                                          color: Colors.deepOrange[600],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "${skill.percentage}%",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ))
              ]));
    }));
  }
}
