import 'package:flutter/material.dart';
import 'package:covid_19_app/constants/constants.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid_19_app/presentation/presentation.dart';

class AppPageHeader extends StatefulWidget {
  final String imagePath;
  final String topText;
  final String bottomText;
  final double offset;

  const AppPageHeader({
    Key key,
    @required this.imagePath,
    @required this.topText,
    @required this.bottomText,
    @required this.offset,
  }) : super(key: key);

  @override
  _AppPageHeaderState createState() => _AppPageHeaderState();
}

class _AppPageHeaderState extends State<AppPageHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Clipper(),
      child: Container(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20),
          top: ScreenUtil().setHeight(25),
          right: ScreenUtil().setWidth(10),
        ),
        height: ScreenUtil().setHeight(250),
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.cyanBlueShade,
              AppColors.mediumDarkShadeBlue,
            ],
          ),
          image: DecorationImage(
            image: AssetImage(AppImagePaths.virus),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.info);
              },
              child: SvgPicture.asset(AppIcons.menu),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(10),
              ),
              child: Container(
                height: ScreenUtil().setHeight(250),
                child: Stack(
                  children: [
                    Positioned(
                      top: widget.offset < 0 ? 10 : widget.offset,
                      child: SvgPicture.asset(
                        widget.imagePath,
                        width: ScreenUtil().setWidth(205),
                        // height: ScreenUtil().setHeight(150),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Positioned(
                      top: 45 - widget.offset / 2,
                      left: 160,
                      child: Column(
                        children: [
                          AppTextDisplay(
                            text: '${widget.topText} \n ${widget.bottomText}',
                            textStyle: AppTextStyles.headingTextStyle.copyWith(
                              color: AppColors.white,
                            ),
                            maxLines: 1,
                          ),
                          AppTextDisplay(
                            text: '${widget.bottomText}',
                            textStyle: AppTextStyles.headingTextStyle.copyWith(
                              color: AppColors.white,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(),
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

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
