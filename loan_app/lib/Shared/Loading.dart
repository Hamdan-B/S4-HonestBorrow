import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 228, 228, 228),
      child: const Center(
        child: SpinKitCircle(
          color: Color.fromARGB(255, 90, 79, 239),
          size: 50.0,
        ),
      ),
    );
  }
}