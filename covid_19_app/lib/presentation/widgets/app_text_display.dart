import 'package:flutter/material.dart';
import 'package:covid_19_app/utilities/utilities.dart';

class AppTextDisplay extends StatelessWidget {
  final String translation;
  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final TextStyle textStyle;

  AppTextDisplay({
    this.translation = '',
    this.text = '',
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      translation == ''
          ? text
          : AppLocalizations.of(context).translate(translation),
      softWrap: true,
      textAlign: TextAlign.start,
      maxLines: 1,
      style: textStyle ?? TextStyle(),
    );
  }
}
