import 'package:daq_mobile/constants.dart';
import 'package:flutter/material.dart';

import 'Settings forms.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryGreen,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height/30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width/5,
                  height: 45,
                  decoration: const BoxDecoration(
                      color: secondGreen,
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(150))
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 7),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    iconSize: 30,
                    color: white,
                    splashRadius: 1,
                    onPressed: () => Navigator.pop(context)),
                ),
                const Text("Settings\n\n", style: TextStyle(color: white, fontWeight: FontWeight.w600, fontSize: 35),),
                SizedBox(
                  width: width/5,
                  height: 45,
                ),
              ],
            ),
            Center(child: Image.asset('Assets/plantIcon.png', height: height/6,)),
            const SettingsForm(),
          ],
        ),
      ),
    );
  }
}

