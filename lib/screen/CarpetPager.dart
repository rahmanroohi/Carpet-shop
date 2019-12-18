import 'dart:math';

import 'package:carpet_store/SizeConfig.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class CarpetPager extends StatefulWidget {
  @override
  _CarpetPager createState() => _CarpetPager();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class Detils {
  String price = "";
  String brand = "";
  String metraj = "";
  String colorBackground = "";
  String shape = "";
  String tarakomarz = "";
  String tarakomtol = "";
  String nakhkhab = "";
  String nakhpod = "";
  String title = "";
  Detils(
      String price,
      String brand,
      String metraj,
      String colorBackground,
      String shape,
      String tarakomarz,
      String tarakomtol,
      String nakhkhab,
      String nakhpod,
      String title) {
    this.price = price;
    this.brand = brand;
    this.metraj = metraj;
    this.colorBackground = colorBackground;
    this.shape = shape;
    this.tarakomarz = tarakomarz;
    this.tarakomtol = tarakomtol;
    this.nakhkhab = nakhkhab;
    this.nakhpod = nakhpod;
    this.title = title;
  }
}

class _CarpetPager extends State<CarpetPager> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    List<Detils> tmp = [
      new Detils(
        "2.750.300",
        'ایوان فرش',
        "چهارمتری ،شش متری ، نه متری",
        "یاسی ، موشی ، سفید",
        "مستطیل",
        "315",
        "960",
        "پلی پروپیلن هیت ست فریز",
        "کنف",
        "فرش ماشینی مدل افشانه",
      ),
      new Detils(
          "4.750.300",
          'ساوین',
          "چهارمتری ،شش متری ",
          "آبی ،مشکی",
          "مستطیل",
          "513",
          "870",
          "پلی پروپیلن هیت ست فریز",
          "کنف",
          "فرش ماشینی مدل افشانه"),
      new Detils(
          "3.750.300",
          'ایوان فرش',
          "دوازده متری",
          "  آبی ، سفید",
          "مستطیل",
          "600",
          "1200",
          "پلی پروپیلن هیت ست فریز",
          "کنف",
          "فرش ماشینی مدل افشانه"),
      new Detils(
          "1.750.300",
          'محتشم',
          "دوازده متری ، نه متری",
          "سبز ، ابی ، سفید",
          "مستطیل",
          "300",
          "810",
          "پلی پروپیلن هیت ست فریز",
          "کنف",
          "فرش ماشینی مدل افشانه")
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Container(
          color: Color.fromRGBO(230, 230, 230, 1),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.blockSizeHorizontal * 2,
                              top: SizeConfig.blockSizeHorizontal * 2),
                          child: GestureDetector(
                            child: Text(
                              'AR',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              DeviceApps.openApp('com.lotus.ar');
                            },
                          ))
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                          width: SizeConfig.blockSizeHorizontal * 100,
                          child: CardScrollWidget(currentPage)),
                      Positioned.fill(
                        child: PageView.builder(
                          itemCount: images.length,
                          controller: controller,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container();
                          },
                        ),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 1,
                          left: SizeConfig.blockSizeVertical * 2,
                          right: SizeConfig.blockSizeVertical * 2),
                      child: Card(
                          child: Column(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical * 1),
                          height: SizeConfig.blockSizeVertical * 5,
                          width: SizeConfig.blockSizeVertical * 80,
                          alignment: Alignment.center,
                          child: Text(
                            tmp[currentPage.toInt()].title,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'IRANSansMobile',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Text(
                                tmp[currentPage.toInt()].price,
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                            Container(
                              child: Text(
                                ': قیمت (تومان)  ',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Text(
                                tmp[currentPage.toInt()].brand,
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(
                                  SizeConfig.blockSizeVertical * 1),
                              child: Text(
                                ': برند  ',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(
                                  SizeConfig.blockSizeVertical * 1),
                              child: Text(
                                tmp[currentPage.toInt()].metraj,
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                            Container(
                              child: Text(
                                ': متراژ  ',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Text(
                                tmp[currentPage.toInt()].colorBackground,
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(
                                  SizeConfig.blockSizeVertical * 1),
                              child: Text(
                                ': رنگ ضمینه  ',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Text(
                                tmp[currentPage.toInt()].shape,
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(
                                  SizeConfig.blockSizeVertical * 1),
                              child: Text(
                                ': شکل  ',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Text(
                                tmp[currentPage.toInt()].tarakomarz,
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(
                                  SizeConfig.blockSizeVertical * 1),
                              child: Text(
                                ': تراکم عرضی فرش (شانه)',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Text(
                                tmp[currentPage.toInt()].tarakomtol,
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(
                                  SizeConfig.blockSizeVertical * 1),
                              child: Text(
                                ': تراکم طولی فرش (شانه)',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Text(
                                tmp[currentPage.toInt()].nakhkhab,
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(
                                  SizeConfig.blockSizeVertical * 1),
                              child: Text(
                                ': جنس نخ خاب',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Text(
                                tmp[currentPage.toInt()].nakhpod,
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(
                                  SizeConfig.blockSizeVertical * 1),
                              child: Text(
                                ': جنس نخ پود',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'IRANSansMobile'),
                              ),
                            ),
                          ],
                        ),
                      ]))),
                ],
              ),
            ),
          ),
        )));
  }
}

List<String> images = [
  "assets/image/carpet/1.jpg",
  "assets/image/carpet/2.jpg",
  "assets/image/carpet/3.jpg",
  "assets/image/carpet/4.jpg",
];

List<String> title = [
  "Hounted Ground",
  "Fallen In Love",
  "The Dreaming Moon",
  "Jack the Persian and the Black Castel",
];

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0) - 10,
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.fill),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            /* Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(title[i],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),*/
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
