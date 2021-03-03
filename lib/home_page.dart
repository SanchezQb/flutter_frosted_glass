import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double containerWidth = size.width * 0.9;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/design.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: FrostedGassBox(
            width: containerWidth,
            height: containerWidth,
            child: Container(
              width: containerWidth,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Balance",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                            Text(
                              "\$ 53,000",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 40,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.payment,
                          color: Colors.white.withOpacity(0.2),
                          size: 36,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FrostedGassBox extends StatelessWidget {
  final double width, height;
  final Widget child;

  const FrostedGassBox({
    Key key,
    @required this.width,
    @required this.height,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(20.0);
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15.0, //7
                sigmaY: 15.0,
              ),
              child: Container(
                width: width,
                height: height,
                child: Text(" "),
              ),
            ),
            Opacity(
              opacity: 0.05, //0.2
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
                borderRadius: borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 30,
                    offset: Offset(2, 2),
                  )
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.1)
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
