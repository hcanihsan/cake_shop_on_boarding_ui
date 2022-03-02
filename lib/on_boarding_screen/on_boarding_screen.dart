import 'package:cake_shop_on_boarding_ui/home/home_page.dart';
import 'package:cake_shop_on_boarding_ui/on_boarding_screen/screen_1.dart';
import 'package:cake_shop_on_boarding_ui/on_boarding_screen/screen_2.dart';
import 'package:cake_shop_on_boarding_ui/on_boarding_screen/screen_3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  final _controller = PageController();

  void getChangedPage(int page) {
    currentPage = page;
    setState(() {});
  }

  final List itemList = [const Screen1(), const Screen2(), const Screen3()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (OverscrollIndicatorNotification
                          overscrollIndicatorNotification) {
                        overscrollIndicatorNotification.disallowIndicator();
                        return true;
                      },
                      child: PageView.builder(
                          controller: _controller,
                          physics: const ClampingScrollPhysics(),
                          itemCount: itemList.length,
                          onPageChanged: (int page) {
                            getChangedPage(page);
                          },
                          itemBuilder: (context, i) {
                            return itemList[i];
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Visibility(
                      visible: currentPage < 2 ? true : true,
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        alignment: Alignment.bottomLeft,
                        child: Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 61),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (var i = 0; i < itemList.length; i++)
                                    if (i == currentPage) ...[
                                      circleBar(true)
                                    ] else
                                      circleBar(false),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    currentPage < 2
                        ? Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                _controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                width: 106,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFF9A3D),
                                    borderRadius: BorderRadius.circular(30)),
                                margin: const EdgeInsets.only(
                                    right: 30, bottom: 50),
                                child: Center(
                                    child: Text('Next',
                                        style: GoogleFonts.lora(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 17))),
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const HomePage()));
                              },
                              child: Container(
                                width: 106,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFF9A3D),
                                    borderRadius: BorderRadius.circular(30)),
                                margin: const EdgeInsets.only(
                                    right: 30, bottom: 50),
                                child: Center(
                                    child: Text('Let\'s Go',
                                        style: GoogleFonts.lora(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 17))),
                              ),
                            ),
                          )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget circleBar(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 4),
    height: isActive ? 12 : 8,
    width: isActive ? 12 : 8,
    decoration: BoxDecoration(
        color: isActive ? const Color(0xffFF9A3D) : const Color(0xff9C9C9C),
        borderRadius: const BorderRadius.all(Radius.circular(12))),
  );
}
