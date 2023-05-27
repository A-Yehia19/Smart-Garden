import 'package:daq_mobile/constants.dart';
import 'package:flutter/material.dart';

import '../infoData.dart';
import 'Loading Page.dart';

class PlantList extends StatelessWidget {
  const PlantList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final imageHeight = width/3;

    return ValueListenableBuilder(
      valueListenable: plantNotifier,
      builder: (BuildContext context, value, Widget? child) => FutureBuilder <int>(
        future: getPlants(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: width/20),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: plants.data.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: imageHeight,
                      width: width - width/10,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              plants.data[index].defaultImage.mediumUrl ?? errImage,
                              width: imageHeight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 15,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  text: TextSpan(
                                    style: const TextStyle(fontSize: 25, color: black),
                                    children: [
                                      const TextSpan(text: "Name: ", style: TextStyle(color: primaryGreen, fontWeight: FontWeight.w600)),
                                      TextSpan(text: plants.data[index].commonName ?? "error"),
                                    ]
                                  )
                                ),
                                const SizedBox(height: 10),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    style: const TextStyle(fontSize: 18, color: black),
                                    children: [
                                      const TextSpan(text: "Sunlight: ", style: TextStyle(color: primaryGreen, fontWeight: FontWeight.w600)),
                                      TextSpan(text: plants.data[index].sunlight[0] ?? "error"),
                                    ]
                                  )
                                ),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    style: const TextStyle(fontSize: 18, color: black),
                                    children: [
                                      const TextSpan(text: "Watering: ", style: TextStyle(color: primaryGreen, fontWeight: FontWeight.w600)),
                                      TextSpan(text: plants.data[index].watering ?? "error"),
                                    ]
                                  )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25,child: Divider(thickness: 2, color: secondGreen,),),
                  ],
                ),
              ),
            );
          }else{
            return const LoadingPage();
          }
        },
      ),
    );
  }
}
