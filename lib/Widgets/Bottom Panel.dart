import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daq_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Info/information.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height*0.4,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        color: white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Row(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                  child: SizedBox(
                    height: height/10,
                    width: width/2,
                    child: Row(
                      children: [
                        const VerticalDivider(thickness: 2, color: Colors.redAccent, indent: 10, endIndent: 10),
                        const SizedBox(width: 10,),
                        ValueListenableBuilder(
                          valueListenable: counter,
                          builder: (context, value, child) => Expanded(
                            child: RichText(text: TextSpan(
                              text: textMsg,
                              style: const TextStyle(color: black, fontWeight: FontWeight.w600, fontSize: 22, ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  )
              )
            ],
          ),
          const SizedBox(height: 10,),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('sensors').snapshots(),
            builder: (context, snapshot) => FutureBuilder <int>(
              future: getData(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: SizedBox(
                                  width: 10,
                                  height: 50,
                                  child: RotatedBox(
                                    quarterTurns: -1,
                                    child: LinearProgressIndicator(
                                      value: moisture/100,
                                      backgroundColor: Colors.black12,
                                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.redAccent),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text(moisture.ceil().toString(), style: const TextStyle(color: black, fontSize: 45, fontWeight: FontWeight.bold),),
                              const Text('%', style: TextStyle(color: black, fontSize: 25, fontWeight: FontWeight.w600),)
                            ],
                          ),
                          const SizedBox(height: 3,),
                          const Text('Moisture', style: TextStyle(color: black, fontSize: 20, fontWeight: FontWeight.w500),)
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(temp.round().toString(), style: const TextStyle(color: black, fontSize: 45, fontWeight: FontWeight.bold),),
                              const Text('°C', style: TextStyle(color: black, fontSize: 25, fontWeight: FontWeight.w600),)
                            ],
                          ),
                          const SizedBox(height: 3,),
                          const Text('Temper.', style: TextStyle(color: black, fontSize: 20, fontWeight: FontWeight.w500),)
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: SizedBox(
                                  width: 10,
                                  height: 50,
                                  child: RotatedBox(
                                    quarterTurns: -1,
                                    child: LinearProgressIndicator(
                                      value: waterLVL/100,
                                      backgroundColor: Colors.black12,
                                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.redAccent),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text(waterLVL.ceil().toString(), style: const TextStyle(color: black, fontSize: 45, fontWeight: FontWeight.bold),),
                              const Text('%', style: TextStyle(color: black, fontSize: 25, fontWeight: FontWeight.w600),)
                            ],
                          ),
                          const SizedBox(height: 3,),
                          const Text('Water Tank', style: TextStyle(color: black, fontSize: 20, fontWeight: FontWeight.w500),)
                        ],
                      ),
                      const SizedBox(),
                    ],
                  );
                }else{
                  return const Center(child: CircularProgressIndicator(color: secondGreen, strokeWidth: 5),);
                }
              },
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                width: width*0.63,
                height: height/8.8,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40)),
                  color: primaryGreen,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bar_chart, color: white, size: 20,),
                    SizedBox(width: 10,),
                    Text('Statistics', style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w600),)
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, duration: const Duration(milliseconds: 500), child: const Info())),
                  child: const Center(
                        child: Text("Information", style: TextStyle(color: black, fontSize: 20, fontWeight: FontWeight.w600))
                    ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
