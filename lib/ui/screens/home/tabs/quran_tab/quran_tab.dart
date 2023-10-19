import 'package:flutter/material.dart';
import 'package:islami/ui/screens/detials_screen/details_screen.dart';
import 'package:islami/ui/screens/utils/constants.dart';

import '../../../../../model/details_screen_args.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_theme.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(AppAssets.quranLogo)),
        const Divider(
          thickness: 3,
          color: AppColors.primary,
        ),
        const Text("Sura Name ", style: AppTheme.appBarTitleTextStyle,textAlign: TextAlign.center,),
        const Divider(
          thickness: 3,
          color: AppColors.primary,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: Constants.SuraNames.length,
              itemBuilder:(_,index){
                return TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, DetailsScreen.routeName,
                      arguments:
                        DetailsScreenArgs(suraOrHadethName: Constants.SuraNames[index],
                            filename: '${index+1}.txt',
                            isQuranfile: true)

                      );

                    },
                    child: Text(Constants.SuraNames[index],style: AppTheme.appBarTitleTextStyle.copyWith(fontWeight: FontWeight.normal),textAlign: TextAlign.center,));
              }
          ),
        )

      ],
    );
  }
}
