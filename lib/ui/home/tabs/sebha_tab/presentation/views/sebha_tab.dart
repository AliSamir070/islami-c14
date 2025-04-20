import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_c14/core/constants/app_images.dart';
import 'package:islami_c14/style/ColorManager.dart';
import 'package:islami_c14/ui/home/tabs/sebha_tab/presentation/views/widgets/sebha_tab_body.dart';
import 'package:islami_c14/ui/home/tabs/sebha_tab/presentation/views_model/sebha_cubit.dart';

class SebhaTab extends StatelessWidget {
  static String routeName = "SebhaTab";
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
          color: ColorManager.blackColor,
          image: DecorationImage(
              image: AssetImage(
                AppImages.sebhaScreenBackground,
              ),
            fit: BoxFit.cover
          )
      ),
      child: BlocProvider<SebhaCubit>(
          create: (context) => SebhaCubit(),
          child: const SafeArea(
              child: SebhaTabBody(),
          ),
      ),
    );
  }
}
