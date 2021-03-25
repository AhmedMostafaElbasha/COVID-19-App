import 'package:flutter/material.dart';
import 'package:covid_19_app/utilities/utilities.dart';

class AppTextDisplay extends StatelessWidget {
  final String translation;
  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final TextStyle textStyle;
  final TextOverflow overflow;

  AppTextDisplay({
    this.translation = '',
    this.text = '',
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      translation == ''
          ? text
          : AppLocalizations.of(context).translate(translation),
      softWrap: true,
      textAlign: textAlign,
      maxLines: maxLines,
      style: textStyle ?? TextStyle(),
      overflow: overflow,
    );
  }
}
