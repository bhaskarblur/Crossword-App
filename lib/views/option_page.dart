import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_word_search/components/labels.dart';
import 'package:mobile_app_word_search/providers/home_provider.dart';
import 'package:mobile_app_word_search/utils/all_colors.dart';
import 'package:mobile_app_word_search/utils/custom_app_bar.dart';
import 'package:mobile_app_word_search/utils/font_size.dart';
import 'package:mobile_app_word_search/views/language_selection_page.dart';
import 'package:mobile_app_word_search/views/level_page.dart';
import 'package:mobile_app_word_search/views/my_account_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OptionPage extends StatelessWidget {
  const OptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(gradient: AllColors.bg),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: CustomAppBar(isBack: false, isLang: true)),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Label(
                    text: 'OPTIONS',
                    fontSize: FontSize.p2,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 14),
                CupertinoButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const LanguageSelectionPage()));
                  },
                  padding: EdgeInsets.zero,
                  minSize: 0,
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: double.maxFinite,
                      height: 55,
                      decoration: BoxDecoration(
                          color: AllColors.liteDarkPurple,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Label(
                              text: 'APP LANGUAGE/IDIOMA',
                              fontSize: FontSize.p2),
                          const SizedBox(width: 10),
                          Image.asset('assets/images/us_flag.png',
                              height: 45, width: 45),
                          const SizedBox(width: 5),
                          Image.asset('assets/images/spanish_flag.png',
                              height: 45, width: 45)
                        ],
                      )),
                ),
                const SizedBox(height: 20),
                OptionItem(
                  optionName: 'LEVEL',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LevelPage()));
                  },
                ),
                OptionItem(
                  optionName: 'MY GAMES',
                  onPressed: () {
                    final provider =
                        Provider.of<HomeProvider>(context, listen: false);
                    provider.changeSelectedIndex(2);
                  },
                ),
                OptionItem(
                  optionName: 'PLAY',
                  onPressed: () {
                    final provider =
                        Provider.of<HomeProvider>(context, listen: false);
                    provider.changeSelectedIndex(1);
                  },
                ),
                OptionItem(
                  optionName: 'MY ACCOUNT',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyAccountPage()));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class OptionItem extends StatelessWidget {
  const OptionItem({
    super.key,
    required this.optionName,
    required this.onPressed,
  });

  final String optionName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
        width: double.maxFinite,
        height: 55,
        decoration: BoxDecoration(
            color: AllColors.liteDarkPurple,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Label(
            text: optionName,
            fontSize: FontSize.p2,
          ),
        ),
      ),
    );
  }
}
