import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_word_search/components/labels.dart';
import 'package:mobile_app_word_search/providers/game_screen_provider.dart';
import 'package:mobile_app_word_search/providers/home_provider.dart';
import 'package:mobile_app_word_search/utils/all_colors.dart';
import 'package:mobile_app_word_search/utils/buttons.dart';
import 'package:mobile_app_word_search/utils/custom_app_bar.dart';
import 'package:mobile_app_word_search/utils/font_size.dart';
import 'package:mobile_app_word_search/views/category_page.dart';
import 'package:mobile_app_word_search/widget/navigator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final TextEditingController _playByCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(gradient: AllColors.bg),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: CustomAppBar(
                isBack: false,
                isLang: true,
              )),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Label(
                        text: 'PLAY',
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.h5),
                    const SizedBox(height: 20),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.only(left: 30, right: 20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: AllColors.liteDarkPurple,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: TextFormField(
                            style: const TextStyle(
                                fontSize: FontSize.p2, color: AllColors.white),
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                  fontSize: FontSize.p2,
                                  color: AllColors.white),
                              suffixIcon: Icon(
                                Icons.search_sharp,
                                color: AllColors.white,
                              ),
                            ),
                            onSaved: (value) {}),
                      ),
                    ),
                    SearchButton(
                        onPressed: () {
                          final gameScreenProvider =
                              Provider.of<GameScreenProvider>(context,
                                  listen: false);
                          gameScreenProvider.changeGameType('randomwordsearch');
                          final provider =
                              Provider.of<HomeProvider>(context, listen: false);
                          provider.changeSelectedIndex(4);
                        },
                        title: 'RANDOM WORD SEARCH'),
                    SearchButton(
                        onPressed: () {
                          Nav.push(context, const CategoryPage());
                        },
                        title: 'WORD SEARCH CATEGORIES'),
                    SearchButton(
                        onPressed: () {
                          final gameScreenProvider =
                              Provider.of<GameScreenProvider>(context,
                                  listen: false);
                          gameScreenProvider
                              .changeGameType('randomwordchallenge');
                          final provider =
                              Provider.of<HomeProvider>(context, listen: false);
                          provider.changeSelectedIndex(4);
                        },
                        title: 'RANDOM CHALLENGE'),
                    SearchButton(
                        onPressed: () {
                          Nav.push(context, const CategoryPage());
                        },
                        title: 'CHALLENGE BY CATEGORY'),
                    const SizedBox(height: 12),
                    const Label(
                        text: 'Play by entering code',
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.h5),
                    const SizedBox(height: 20),
                    Container(
                        height: 60,
                        padding: const EdgeInsets.only(left: 30, right: 20),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: AllColors.liteDarkPurple,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: TextFormField(
                                controller: _playByCodeController,
                                style: const TextStyle(
                                    fontSize: FontSize.p2,
                                    color: AllColors.white),
                                decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    hintText: 'Enter  Code',
                                    hintStyle: TextStyle(
                                        fontSize: FontSize.p2,
                                        color: AllColors.white)),
                                onSaved: (value) {}))),
                    const SizedBox(height: 20),
                    ShadowButton(
                        onPressed: () {
                          final gameScreenProvider =
                              Provider.of<GameScreenProvider>(context,
                                  listen: false);
                          gameScreenProvider.changeGameType('gamewithcode');
                          gameScreenProvider
                              .changeSearch(_playByCodeController.text);

                          final provider =
                              Provider.of<HomeProvider>(context, listen: false);
                          provider.changeSelectedIndex(4);
                        },
                        title: 'PLAY WITH THE ENTERED CODE',
                        fillColors: const [
                          AllColors.liteOrange,
                          AllColors.orange
                        ])
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Container(
        height: 55,
        margin: const EdgeInsets.only(top: 12),
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: AllColors.liteDarkPurple,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
            child: Label(
          text: title,
          fontSize: FontSize.p2,
        )),
      ),
    );
  }
}
