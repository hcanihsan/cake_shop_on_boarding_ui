import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 38, right: 38, top: 70),
                child: Text('Let\'s Make Party',
                    style: GoogleFonts.lora(
                        fontSize: 30, fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 38,
                  right: 38,
                ),
                child: Text(
                    " \" Make Your Party More Delicious With Our Cake \" ",
                    style: GoogleFonts.lora(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff9C9C9C))),
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 53, right: 53),
                  child: Image.asset(
                    'assets/images/img_1.png',
                    width: double.maxFinite,
                    height: 318,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
