import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnProcess extends StatelessWidget {
  const OnProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("in progress"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset("assets/animation/on_process.json"),
      ),
    );
  }
}
