import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 38, right: 38, top: 70),
                child: Text('Get More Discount',
                    style: GoogleFonts.lora(
                        fontSize: 30, fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 38,
                  right: 38,
                ),
                child: Text(
                    "\" We Have A Lot of Discount Baby, C’mon Buy Now \"",
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
                    'assets/images/img_3.png',
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
