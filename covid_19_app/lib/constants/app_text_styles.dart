import 'package:flutter/material.dart';
import 'package:covid_19_app/constants/constants.dart';

class AppTextStyles {
  static TextStyle get headingTextStyle {
    return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get subTextStyle {
    return TextStyle(
      fontSize: 16,
      color: AppColors.textLightColor,
    );
  }

  static TextStyle get titleTextstyle {
    return TextStyle(
      fontSize: 18,
      color: AppColors.titleTextColor,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get seeDetails {
    return TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get newestUpdate {
    return TextStyle(
      color: AppColors.textLightColor,
    );
  }

  static TextStyle get preventCardTitle {
    return titleTextstyle.copyWith(
      fontSize: 16,
    );
  }

  static TextStyle get preventCardDetails {
    return TextStyle(
      fontSize: 12,
    );
  }

  static TextStyle get symptomCardTitle {
    return TextStyle(
      fontWeight: FontWeight.bold,
    );
  }
}
