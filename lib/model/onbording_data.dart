class OnBoardingData {
  final String imagePath;
  final String title;
  final String? description;

  OnBoardingData(
      {required this.description,
      required this.imagePath,
      required this.title});
  static List<OnBoardingData> onBoardingList = [
    OnBoardingData(
        description: "description",
        imagePath: "assets/images/page5.png",
        title: "Welcome To Islmi App"),
    OnBoardingData(
        description: "Read, and your Lord is the Most Generous",
        imagePath: "assets/images/Frame 3.png",
        title: "Welcome To Islami"),
    OnBoardingData(
        description: "Praise the name of your Lord, the Most High",
        imagePath: "assets/images/pag2.png",
        title: "Reading the Quran"),
    OnBoardingData(
        description: "You can listen to the Holy Quran Radio through the application for free and easily",
        imagePath: "assets/images/pag3.png",
        title: "Bearish"),
    OnBoardingData(
        description: "We Are Very Excited To Have You In Our Communityc",
        imagePath: "assets/images/page4.png",
        title: "Holy Quran Radio")
  ];
}
