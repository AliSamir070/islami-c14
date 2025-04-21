import 'package:flutter/material.dart';

import '../../../../style/Methods.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int sebhaCounter = 0;
  int tspeh = 0;
  double rotate = 0;
  List<String> tspehType = [
    'سبحان الله',
    'الحمدلله',
    'لا الله الا الله',
    'الله اكبر'
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/sebha_back.png'),
              fit: BoxFit.fill)),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/islami.png',
              width: calculateWidth(291, screenWidth),
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFFFFF),
                fontFamily: 'jannaLT',
                fontStyle: FontStyle.normal,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(
                        flex: 8,
                      ),
                      Image.asset(
                        'assets/images/mask_group.png',
                      ),
                      Spacer(
                        flex: 5,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      if (sebhaCounter < 30) {
                        sebhaCounter++;
                      } else {
                        sebhaCounter = 0;
                        if (tspeh < 3) {
                          tspeh++;
                        } else {
                          tspeh = 0;
                        }
                      }
                      rotate += 0.0333333333;

                      setState(() {});
                    },
                    child: Stack(
                      children: [
                        AnimatedRotation(
                            duration: Duration(milliseconds: 500),
                            turns: rotate,
                            child: Image.asset('assets/images/SebhaBody.png')),
                        Positioned.fill(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  tspehType[tspeh],
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFFFFFF),
                                    fontFamily: 'jannaLT',
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  sebhaCounter.toString(),
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFFFFFF),
                                    fontFamily: 'jannaLT',
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}
