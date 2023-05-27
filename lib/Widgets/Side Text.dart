import 'package:flutter/material.dart';

import '../constants.dart';

class SideText extends StatelessWidget {
  const SideText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width/3,
      height: height/3,
      child: StreamBuilder(
        stream: Stream.periodic(const Duration(minutes: 1)),
        builder:(context, snapshot) => FutureBuilder<int>(
          future: getWeather(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if(snapshot.hasData && snapshot.data == 0){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(Icons.filter_drama_rounded, color: white, size: 70,),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 5,),
                      Text(temperature, style: const TextStyle(fontSize: 40, color: white, fontWeight: FontWeight.bold),),
                      const Text('°C', style: TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Text(status, style: const TextStyle(fontSize: 30, color: white, fontWeight: FontWeight.w500), maxLines: 3, overflow: TextOverflow.ellipsis),
                ],
              );
            }else if(snapshot.hasData && snapshot.data == 1){
              return const Center(child: Icon(Icons.error));
            }else{
              return const Center(child: CircularProgressIndicator(color: secondGreen, strokeWidth: 6,));
            }
          },
        ),
      ),
    );;
  }
}
