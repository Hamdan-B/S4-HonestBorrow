import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 60,
            right: -140,
            child: Container(
              width: 460.0,
              height: 460.0,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(222, 222, 222, 0.116),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -240,
            right: -160,
            child: Container(
              width: 460.0,
              height: 460.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color.fromRGBO(236, 236, 236, 1),
                )
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: -160,
            child: Container(
              width: 379.0,
              height: 379.0,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 0.10000000149011612),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            left: -10,
            child: Container(
              width: 190.0,
              height: 190.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    stops: [
                      0.3,
                      0.9
                    ],
                    colors: [
                      Color.fromRGBO(148, 41, 254, 1),
                      Color.fromRGBO(61, 91, 251, 1)
                    ]),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -90,
            right: -15,
            child: Container(
              width: 273.0,
              height: 273.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.2,
                      0.6
                    ],
                    colors: [
                      Color.fromARGB(255, 35, 241, 249),
                      Color.fromARGB(255, 13, 167, 255)
                    ]),
                shape: BoxShape.circle,
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
