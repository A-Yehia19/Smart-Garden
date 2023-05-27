import 'package:daq_mobile/Settings/Settings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../constants.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width/5,
      height: 45,
      decoration: const BoxDecoration(
        color: secondGreen,
        borderRadius: BorderRadius.horizontal(left: Radius.circular(150))
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 7),
      child: IconButton(
        icon: const Icon(Icons.settings),
        iconSize: 30,
        color: white,
        splashRadius: 1,
        onPressed: () => Scaffold.of(context).openEndDrawer(),
        // onPressed: () => Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const Settings())),
      ),
    );
  }
}
