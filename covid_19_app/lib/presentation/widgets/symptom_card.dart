import 'package:covid_19_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:covid_19_app/data/data.dart';
import 'package:covid_19_app/constants/constants.dart';

class SymptomCard extends StatefulWidget {
  final Symptom symptom;

  const SymptomCard({
    Key key,
    @required this.symptom,
  }) : super(key: key);

  @override
  _SymptomCardState createState() => _SymptomCardState();
}

class _SymptomCardState extends State<SymptomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.symptom.isActive = !widget.symptom.isActive;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setHeight(10),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
          boxShadow: [
            widget.symptom.isActive
                ? BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    color: AppColors.activeShadowColor,
                  )
                : BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    color: AppColors.shadowColor,
                  ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              widget.symptom.imagePath,
              height: ScreenUtil().setHeight(90),
            ),
            AppTextDisplay(
              translation: widget.symptom.title,
              textStyle: AppTextStyles.symptomCardTitle,
            ),
          ],
        ),
      ),
    );
  }
}
