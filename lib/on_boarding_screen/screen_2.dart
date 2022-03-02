import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 53, right: 53),
                child: Image.asset(
                  'assets/images/img_2.png',
                  width: double.maxFinite,
                  height: 318,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 38, right: 38, top: 60),
                child: Text('Order Cake For Gift',
                    style: GoogleFonts.lora(
                        fontSize: 30, fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 38,
                  right: 38,
                ),
                child: Text("\" Give Cake to Your Friends, Family, Etc \"",
                    style: GoogleFonts.lora(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff9C9C9C))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
