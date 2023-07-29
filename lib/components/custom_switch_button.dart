import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_word_search/components/custom_dialogs.dart';
import 'package:mobile_app_word_search/components/suggestion/model/suggestion.dart';

import '../utils/all_colors.dart';
import '../utils/font_size.dart';
import 'labels.dart';

class CustomSwitchButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomSwitchButton({
    super.key,
    required this.onPressed,
    required this.labels,
    required this.infoButton,
  });

  final List<String> labels;

  final bool infoButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoButton(
            onPressed: onPressed,
            minSize: 0,
            padding: EdgeInsets.zero,
            child: Container(
              width: double.maxFinite,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AllColors.black.withOpacity(0.8),
                      offset: const Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 0,
                    ),
                    const BoxShadow(
                      color: AllColors.darkPurple,
                      offset: Offset(1, 1),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AllColors.superLitePurple)),
              child: Row(
                children: [
                  EnabledSwitch(labels: labels),
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.lock_fill,
                            color: AllColors.liteGreen,
                            size: 28,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Label(
                            text: labels.last,
                            fontSize: FontSize.p2,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 6,
        ),
        infoButton
            ? CupertinoButton(
                onPressed: () {
                  CustomDialog()
                      .showSuggestionDialog(context: context, suggestions: [
                    Suggestion(
                      'Maximum Word\nLength',
                      'The maximum allowance for the length of a word is 14 letters.',
                    ),
                    Suggestion(
                      'What is a\ndynamic word\nsearch?',
                      'A dynamic word search is one in which the grid is different for each player. In addition, the creator can select the number of words that will be displayed in the word search.',
                    ),
                    Suggestion(
                      'What is a\nchallenge?',
                      'In a challenge, there are correct and incorrect words in the list and in the grid. You should only mark the words that correspond to the title of the challenge. For example, if the title of the challenge is: European Countries, you should only mark the European countries, those that are not from Europe should not be marked as they would be incorrect.',
                    ),
                  ]);
                },
                minSize: 0,
                padding: EdgeInsets.zero,
                child: Icon(
                  Icons.info_outline,
                  color: AllColors.white,
                  size: 36,
                ))
            : Container()
      ],
    );
  }
}

class EnabledSwitch extends StatelessWidget {
  const EnabledSwitch({
    super.key,
    required this.labels,
  });

  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
          BoxShadow(
            color: AllColors.superLitePurple,
            offset: Offset(0, 0),
            blurRadius: 0,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: AllColors.white.withOpacity(.4),
            offset: Offset(-3, 6),
            blurRadius: 8,
            spreadRadius: -13,
          ),
          BoxShadow(
            color: AllColors.white.withOpacity(.7),
            offset: Offset(2, -6),
            blurRadius: 5,
            spreadRadius: -10,
          ),
          BoxShadow(
            color: AllColors.darkLitePurple,
            offset: Offset(-1, -1),
            blurRadius: 10,
            spreadRadius: -3,
          ),
        ]),
        child: Center(
            child: Label(
          text: labels.first,
          fontSize: FontSize.p2,
          fontWeight: FontWeight.w500,
        )),
      ),
    );
  }
}
