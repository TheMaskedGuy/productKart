import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreenWelcomeComponent extends StatelessWidget {
  const HomeScreenWelcomeComponent({Key? key}) : super(key: key);

  //  with TickerProviderStateMixin
  // late final AnimationController _controller = AnimationController(
  //     duration: const Duration(milliseconds: 2000), vsync: this)
  //   ..forward();
  // late final Animation<double> _animation = CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.easeIn,
  // );

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height / 100;
    double screenWidth = MediaQuery.of(context).size.width / 100;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: screenHeight * 100,
          width: screenWidth * 75,
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage('assets/homepage.jpg'), fit: BoxFit.fill),
          ),
        ),
        //-----------------Details Page----------------------
        Container(
          height: screenHeight * 100,
          color: Colors.white,
          width: screenWidth * 25,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Beautifully handcrafted scented candles for your delight~',
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 4,
                style: TextStyle(
                    fontSize: screenWidth * 1.5,
                    color: Colors.black,
                    fontFamily: 'DancingScript'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
