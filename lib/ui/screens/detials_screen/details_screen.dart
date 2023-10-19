import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/details_screen_args.dart';
import 'package:islami/ui/screens/home/home_screen.dart';
import 'package:islami/ui/screens/utils/constants.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_theme.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = "details_screen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArgs arguments;

  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if (fileContent.isEmpty) readFile();
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
          title: Text(
            arguments.suraOrHadethName,
            style: AppTheme.appBarTitleTextStyle,
          ),
        ),
        body: fileContent.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.white),
                child: SingleChildScrollView(
                  child: Text(
                    fileContent,
                    textDirection: TextDirection.rtl,
                    style:
                        const TextStyle(fontSize: 24, color: AppColors.accent),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
      ),
    );
  }

  void readFile() async {
    String file = await rootBundle.loadString(arguments.isQuranfile
        ? "assets/files/quran/${arguments.filename}"
        : "assets/files/ahadeth/${arguments.filename}");
    fileContent = file;
    List<String> fileLines = file.split("\n");
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += arguments.isQuranfile ? "(${i + 1})" : " ";
    }
    fileContent = fileLines.join();
    setState(() {});
  }
}
