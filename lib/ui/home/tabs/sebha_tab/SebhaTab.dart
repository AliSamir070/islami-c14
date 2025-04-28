import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double _angle=6;
  int _counter=0;
  List<String> azkar=["سبحان الله","الحمدلله","الله اكبر"];
  int currentAzkarIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/sebha_back.png"),
        fit: BoxFit.cover)
      ),
      child: Column(
        children: [
        Image.asset("assets/images/islami.png",
        width: 299,
        height: 141,),
        Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
          style:TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36,
            color: Colors.white
          )),
          SizedBox(height: 40,),
          Expanded(
              child:Stack(
                clipBehavior: Clip.none,
               alignment: Alignment.topCenter,
                children: [
                  Image.asset("assets/images/Group 37.png"),
                  Positioned(
                    top: 78,
                      child: Transform.rotate(
                        angle: _angle,
                        child: Image.asset("assets/images/SebhaBody 1.png",
                          height: 300,
                          width:300 ,),
                      )),
                  Positioned(
                   top: 170,
                    child: InkWell(
                      onTap:(){
                        _angle -=20;
                        setState(() {});
                        _tabOnSebha();
                      },
                      child: Column(
                        children: [
                          Text(azkar[currentAzkarIndex %azkar.length],
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          ) ,
                          Text("$_counter",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          )
                        ],
                      ),
                    ),
                  )

                ],
              )
          )
        ],
      ),
    );

  }

  void _tabOnSebha() {
    _counter++;
    if (_counter==33){
      _counter=0;
      currentAzkarIndex++;
    }
    setState(() {});
  }
}
