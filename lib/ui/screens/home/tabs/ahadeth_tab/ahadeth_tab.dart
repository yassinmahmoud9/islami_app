import 'package:flutter/material.dart';

import '../../../../../model/details_screen_args.dart';
import '../../../detials_screen/details_screen.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/constants.dart';

class AhadethTab extends StatelessWidget {
 List<String> ahadethNames=List.generate(50, (index) {
    return"${index+1}الحديث رقم";
 });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.ahadethLogo)),
        const Divider(
          thickness: 3,
          color: AppColors.primary,
        ),
        const Text(
          "Hadeth Name ",
          style: AppTheme.appBarTitleTextStyle,
          textAlign: TextAlign.center,
        ),
        const Divider(
          thickness: 3,
          color: AppColors.primary,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: Constants.SuraNames.length,
              itemBuilder: (_, index) {
                return TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DetailsScreen.routeName,
                          arguments: DetailsScreenArgs(
                              suraOrHadethName: ahadethNames[index],
                              filename: 'h${index + 1}.txt',
                              isQuranfile: false));
                    },
                    child: Text(
                      ahadethNames[index],
                      style: AppTheme.appBarTitleTextStyle
                          .copyWith(fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ));
              }),
        )
      ],
    );
  }
}
