import 'package:daq_mobile/Settings/setting%20data.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SettingsForm extends StatelessWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder <int>(
        future: getControls(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(flex: 1, child: SizedBox(),),
                  TextField(
                    controller: NameController,
                    maxLines: 1,
                    cursorColor: white,
                    style: const TextStyle(color: white, fontSize: 25),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: white),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: white),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        hintText: name,
                        hintStyle: TextStyle(color: white.withOpacity(0.7), fontSize: 25),
                        alignLabelWithHint: true,
                        labelText: "Plant Name",
                        labelStyle: const TextStyle(color: white, fontSize: 30, fontWeight: FontWeight.w600)
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox(),),
                  TextField(
                    controller: MoistController,
                    keyboardType: TextInputType.number,
                    cursorColor: white,
                    maxLines: 1,
                    style: const TextStyle(color: white, fontSize: 25),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: white),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: white),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        hintText: moistLimit.toString(),
                        hintStyle: TextStyle(color: white.withOpacity(0.7), fontSize: 25),
                        alignLabelWithHint: true,
                        labelText: "Moisture Limit",
                        labelStyle: const TextStyle(color: white, fontSize: 30, fontWeight: FontWeight.w600)
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          color: secondGreen,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextButton(
                            onPressed: () {
                              confirm();
                              Navigator.pop(context);
                            },
                            child: const Text("Confirm", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: white),)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }else{
            return const Center(child: CircularProgressIndicator(color: secondGreen),);
          }
        },
      ),
    );
  }
}
