import 'package:flutter/material.dart';
import 'package:glowing_love_candles/pages/desktop_home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 650) {
              return const DesktopView();
            } else {
              return mobileView();
            }
          },
        ),
      ),
    );
  }
}

Widget mobileView() {
  return Container(
    color: Colors.red,
  );
}
