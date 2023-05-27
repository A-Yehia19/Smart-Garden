import 'package:flutter/material.dart';

import '../constants.dart';

class MotionDetector extends StatelessWidget {
  const MotionDetector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: counter,
      builder: (context, value, child) {
        if(motion){
          return Column(
            children: [
              Image.asset(alarmImage, height: height/12, width: width*0.32,),
              const SizedBox(height: 5,),
              const Text("Motion Detected!", style: TextStyle(color: Colors.redAccent, fontSize: 17, fontWeight: FontWeight.w500),),
              const SizedBox(height: 10,),
            ],
          );
        }else{
          return const SizedBox();
        }
      },
    );
  }
}
