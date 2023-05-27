import 'package:daq_mobile/Info/infoData.dart';
import 'package:daq_mobile/constants.dart';
import 'package:flutter/material.dart';

import 'Widgets/Bottom Bar.dart';
import 'Widgets/Plant List.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height/15,),
          Padding(
            padding: EdgeInsets.only(left: width/20),
            child: const Text('Explore', style: TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 40),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width/20, vertical: 15),
            child: SearchBar(
              onChanged: (value) {
                search = value;
                plantNotifier.value++;
              },
              hintText: "Search",
              hintStyle: MaterialStatePropertyAll(TextStyle(color: black.withOpacity(0.5), fontSize: 18)),
              textStyle: const MaterialStatePropertyAll(TextStyle(color: black, fontSize: 18)),
              leading: Row(
                children: [
                  const SizedBox(width: 10,),
                  Icon(Icons.search_rounded, color: black.withOpacity(0.5),),
                ],
              ),
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            ),
          ),
          const Expanded(child: PlantList()),
          const BottomPanelInfo(),
        ],
      ),
    );
  }
}
