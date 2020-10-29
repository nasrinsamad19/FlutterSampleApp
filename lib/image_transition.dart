import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class List1  {
  final String image;
  List1({this.image});
}
List<List1> list1=[
  List1(image: "assets/images/p1.jpg"),
  List1(image:"assets/images/p2.jpg"),
  List1(image:"assets/images/p6.jpg"),
  List1(image:"assets/images/p4.jpg"),
  List1(image:"assets/images/p5.jpg"),
];
class Images extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}
class _State extends State<Images>{
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('DraggableImages'),
        ),
        body: Center(
          child:Swiper(
            itemCount: 5,
            itemBuilder: (context,index){
              return ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image(image: AssetImage('${list1[index].image}')),
                );
              },
            viewportFraction: 0.7,
            scale: 0.7,
            pagination: SwiperPagination(),
            //control: SwiperControl(),
          )
        )
      ),
    );
  }
}