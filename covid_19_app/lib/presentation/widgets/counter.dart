import 'package:covid_19_app/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_app/constants/constants.dart';
import 'package:flutter_screenutil/screen_util.dart';

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;

  const Counter({
    Key key,
    @required this.number,
    @required this.color,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(6),
            vertical: ScreenUtil().setHeight(6),
          ),
          height: ScreenUtil().setHeight(25),
          width: ScreenUtil().setWidth(25),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(10),
          ),
          child: AppTextDisplay(
            text: '$number',
            textStyle: TextStyle(
              fontSize: 40,
              color: color,
            ),
          ),
        ),
        AppTextDisplay(
          translation: title,
          textStyle: AppTextStyles.subTextStyle,
        ),
      ],
    );
  }
}
