import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:covid_19_app/constants/constants.dart';
import 'package:covid_19_app/utilities/utilities.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        ScreenUtil.defaultSize.width,
        ScreenUtil.defaultSize.height,
      ),
      allowFontScaling: false,
      builder: () {
        return MaterialApp(
          initialRoute: AppRoutes.home,
          routes: AppRoutes.routes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.backgroundColor,
            fontFamily: AppFontFamilies.poppins,
            textTheme: TextTheme(
              body1: TextStyle(
                color: AppColors.bodyTextColor,
              ),
            ),
          ),
          title: 'COVID 19 App',
          supportedLocales: [
            const Locale('en'),
            const Locale('ar'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocaleLanguage in supportedLocales) {
              if (supportedLocaleLanguage.languageCode == locale.languageCode &&
                  supportedLocaleLanguage.countryCode == locale.countryCode) {
                return supportedLocaleLanguage;
              }
            }

            // If device not support with locale to get language code then default get first on from the list
            return supportedLocales.first;
          },
        );
      },
    );
  }
}
