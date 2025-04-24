import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {

  static const String routeName = "sebha";

  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double rotation = 0.0;
  int counter = 0;
  int phraseIndex = 0;

  final List<String> phrases = [
    "سبحان الله",
    "لا إله إلا الله",
    "الله أكبر",
    "الحمد لله",
  ];

  void rotateImage() {
    setState(() {
      rotation += 0.7;
      counter += 1;
      if (counter == 30) {
        counter = 0;
        phraseIndex = (phraseIndex + 1) % phrases.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/SebhaBackground.png")
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset("assets/images/islami.png",
              width: 299,
              height: 141,
            ),
            SizedBox(height: 21,),
            Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w700
            ),),
            SizedBox(height: 16,),
            Image.asset("assets/images/Sebhahead.png",
            width: 145,
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: rotateImage,
                  child: Transform.rotate(
                    angle: rotation,
                    child: Image.asset("assets/images/SebhaBody.png",
                      width: 379,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Center(
                        child: Text(phrases[phraseIndex],
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                          ) ,
                        ),
                      ),
                      Center(
                        child: Text("$counter",
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                          ) ,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}