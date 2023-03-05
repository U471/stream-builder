import 'package:flutter/material.dart';
import 'package:stream_builder/style/style.dart';

class HomeSecreen extends StatelessWidget {
  const HomeSecreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: greenColor,
        ),
        title: Text(
          "Quran",
          style: titleGreenStyle(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: blueColor,
              backgroundImage: const AssetImage('assets/icons/moon.png'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: height * .01),
                child: Center(
                  child: Image.asset(
                    'assets/icons/logo.png',
                    width: width * .3,
                  ),
                ),
              ),
              InspirationWidget(height: height, width: width),
              Row(
                children: [
                  Column(
                    children: [
                      CoustomWidget(
                          height1: height * .27,
                          image: "assets/icons/quran.png",
                          title: "Quran",
                          color: greenColor,
                          onpressed: () {}),
                      CoustomWidget(
                          height1: height * .20,
                          image: "assets/icons/bookmark.png",
                          title: "Bookmars",
                          color: purpleColor,
                          onpressed: () {}),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      CoustomWidget(
                          height1: height * .2,
                          image: "assets/icons/prayer.png",
                          title: "Prayers",
                          color: redColor,
                          onpressed: () {}),
                      CoustomWidget(
                          height1: height * .27,
                          image: "assets/icons/location.png",
                          title: "Qibla",
                          color: blueColor,
                          onpressed: () {}),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CoustomWidget extends StatelessWidget {
  CoustomWidget(
      {super.key,
      required this.height1,
      required this.image,
      required this.title,
      required this.color,
      this.onpressed});

  final double height1;
  String image;
  String title;
  Color color;
  final Function? onpressed;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: width * .06),
      child: GestureDetector(
        //  onTap: onpressed,
        child: Container(
          height: height1,
          width: width * .4,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(1.5, 3))
              ],
              image: DecorationImage(
                  image: AssetImage('assets/icons/dashboard.png'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(25)),
          child: Container(
            decoration: BoxDecoration(
                color: color.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * .02, vertical: height * .02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    image,
                    width: width * .15,
                    height: height * .09,
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: width * .02),
                    child: Text(
                      title,
                      style: titleStyle(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * .02),
                    child: GotoWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InspirationWidget extends StatelessWidget {
  const InspirationWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: height * .15,
        width: width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(1.5, 3),
              ),
            ],
            image: const DecorationImage(
              image: AssetImage('assets/icons/dashboard.png'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(25)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                primaryColor.withOpacity(0.7),
                secondryColor.withOpacity(0.7),
              ]),
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * .03, vertical: height * .02),
                child: SizedBox(
                  width: width * .4,
                  child: ListTile(
                    title: Text(
                      "Inspiration",
                      style: titleStyle(),
                    ),
                    subtitle: Text(
                      'See Inspiration Videos and more',
                      style: subtitleStyle(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * .04),
                child: SizedBox(
                  height: height * .15,
                  width: width * .3,
                  child: Image.asset(
                    'assets/icons/lamp.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GotoWidget extends StatelessWidget {
  final VoidCallback? onpressed;
  const GotoWidget({Key? key, this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Go to', style: miniStyle()),
        SizedBox(
          width: 7,
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 13,
        )
      ],
    );
  }
}
