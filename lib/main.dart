import 'package:flutter/material.dart';
import 'package:covid19_app/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19 App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: TextTheme(
          body1: TextStyle(color: kBodyTextColor),
        ),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 40, top: 50, right: 20),
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff3383cd),
                      Color(0xff11249f),
                    ]),
                image: DecorationImage(
                  image: AssetImage("assets/images/virus.png"),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset("assets/icons/menu.svg"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/icons/Drcorona.svg",
                          width: 230,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                        Positioned(
                          top: 20,
                          left: 150,
                          child: Text(
                            "Stay At Home and\n Stay Safe Guyss",
                            style:
                                kHeadingTextStyle.copyWith(color: Colors.white),
                          ),
                        ),
                        Container(), // not sure why we need this
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color(0xffe5e5e5),
              ),
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: DropdownButton(
                    value: "Malaysia",
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                    items: ['Malaysia', 'Turki', 'Russia', 'Japan']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Case \n",
                            style: kTitleTextStyle,
                          ),
                          TextSpan(
                            text: "Newest Update Disember 13",
                            style: TextStyle(
                              color: kTextLightColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See Details",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: kShadowColor,
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kInfectedColor.withOpacity(.26),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                  color: kInfectedColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "1046",
                            style: TextStyle(
                              fontSize: 40,
                              color: kInfectedColor,
                            ),
                          ),
                          Text(
                            "Infected",
                            style: kSubTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
