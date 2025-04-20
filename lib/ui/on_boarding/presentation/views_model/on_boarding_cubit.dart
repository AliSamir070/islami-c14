import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_c14/core/constants/app_data/app_data.dart';
import 'package:islami_c14/style/PrefsManager.dart';
import 'package:islami_c14/ui/home/home_screen.dart';
import 'package:islami_c14/ui/on_boarding/data/models/on_boarding_model.dart';
import 'package:islami_c14/ui/on_boarding/presentation/views_model/on_boarding_state.dart';


class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial()) {
    onInit();
  }
  late PageController onBoardingPageController;
  late OnBoardingModel currentOnBoarding;
  late bool isFirstTime;
  int currentPageIndex = 0;

  void onInit() {
    currentOnBoarding = AppData.onBoardingList[currentPageIndex];
    onBoardingPageController = PageController();
  }

  void getCurrentIndex(int index) {
    currentPageIndex = index;
    emit(ChangingOnBoardingScreenState());
  }

 void finishButton({required BuildContext context}){
     Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
     PrefsManager.saveOnBoardingFirstTime();
  }

  void moveToSelectedPage({required int index}) {
    onBoardingPageController.jumpToPage(index);
    emit(ChangingOnBoardingScreenState());
  }

  void moveToNextPage() {
    onBoardingPageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    emit(ChangingOnBoardingScreenState());
  }

  void moveToPreviousPage() {
    onBoardingPageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    emit(ChangingOnBoardingScreenState());
  }

  @override
  Future<void> close() {
    onBoardingPageController.dispose();
    return super.close();
  }
}
