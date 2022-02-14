import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/testimonial.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<Testimonial> testimonials = [
  Testimonial(
    text:
        "I can help you to gain a better knowledge of your IT environment in your business to achive business goals and objectives.",
    occupation: "",
    personName: "It Consulting",
    profilePhoto: "assets/design.png",
  ),
  Testimonial(
    text:
        "I can help you make your customerfriendly Apps . I build low cost application in less time without any compromise in quality",
    occupation: "",
    personName: "Mobile App Development",
    profilePhoto: "assets/develop.png",
  ),
  Testimonial(
    text:
        "From the of new applications, through development, deploy, management and maintenance, I cover all stages of the application lifecycle.",
    occupation: "",
    personName: "Application Services",
    profilePhoto: "assets/write.png",
  )
];

class TestimonialWidget extends StatelessWidget {
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
}

Widget _buildUi(double width) {
  return Center(
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "MY SERVICES",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  height: 1.3,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '',
                        style: TextStyle(color: Colors.white, height: 1.8),
                      ),
                      TextSpan(
                          text: " ",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                            height: 1.8,
                          )),
                      TextSpan(
                        text: "",
                        style: TextStyle(color: Colors.white, height: 1.8),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 45.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                // Lets map
                children: testimonials.map((testimonial) {
                  return Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 1,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(bottom: 50.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Container(
                                  child: Image.asset(
                                    testimonial.profilePhoto,
                                  ),
                                ),
                              ]),
                              SizedBox(
                                width: 20.0,
                                height: 20,
                              ),
                              Text(testimonial.personName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 17.0,
                                  )),
                              SizedBox(
                                width: 20.0,
                                height: 20,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      testimonial.text,
                                      style: GoogleFonts.oswald(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      testimonial.occupation,
                                      style: TextStyle(
                                        color: kCaptionColor,
                                      ),
                                    )
                                  ]),
                            ]),
                      ));
                }).toList(),
              ),
            ],
          ),
        );
      },
    ),
  );
}
