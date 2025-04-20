import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_c14/core/constants/app_fonts.dart';
import 'package:islami_c14/core/constants/app_images.dart';
import 'package:islami_c14/ui/home/tabs/sebha_tab/presentation/views_model/sebha_cubit.dart';
import 'package:islami_c14/ui/home/tabs/sebha_tab/presentation/views_model/sebha_state.dart';

class SebhaContent extends StatelessWidget {
  const SebhaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final sebhaController = BlocProvider.of<SebhaCubit>(context);
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 480,
                  width: 379,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 8,
                        right: 0,
                        left: 0,
                        child: Image.asset(
                          AppImages.sebhaUpperPart,
                          width: 145,
                          height: 86,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        top: 86,
                        child: GestureDetector(
                          onTap: () {
                            sebhaController.changeSebhaContent();
                          },
                          child: BlocBuilder<SebhaCubit,SebhaState>(
                            builder: (context, state) =>
                                Transform.rotate(
                                  angle: sebhaController.angle,
                                  child: Image.asset(
                                    AppImages.sebhaBody,
                                    width: 379,
                                    height: 381,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<SebhaCubit, SebhaState>(
                  builder: (context, state) => GestureDetector(
                    onTap: () {
                      sebhaController.changeSebhaContent();
                    },
                    child: Text(
                      sebhaController.currentSebhaContent,
                      textDirection: TextDirection.rtl,
                      style: AppFonts.fontSize36Bold,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 140,
                  child: BlocBuilder<SebhaCubit, SebhaState>(
                    builder: (context, state) => GestureDetector(
                      onTap: () {
                        sebhaController.changeSebhaContent();
                      },
                      child: Text(
                        sebhaController.sebhaCounter.toString(),
                        style: AppFonts.fontSize36Bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}