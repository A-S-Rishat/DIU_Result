import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => __ResultPageState();
}

class __ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/a1.png"),
          fit: BoxFit.fill,
          )
        ),
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            GlassContainer.frostedGlass(
              height: 100,
              width: 300,
              blur: 0.9,
              color: Colors.white.withOpacity(0),
              borderRadius: BorderRadius.circular(12),
              borderWidth: 0.2,
              child: Center(
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(colors: [
                    Color.fromRGBO(244, 207, 25, 1),
                    Color.fromRGBO(246, 135, 22, 1),
                    Color.fromRGBO(247, 63, 20, 1),
                  ]).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: Text(
                    "Md. Ali Shahorier Rishat",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}