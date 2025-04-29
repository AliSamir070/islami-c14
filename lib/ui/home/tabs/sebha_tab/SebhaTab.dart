import 'package:flutter/material.dart';
import 'package:islami_c14/style/app_assets.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  List<String> tazkeer = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
  ];

  int index = 0;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sebhaTabBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          spacing: 16,
          children: [
            Image.asset(AppAssets.logo, width: width * .8),
            const Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const Row(),
                  Image.asset(AppAssets.sebhaHead, width: width * .4),
                  Positioned.fill(
                    top: MediaQuery.sizeOf(context).height * 0.03,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _toSebhaClick();
                          },
                          child: Transform.rotate(
                            angle: angle,
                            child: Image.asset(AppAssets.sebhaBody,
                                width: width * .9),
                          ),
                        ),
                        Column(
                          spacing: 8,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tazkeer[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              counter.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toSebhaClick() {
    angle += 16;
    counter++;
    if (counter == 33) {
      counter = 0;
      index++;
      if (index == tazkeer.length) {
        index = 0;
      }
    }
    setState(() {});
  }
}
