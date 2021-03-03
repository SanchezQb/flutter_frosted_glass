import 'dart:ui';

import 'package:flutter/material.dart';

class HomePageLegacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double containerWidth = size.width * 0.9;
    double containerHeight = 250;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/design.jpg'),
          ),
        ),
        child: Center(
          child: Container(
            child: FrostedGlassBox(
              width: containerWidth,
              height: containerHeight,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Frosted Glass",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Frosted Glass",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FrostedGlassBox extends StatelessWidget {
  final double width, height;
  final Widget child;

  const FrostedGlassBox({
    Key key,
    @required this.width,
    @required this.height,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(30.0);
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20.0,
                sigmaY: 20.0,
              ),
              child: Container(
                width: width,
                height: height,
                child: Text(" "),
              ),
            ),
            Opacity(
              opacity: 0.15,
              child: Image.asset(
                "assets/noise.png",
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 30,
                    offset: Offset(2, 2),
                  )
                ],
                borderRadius: borderRadius,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(.5),
                    Colors.white.withOpacity(0.1),
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
