import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islami/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami/ui/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami/ui/screens/home/tabs/sebaha_tab/sebaha_tab.dart';
import 'package:islami/ui/screens/utils/app_colors.dart';
import 'package:islami/ui/screens/utils/app_theme.dart';

import '../utils/app_assets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex=0;
  List<Widget> tabs=[
    const QuranTab(),AhadethTab(),const RadioTab(),const SebahaTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: const Text(
            "Islami",
            style: AppTheme.appBarTitleTextStyle,
          ),
        ),
        body: tabs[currentindex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
        data: ThemeData(canvasColor: AppColors.primary),
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icQuran)), label: "Quran"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),
              label: "Ahadeth"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: "Sebha"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icRadio)), label: "Radio"),
        ],
            selectedItemColor: AppColors.accent,
           iconSize: 50,
          currentIndex:currentindex ,
          onTap: (index){
            currentindex=index;
            setState(() {

            });
          },

        ),
      );
}
