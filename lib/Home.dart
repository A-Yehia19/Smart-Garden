import 'package:daq_mobile/Settings/Drawer.dart';
import 'package:daq_mobile/Widgets/Motion%20Detector.dart';
import 'package:flutter/material.dart';

import 'Widgets/Bottom Panel.dart';
import 'Widgets/Floating Options.dart';
import 'Widgets/Side Text.dart';
import 'constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryGreen,
      resizeToAvoidBottomInset: false,
      endDrawer: const SettingDrawer(),
      body: Stack(
        children: [
          Positioned(top: height/10, right: 0, child: const Options()),
          const Positioned(bottom: 0,child: BottomPanel()),
          // const Positioned(bottom: 0, right: 10,child: MotionDetector()),
          Positioned(top: height/5, right: 10,child: const SideText()),
          Positioned(left: -10, right: width/2, bottom: height/3.5, top: height/20, child: Image.asset(plantImage, alignment: Alignment.bottomCenter,)),
        ],
      ),
    );
  }
}
