import 'package:daq_mobile/Info/infoData.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../Home.dart';
import '../../constants.dart';

class BottomPanelInfo extends StatelessWidget {
  const BottomPanelInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              search = '';
              Navigator.pushReplacement(context, PageTransition(
                  type: PageTransitionType.fade, duration: const Duration(milliseconds: 500), child: const Home()));
            },
            child: const Center(
                child: Text("Statistics", style: TextStyle(color: black, fontSize: 20, fontWeight: FontWeight.w600))
            ),
          ),
        ),
        Container(
          width: width*0.63,
          height: height/8.8,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
            color: primaryGreen,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit_calendar_rounded, color: white, size: 20,),
              SizedBox(width: 10,),
              Text('Information', style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w600),)
            ],
          ),
        ),
      ],
    );
  }
}
