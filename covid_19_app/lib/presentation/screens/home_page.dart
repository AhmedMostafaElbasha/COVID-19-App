import 'dart:developer';

import 'package:covid_19_app/constants/constants.dart';
import 'package:covid_19_app/presentation/presentation.dart';
import 'package:covid_19_app/utilities/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = controller.hasClients ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            AppPageHeader(
              imagePath: AppIcons.doctorCorona,
              topText: AppLocalizations.of(context)
                  .translate(AppStrings.allYouNeedHeading),
              bottomText: AppLocalizations.of(context)
                  .translate(AppStrings.isStayAtHomeHeading),
              offset: offset,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20),
              ),
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight(5),
                horizontal: ScreenUtil().setWidth(10),
              ),
              height: ScreenUtil().setHeight(40),
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: AppColors.grey90,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: ScreenUtil().setWidth(10),
                    ),
                    child: SvgPicture.asset(AppIcons.mapsAndFlags),
                  ),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset(AppIcons.dropdown),
                      value: AppStrings.indonesia,
                      items: [
                        AppStrings.indonesia,
                        AppStrings.bangladesh,
                        AppStrings.unitedStates,
                        AppStrings.japan,
                        AppStrings.egypt,
                      ].map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: AppTextDisplay(
                              translation: value,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(20)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20),
              ),
              child: Column(
                children: [
                  _casesStudyTitle(context),
                  _caseUpdateSatatistics(),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            _spreadOfVirusMapTitle(),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(16),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20),
                vertical: ScreenUtil().setHeight(20),
              ),
              height: ScreenUtil().setHeight(168),
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 30,
                    color: AppColors.shadowColor,
                  ),
                ],
              ),
              child: Image.asset(
                AppImagePaths.map,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _spreadOfVirusMapTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTextDisplay(
            translation: AppStrings.spreadOfVirusTitle,
            textStyle: AppTextStyles.titleTextstyle,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(1),
            ),
            child: seeDetailsButton(),
          ),
        ],
      ),
    );
  }

  Row _casesStudyTitle(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    "${AppLocalizations.of(context).translate(AppStrings.caseUpdateTitle)}\n",
                style: AppTextStyles.titleTextstyle,
              ),
              TextSpan(
                text: AppLocalizations.of(context)
                    .translate(AppStrings.newestUpdate),
                style: AppTextStyles.newestUpdate,
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(12),
          ),
          child: seeDetailsButton(),
        ),
      ],
    );
  }

  Padding _caseUpdateSatatistics() {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(20),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setHeight(20),
          vertical: ScreenUtil().setWidth(20),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 30,
              color: AppColors.shadowColor,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Counter(
              color: AppColors.infectedColor,
              number: 1046,
              title: AppStrings.infected,
            ),
            Counter(
              color: AppColors.deathColor,
              number: 87,
              title: AppStrings.deaths,
            ),
            Counter(
              color: AppColors.recovercolor,
              number: 46,
              title: AppStrings.recovered,
            ),
          ],
        ),
      ),
    );
  }

  Widget seeDetailsButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.info);
      },
      child: AppTextDisplay(
        translation: AppStrings.seeDetails,
        textStyle: AppTextStyles.seeDetails,
      ),
    );
  }
}
