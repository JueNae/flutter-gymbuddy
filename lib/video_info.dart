import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  // this is global variable
  List videoInfo = [];
  bool _playArea = false;
  late VideoPlayerController _controller;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
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
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.customTertiaryContainerBlack
                        .withOpacity(0.9),
                    color.AppColor.customTertiaryDark,
                  ],
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ),
              )
            : BoxDecoration(
                color: color.AppColor.colorBronze,
              ),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding:
                        const EdgeInsets.only(top: 70, left: 30, right: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color:
                                    color.AppColor.customPrimaryContainerLight,
                              ),
                            ),
                            Expanded(
                                child:
                                    Container()), // to separate between 2 icon
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.AppColor.customPrimaryContainerLight,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
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
                          height: 50,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor.customTertiaryContainerBlack
                                        .withOpacity(0.9),
                                    color.AppColor.customTertiaryDark,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 20,
                                    color: color
                                        .AppColor.customPrimaryContainerLight,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "68min",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: color
                                          .AppColor.customPrimaryContainerLight,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 200,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor.customTertiaryContainerBlack
                                        .withOpacity(0.9),
                                    color.AppColor.customTertiaryDark,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handshake_outlined,
                                    size: 20,
                                    color: color
                                        .AppColor.customPrimaryContainerLight,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Resistent Band try",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: color
                                          .AppColor.customPrimaryContainerLight,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 50, left: 30, right: 30),
                          height: 100,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  debugPrint("tapped");
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: color
                                      .AppColor.customPrimaryContainerLight,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color:
                                    color.AppColor.customPrimaryContainerLight,
                              ),
                            ],
                          ),
                        ),
                        _playView(context),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                    // topLeft: Radius.circular(70)
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Circuit1: Legs Toning",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.customPrimaryContainerLight,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: color.AppColor.customPrimaryContainerLight,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "3 sets",
                              style: TextStyle(
                                fontSize: 15,
                                color:
                                    color.AppColor.customPrimaryContainerLight,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(child: _ListView())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return Container(
        height: 300,
        width: 300,
        child: VideoPlayer(controller),
      );
    } else {
      return Text("Being initialized pls wait");
    }
  }

  _onTapVideo(int index) {
    final controller =
        VideoPlayerController.network(videoInfo[index]['videourl']);
    _controller = controller; // save it to global variable
    setState(() {});

    controller
      ..initialize().then((_) {
        controller.play();
        setState(() {});
      });
  }

  _ListView() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(
            // symentric have 2 properties only, horizontal and vertical
            horizontal: 30,
            vertical: 8),
        itemCount: videoInfo
            .length, // how mny times u want run it, listview is like for loop
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if (_playArea == false) {
                  _playArea = true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index) {
    return Container(
      height: 135,
      //  color: Colors.red, // debug only
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(videoInfo[index]["thumbnail"]),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: TextStyle(
                      color: color.AppColor.customPrimaryContainerLight,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      videoInfo[index]["time"],
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            color: Colors.white,
                          ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
