import 'package:flutter/material.dart';

import '../constants.dart';
import 'Settings forms.dart';

class SettingDrawer extends StatelessWidget {
  const SettingDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryGreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height/15,),
          const Text("Settings", style: TextStyle(color: white, fontWeight: FontWeight.w600, fontSize: 35),),
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
              SizedBox(
                width: width/5,
                height: 45,
              ),
            ],
          ),
          SizedBox(height: height/25,),
          Center(child: Image.asset('Assets/plantIcon.png', height: height/6,)),
          const SettingsForm(),
        ],
      ),
    );
  }
}
