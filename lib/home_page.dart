import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personaltraining/video_info.dart';

import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.customTertiaryContainerBlack,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Personal Fitness",
                  style: TextStyle(
                      fontSize: 30,
                      color: color.AppColor.customPrimaryContainerLight,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: color.AppColor.customPrimaryContainerLight,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: color.AppColor.customPrimaryContainerLight,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: color.AppColor.customPrimaryContainerLight,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Your Program",
                  style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.customPrimaryContainerLight,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(child: Container()), // to make space to right
                Text(
                  "More",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.customPrimaryContainerLight,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: color.AppColor.customPrimaryContainerLight,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.AppColor.colorBronze.withOpacity(0.8),
                      color.AppColor.colorGold.withOpacity(0.9),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 20,
                      color: color.AppColor.colorGold.withOpacity(0.2),
                    )
                  ]),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next workout",
                      style: TextStyle(
                        fontSize: 16,
                        color: color.AppColor.customPrimaryContainerLight,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.customPrimaryContainerLight,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "and Glutes Workout",
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.customPrimaryContainerLight,
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.timer,
                          size: 20,
                          color: color.AppColor.customPrimaryContainerLight,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "60 min",
                          style: TextStyle(
                            fontSize: 14,
                            color: color.AppColor.customPrimaryContainerLight,
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: color
                                        .AppColor.customPrimaryContainerLight,
                                    blurRadius: 80,
                                    offset: Offset(4, 8))
                              ]),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/background.jpg"),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              offset: Offset(8, 10),
                              color: color.AppColor.customPrimaryContainerLight
                                  .withOpacity(0.3)),
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(-1, -5),
                              color: color.AppColor.customPrimaryContainerLight
                                  .withOpacity(0.3)),
                        ]),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 200, bottom: 30),
                    decoration: BoxDecoration(
                      //  color: color.AppColor.colorPrimaryLightPurple
                      //.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/bodygym.png"),
                        //   fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    // color: Colors.redAccent.withOpacity(0.3),// to check the container stack
                    margin: const EdgeInsets.only(left: 150, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.customTertiaryContainerBlack,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "keep it up\n",
                                style: TextStyle(
                                  color: color
                                      .AppColor.customTertiaryContainerBlack,
                                  fontSize: 16,
                                ),
                                children: [
                              TextSpan(text: "stick to your plan"),
                            ]))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Parts of body",
                  //  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.customPrimaryContainerLight,
                  ),
                ),
              ],
            ),
            Expanded(
                child: OverflowBox(
              maxWidth: MediaQuery.of(context)
                  .size
                  .width, // use overflow the padding top doesnt hve effect
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                    itemCount: (info.length.toDouble() / 2)
                        .toInt(), // return value of 2 for divide row
                    // itemCount: info.length,

                    itemBuilder: (_, i) {
                      int a = 2 *
                          i; //0 , i =1, 1+ 1 = a = 2 // index 0(glues) and index 2(abs)
                      int b = 2 * i +
                          1; //1 , i =1, 1 +2 = 3 // index 1(legs) and index 3(arms)
                      return Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 5),
                            height: 140,
                            margin: EdgeInsets.only(
                              left: 20,
                              bottom: 15,
                              top: 15,
                            ),
                            width: (MediaQuery.of(context).size.width - 90) /
                                2, // original is 30+30+30 so need to remove -90
                            decoration: BoxDecoration(
                              color:
                                  color.AppColor.customTertiaryContainerBlack,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(info[a]['img']),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(5, 5),
                                  color: color
                                      .AppColor.customPrimaryContainerLight
                                      .withOpacity(0.1),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-5, -5),
                                  color: color
                                      .AppColor.customPrimaryContainerLight
                                      .withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[a]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: color
                                        .AppColor.customPrimaryContainerLight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 5),
                            margin: EdgeInsets.only(
                              left: 20,
                              bottom: 15,
                              top: 15,
                            ),
                            height: 140,
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            decoration: BoxDecoration(
                              color:
                                  color.AppColor.customTertiaryContainerBlack,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(info[b]['img']),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(5, 5),
                                  color: color
                                      .AppColor.customPrimaryContainerLight
                                      .withOpacity(0.1),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-5, -5),
                                  color: color
                                      .AppColor.customPrimaryContainerLight
                                      .withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[b]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: color
                                        .AppColor.customPrimaryContainerLight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
