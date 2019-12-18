import 'package:carousel_pro/carousel_pro.dart';
import 'package:carpet_store/SizeConfig.dart';
import 'package:carpet_store/screen/CarpetPager.dart';
import 'package:flutter/material.dart';

class M_start extends StatefulWidget {
  @override
  _M_starte createState() => _M_starte();
}

class _M_starte extends State<M_start> {
  List<String> eyvan = [
    "assets/image/group1/i1.png",
    "assets/image/group1/i2.png",
    "assets/image/group1/i3.png",
    "assets/image/group1/i4.png",
    "assets/image/group1/i5.png",
    "assets/image/group1/i6.png",
    "assets/image/group1/i7.png",
    "assets/image/group1/i8.png",
    "assets/image/group1/i9.png",
  ];

  List<String> saviz = [
    "assets/image/group1/s1.png",
    "assets/image/group1/s2.png",
  ];
  List<String> tehran = [
    "assets/image/group1/t1.png",
    "assets/image/group1/t2.png",
    "assets/image/group1/t3.png",
    "assets/image/group1/t4.png",
  ];
  List<String> met = [
    "assets/image/group1/m1.png",
    "assets/image/group1/m2.png",
    "assets/image/group1/m3.png",
  ];

  List<String> Master = [];
  int selected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Master = eyvan;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget childListGroup(String url, int index) {
      return Container(
        width: SizeConfig.blockSizeVertical * 15,
        color: Colors.transparent,
        child: Card(
          margin: new EdgeInsets.only(
              left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 5.0,
          child: GestureDetector(
            child: Image.asset(url),
            onTap: () {
              switch (index) {
                case 0:
                  Master = eyvan;
                  break;
                case 1:
                  Master = tehran;
                  break;
                case 2:
                  Master = saviz;
                  break;
                case 3:
                  Master = met;
                  break;
              }
              setState(() {});
            },
          ),
        ),
      );
    }

    Widget image_carousel = new Container(
      height: SizeConfig.blockSizeVertical * 25,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/image/slider/1.jpg'),
          AssetImage('assets/image/slider/2.jpg'),
        ],
        autoplay: false,
//      animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(milliseconds: 1000),
        dotSize: 8.0,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 2.0,
        onImageTap: (int index) {
          print(index..toString());
        },
      ),
    );

    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color.fromRGBO(230, 230, 230, 1),
            body: SafeArea(
                child: Column(
              children: <Widget>[
                Container(
                    width: SizeConfig.blockSizeHorizontal * 100,
                    height: SizeConfig.blockSizeVertical * 25,
                    child: image_carousel),
                Container(
                    color: Color.fromRGBO(230, 230, 230, 1),
                    width: SizeConfig.blockSizeHorizontal * 100,
                    height: SizeConfig.blockSizeVertical * 16,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        childListGroup("assets/image/group/g1.png", 0),
                        childListGroup("assets/image/group/g2.png", 1),
                        childListGroup("assets/image/group/g3.png", 2),
                        childListGroup("assets/image/group/g4.png", 3),
                      ],
                    )),
                Divider(
                  color: Colors.black,
                ),
                Container(
                    color: Color.fromRGBO(230, 230, 230, 1),
                    width: SizeConfig.blockSizeHorizontal * 100,
                    height: SizeConfig.blockSizeVertical * 51,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: Master.map((value) {
                        return Card(
                            margin: new EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                                top: 10.0,
                                bottom: 10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            elevation: 5.0,
                            child: GestureDetector(
                              child: Image.asset(value.toString()),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new CarpetPager()),
                                );
                                /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CarpetPager()),
                                );*/
                              },
                            ));
                        /*Container(

                  alignment: Alignment.center,
                  margin: EdgeInsets.all(8),
                  child: Image.asset(value.toString()),
                );*/
                      }).toList(),
                    ) /*ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                childListGroup("assets/image/group/g1.png", 0),
                childListGroup("assets/image/group/g2.png", 1),
                childListGroup("assets/image/group/g3.png", 2),
                childListGroup("assets/image/group/g4.png", 3),
              ],
            )*/
                    )
              ],
            ))));
  }
}
