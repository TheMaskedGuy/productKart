import 'package:flutter/material.dart';
import 'package:glowing_love_candles/pages/cart_page.dart';
import 'package:glowing_love_candles/models/product.dart';
import 'package:glowing_love_candles/models/product_info.dart';

import 'package:glowing_love_candles/widgets/product_card_widget.dart';
import 'homepage_components/homepage_welcome_component.dart';
import 'dart:ui' as ui;

class DesktopView extends StatefulWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  _DesktopViewState createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  Color clr = Colors.transparent;
  Color textColour = Colors.white;
  double scrollPosition = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 100;
    List<Widget> products = [];
    int sum = 0;
    for (var product in ProductInfo.myProducts) {
      products.add(
        ProductCard(productID: sum),
      );
      sum++;
    }

    return SafeArea(
      child: Scaffold(
          //  -----------------CUSTOM PAINTER BG------------------
          body: CustomPaint(
        size: Size(screenWidth, (screenWidth * 0.5).toDouble()),
        painter: RPSCustomPainter(),
        child: Column(
          children: [
            Expanded(
              child: Stack(children: [
                TabBarView(
                  controller: _tabController,
                  children: [
                    //----------------------HOME PAGE---------------------
                    NotificationListener(
                      onNotification: (notification) {
                        scrollPosition = _scrollController.position.pixels;
                        if (scrollPosition < 600) {
                          setState(() {
                            clr = Colors.transparent;
                            textColour = Colors.white;
                          });
                        } else {
                          setState(() {
                            clr = Colors.white;
                            textColour = Colors.black;
                          });
                        }
                        // print(scrollPosition);
                        return true;
                      },
                      child: ListView(
                        controller: _scrollController,
                        children: [
                          const HomeScreenWelcomeComponent(),
                          Column(
                            children: [
                              Row(
                                children: [
                                  products[0],
                                  products[2],
                                  products[3],
                                  products[4],
                                ],
                              ),
                              Row(
                                children: [
                                  products[5],
                                  products[6],
                                  products[7],
                                  products[8]
                                ],
                              ),
                              Row(
                                children: [
                                  products[9],
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //--------------------SHOP PAGE----------------
                    ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  products[0],
                                  products[2],
                                  products[3],
                                  products[4],
                                ],
                              ),
                              Row(
                                children: [
                                  products[5],
                                  products[6],
                                  products[7],
                                  products[8]
                                ],
                              ),
                              Row(
                                children: [
                                  products[9],
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //-----------------ABOUT PAGE-------------------------
                    Container(
                      color: Colors.white,
                      child: const Center(
                        child: Text('ToDo: implement About Page!'),
                      ),
                    ),
                  ],
                ),

                //--------------------TOP TAB BAR-------------
                Positioned(
                  top: 0.00,
                  child: Row(children: [
                    AnimatedContainer(
                      color: clr,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      width: screenWidth * 40,
                      height: screenWidth * 4,
                      child: TabBar(
                        controller: _tabController,
                        labelColor: textColour,
                        indicatorColor: textColour,
                        onTap: (int e) {
                          if (e < 1) {
                            clr = Colors.transparent;
                            textColour = Colors.white;
                          } else {
                            clr = Colors.white;
                            textColour = Colors.black;
                          }
                          setState(() {});
                        },
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1.0),
                        tabs: const [
                          Tab(
                            child: Text('HOME'),
                          ),
                          Tab(
                            child: Text('SHOP'),
                          ),
                          Tab(
                            child: Text('ABOUT'),
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      color: clr,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      width: screenWidth * 60,
                      height: screenWidth * 4,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: IconButton(
                            icon: Icon(Icons.shopping_cart_rounded),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartPage()));
                            },
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ]),
            )
          ],
        ),
      )),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffFFFFFF).withOpacity(1.0);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * -0.5000000, size.height * 0.6250000);
    path_1.cubicTo(
        size.width * -0.5000000,
        size.height * 0.6250000,
        size.width * -0.3750000,
        size.height * 0.3750000,
        size.width * -0.2500000,
        size.height * 0.3750000);
    path_1.cubicTo(size.width * -0.1250000, size.height * 0.3750000, 0,
        size.height * 0.6250000, 0, size.height * 0.6250000);
    path_1.cubicTo(
        0,
        size.height * 0.6250000,
        size.width * 0.1250000,
        size.height * 0.8750000,
        size.width * 0.2500000,
        size.height * 0.8750000);
    path_1.cubicTo(
        size.width * 0.3750000,
        size.height * 0.8750000,
        size.width * 0.5000000,
        size.height * 0.6250000,
        size.width * 0.5000000,
        size.height * 0.6250000);
    path_1.cubicTo(
        size.width * 0.5000000,
        size.height * 0.6250000,
        size.width * 0.6250000,
        size.height * 0.3750000,
        size.width * 0.7500000,
        size.height * 0.3750000);
    path_1.cubicTo(size.width * 0.8750000, size.height * 0.3750000, size.width,
        size.height * 0.6250000, size.width, size.height * 0.6250000);
    path_1.cubicTo(
        size.width,
        size.height * 0.6250000,
        size.width * 1.125000,
        size.height * 0.8750000,
        size.width * 1.250000,
        size.height * 0.8750000);
    path_1.cubicTo(
        size.width * 1.375000,
        size.height * 0.8750000,
        size.width * 1.500000,
        size.height * 0.6250000,
        size.width * 1.500000,
        size.height * 0.6250000);

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01000000;
    paint_1_stroke.color = Color(0xffFFF9F9).withOpacity(1);
    canvas.drawPath(path_1, paint_1_stroke);

    Path path_2 = Path();
    path_2.moveTo(size.width * -0.5000000, size.height * 0.3750000);
    path_2.cubicTo(
        size.width * -0.5000000,
        size.height * 0.3750000,
        size.width * -0.3750000,
        size.height * 0.1250000,
        size.width * -0.2500000,
        size.height * 0.1250000);
    path_2.cubicTo(size.width * -0.1250000, size.height * 0.1250000, 0,
        size.height * 0.3750000, 0, size.height * 0.3750000);
    path_2.cubicTo(
        0,
        size.height * 0.3750000,
        size.width * 0.1250000,
        size.height * 0.6250000,
        size.width * 0.2500000,
        size.height * 0.6250000);
    path_2.cubicTo(
        size.width * 0.3750000,
        size.height * 0.6250000,
        size.width * 0.5000000,
        size.height * 0.3750000,
        size.width * 0.5000000,
        size.height * 0.3750000);
    path_2.cubicTo(
        size.width * 0.5000000,
        size.height * 0.3750000,
        size.width * 0.6250000,
        size.height * 0.1250000,
        size.width * 0.7500000,
        size.height * 0.1250000);
    path_2.cubicTo(size.width * 0.8750000, size.height * 0.1250000, size.width,
        size.height * 0.3750000, size.width, size.height * 0.3750000);
    path_2.cubicTo(
        size.width,
        size.height * 0.3750000,
        size.width * 1.125000,
        size.height * 0.6250000,
        size.width * 1.250000,
        size.height * 0.6250000);
    path_2.cubicTo(
        size.width * 1.375000,
        size.height * 0.6250000,
        size.width * 1.500000,
        size.height * 0.3750000,
        size.width * 1.500000,
        size.height * 0.3750000);

    Paint paint_2_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01000000;
    paint_2_stroke.color = Color(0xffFFF9F9).withOpacity(1);
    canvas.drawPath(path_2, paint_2_stroke);

    Path path_3 = Path();
    path_3.moveTo(size.width * -0.5000000, size.height * 0.8750000);
    path_3.cubicTo(
        size.width * -0.5000000,
        size.height * 0.8750000,
        size.width * -0.3750000,
        size.height * 0.6250000,
        size.width * -0.2500000,
        size.height * 0.6250000);
    path_3.cubicTo(size.width * -0.1250000, size.height * 0.6250000, 0,
        size.height * 0.8750000, 0, size.height * 0.8750000);
    path_3.cubicTo(0, size.height * 0.8750000, size.width * 0.1250000,
        size.height * 1.125000, size.width * 0.2500000, size.height * 1.125000);
    path_3.cubicTo(
        size.width * 0.3750000,
        size.height * 1.125000,
        size.width * 0.5000000,
        size.height * 0.8750000,
        size.width * 0.5000000,
        size.height * 0.8750000);
    path_3.cubicTo(
        size.width * 0.5000000,
        size.height * 0.8750000,
        size.width * 0.6250000,
        size.height * 0.6250000,
        size.width * 0.7500000,
        size.height * 0.6250000);
    path_3.cubicTo(size.width * 0.8750000, size.height * 0.6250000, size.width,
        size.height * 0.8750000, size.width, size.height * 0.8750000);
    path_3.cubicTo(size.width, size.height * 0.8750000, size.width * 1.125000,
        size.height * 1.125000, size.width * 1.250000, size.height * 1.125000);
    path_3.cubicTo(
        size.width * 1.375000,
        size.height * 1.125000,
        size.width * 1.500000,
        size.height * 0.8750000,
        size.width * 1.500000,
        size.height * 0.8750000);

    Paint paint_3_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01000000;
    paint_3_stroke.color = Color(0xffFFF9F9).withOpacity(1);
    canvas.drawPath(path_3, paint_3_stroke);

    Path path_4 = Path();
    path_4.moveTo(size.width * -0.5000000, size.height * 0.1250000);
    path_4.cubicTo(
        size.width * -0.5000000,
        size.height * 0.1250000,
        size.width * -0.3750000,
        size.height * -0.1250000,
        size.width * -0.2500000,
        size.height * -0.1250000);
    path_4.cubicTo(size.width * -0.1250000, size.height * -0.1250000, 0,
        size.height * 0.1250000, 0, size.height * 0.1250000);
    path_4.cubicTo(
        0,
        size.height * 0.1250000,
        size.width * 0.1250000,
        size.height * 0.3750000,
        size.width * 0.2500000,
        size.height * 0.3750000);
    path_4.cubicTo(
        size.width * 0.3750000,
        size.height * 0.3750000,
        size.width * 0.5000000,
        size.height * 0.1250000,
        size.width * 0.5000000,
        size.height * 0.1250000);
    path_4.cubicTo(
        size.width * 0.5000000,
        size.height * 0.1250000,
        size.width * 0.6250000,
        size.height * -0.1250000,
        size.width * 0.7500000,
        size.height * -0.1250000);
    path_4.cubicTo(size.width * 0.8750000, size.height * -0.1250000, size.width,
        size.height * 0.1250000, size.width, size.height * 0.1250000);
    path_4.cubicTo(
        size.width,
        size.height * 0.1250000,
        size.width * 1.125000,
        size.height * 0.3750000,
        size.width * 1.250000,
        size.height * 0.3750000);
    path_4.cubicTo(
        size.width * 1.375000,
        size.height * 0.3750000,
        size.width * 1.500000,
        size.height * 0.1250000,
        size.width * 1.500000,
        size.height * 0.1250000);

    Paint paint_4_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01000000;
    paint_4_stroke.color = Color(0xffFFF9F9).withOpacity(1);
    canvas.drawPath(path_4, paint_4_stroke);

    Path path_5 = Path();
    path_5.moveTo(size.width * -0.5000000, size.height * -0.1250000);
    path_5.cubicTo(
        size.width * -0.5000000,
        size.height * -0.1250000,
        size.width * -0.3750000,
        size.height * -0.3750000,
        size.width * -0.2500000,
        size.height * -0.3750000);
    path_5.cubicTo(size.width * -0.1250000, size.height * -0.3750000, 0,
        size.height * -0.1250000, 0, size.height * -0.1250000);
    path_5.cubicTo(
        0,
        size.height * -0.1250000,
        size.width * 0.1250000,
        size.height * 0.1250000,
        size.width * 0.2500000,
        size.height * 0.1250000);
    path_5.cubicTo(
        size.width * 0.3750000,
        size.height * 0.1250000,
        size.width * 0.5000000,
        size.height * -0.1250000,
        size.width * 0.5000000,
        size.height * -0.1250000);
    path_5.cubicTo(
        size.width * 0.5000000,
        size.height * -0.1250000,
        size.width * 0.6250000,
        size.height * -0.3750000,
        size.width * 0.7500000,
        size.height * -0.3750000);
    path_5.cubicTo(size.width * 0.8750000, size.height * -0.3750000, size.width,
        size.height * -0.1250000, size.width, size.height * -0.1250000);
    path_5.cubicTo(
        size.width,
        size.height * -0.1250000,
        size.width * 1.125000,
        size.height * 0.1250000,
        size.width * 1.250000,
        size.height * 0.1250000);
    path_5.cubicTo(
        size.width * 1.375000,
        size.height * 0.1250000,
        size.width * 1.500000,
        size.height * -0.1250000,
        size.width * 1.500000,
        size.height * -0.1250000);

    Paint paint_5_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01000000;
    paint_5_stroke.color = Color(0xffFFF9F9).withOpacity(1);
    canvas.drawPath(path_5, paint_5_stroke);

    Path path_6 = Path();
    path_6.moveTo(size.width * -0.5000000, size.height * 1.125000);
    path_6.cubicTo(
        size.width * -0.5000000,
        size.height * 1.125000,
        size.width * -0.3750000,
        size.height * 0.8750000,
        size.width * -0.2500000,
        size.height * 0.8750000);
    path_6.cubicTo(size.width * -0.1250000, size.height * 0.8750000, 0,
        size.height * 1.125000, 0, size.height * 1.125000);
    path_6.cubicTo(0, size.height * 1.125000, size.width * 0.1250000,
        size.height * 1.375000, size.width * 0.2500000, size.height * 1.375000);
    path_6.cubicTo(
        size.width * 0.3750000,
        size.height * 1.375000,
        size.width * 0.5000000,
        size.height * 1.125000,
        size.width * 0.5000000,
        size.height * 1.125000);
    path_6.cubicTo(
        size.width * 0.5000000,
        size.height * 1.125000,
        size.width * 0.6250000,
        size.height * 0.8750000,
        size.width * 0.7500000,
        size.height * 0.8750000);
    path_6.cubicTo(size.width * 0.8750000, size.height * 0.8750000, size.width,
        size.height * 1.125000, size.width, size.height * 1.125000);
    path_6.cubicTo(size.width, size.height * 1.125000, size.width * 1.125000,
        size.height * 1.375000, size.width * 1.250000, size.height * 1.375000);
    path_6.cubicTo(
        size.width * 1.375000,
        size.height * 1.375000,
        size.width * 1.500000,
        size.height * 1.125000,
        size.width * 1.500000,
        size.height * 1.125000);

    Paint paint_6_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01000000;
    paint_6_stroke.color = Color(0xffFFF9F9).withOpacity(1);
    canvas.drawPath(path_6, paint_6_stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
