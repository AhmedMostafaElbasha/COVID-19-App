import 'package:covid_19_app/constants/constants.dart';
import 'package:covid_19_app/data/data.dart';
import 'package:covid_19_app/presentation/presentation.dart';
import 'package:covid_19_app/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _pageHeader(context),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _symptomsTitle(),
                    _symptomsList(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(20),
                      ),
                      child: AppTextDisplay(
                        translation: AppStrings.preventionTitle,
                        textStyle: AppTextStyles.titleTextstyle,
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(20)),
                    Column(
                      children: prevention_items
                          .map(
                            (prevention) =>
                                PreventionCard(prevention: prevention),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppPageHeader _pageHeader(BuildContext context) {
    return AppPageHeader(
      imagePath: AppIcons.coronaDoctor,
      topText:
          AppLocalizations.of(context).translate(AppStrings.getToKnowHeading),
      bottomText: AppLocalizations.of(context)
          .translate(AppStrings.aboutCovid19Heading),
      offset: offset,
    );
  }

  AppTextDisplay _symptomsTitle() {
    return AppTextDisplay(
      translation: AppStrings.symptomsTitle,
      textStyle: AppTextStyles.titleTextstyle,
    );
  }

  Padding _symptomsList() {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(20),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: symptomItems
              .map(
                (symptom) => SymptomCard(symptom: symptom),
              )
              .toList(),
        ),
      ),
    );
  }
}
