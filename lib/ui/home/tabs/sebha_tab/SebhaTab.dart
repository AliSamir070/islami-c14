import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int counter = 0;
  int index = 2;
  List<String> Azkar = [
    "سبحان الله",
    "لا اله الا الله",
    "الله اكبر",
    "الحمد لله",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Image.asset(
            "assets/images/islami.png",
            height: 150,
            width: 290,
          ),
          SizedBox(height: 16),
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
          SizedBox(height: 16),
          Column(
            children: [
              Image.asset(
                "assets/images/sebhaTail.png",
                height: 85,
                width: 145,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      "assets/images/SebhaBody 1.png",
                      height: 380,
                      width: 380,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _onTapClick(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Azkar[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "$counter",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onTapClick() {
    angle += 10;
    counter++;
    if (counter == 35) {
      counter = 0;
      index++;
      if (index >= Azkar.length) {
        index = 0;
      }
    }
    setState(() {});
  }
}
