import 'package:covid_19_app/data/data.dart';
import 'package:covid_19_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_app/constants/constants.dart';
import 'package:covid_19_app/data/data.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_svg/svg.dart';

class PreventionCard extends StatelessWidget {
  final Prevention prevention;

  PreventionCard({
    Key key,
    @required this.prevention,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: ScreenUtil().setHeight(10),
      ),
      child: SizedBox(
        height: ScreenUtil().setHeight(156),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: ScreenUtil().setHeight(136),
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 24,
                      color: AppColors.shadowColor,
                    ),
                  ]),
            ),
            Image.asset(prevention.imagePath),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                  vertical: ScreenUtil().setHeight(15),
                ),
                height: ScreenUtil().setHeight(136),
                width: ScreenUtil().screenWidth - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextDisplay(
                      translation: prevention.title,
                      textStyle: AppTextStyles.preventCardTitle,
                    ),
                    Expanded(
                      child: AppTextDisplay(
                        translation: prevention.text,
                        textStyle: AppTextStyles.preventCardDetails,
                        maxLines: 4,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(AppIcons.forward),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
