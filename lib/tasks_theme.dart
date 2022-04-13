import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksTheme {
  static TasksTheme of(BuildContext context, {bool listen = false}) {
    return Provider.of<TasksTheme>(context, listen: false);
  }

  static const String _fontFamilyTaskHeadline = 'Bebas Neue';
  static const String _fontFamilyStandardBody = 'Barlow Condensed';

  ThemeData? _theme;

  ThemeData get theme => _theme ??= ThemeData(
        fontFamily: _fontFamilyStandardBody,
        primaryColor: TasksTheme.staticOrangeColor,
        accentColor: TasksTheme.staticPurpleColor,
        hintColor: TasksTheme.staticPurpleColor,
        textTheme: const TextTheme(),
      );

  // Colors

  static const Color blackColor = Colors.black;
  static const whiteColor = Colors.white;
  static const staticOrangeColor = Color(0xffEC8729);
  static const staticPurpleColor = Color(0xff6130E5);
  static const prioNormalBlueColor = Color(0xff2C7FAA);
  static const prioUrgentRedColor = Color(0xffB9233B);
  static const statusDoneGreyColor = Color(0xff0c110d);
  static const statusInProgressGreenColor = Color(0xff5dad5f);
  static const statusToDoColor = Color(0xff6130E5);
  static const standardCardBackgroundColor = Color(0xfffe7cb);

  // Font Sizes

  static const double fontSize9 = 9;
  static const double fontSize10 = 10;
  static const double fontSize11 = 11;
  static const double fontSize12 = 12;
  static const double fontSize13 = 13;
  static const double fontSize14 = 14;
  static const double fontSize15 = 15;
  static const double fontSize16 = 16;
  static const double fontSize18 = 18;
  static const double fontSize20 = 20;
  static const double fontSize22 = 22;
  static const double fontSize24 = 24;
  static const double fontSize28 = 28;
  static const double fontSize32 = 32;
  static const double fontSize34 = 34;
  static const double fontSize36 = 36;
  static const double fontSize40 = 40;

  // Font Styles Regular for Body

  TextStyle? __fontRegular;

  TextStyle get _fontRegular => __fontRegular ??= TextStyle(
        color: TasksTheme.blackColor,
        fontFamily: _fontFamilyStandardBody,
        fontWeight: FontWeight.w500,
      );

  TextStyle? _fontStyle12Regular;

  TextStyle get fontStyle12Regular =>
      _fontStyle12Regular ??= _fontRegular.copyWith(
        fontSize: fontSize12,
      );

  TextStyle? _fontStyle20Regular;

  TextStyle get fontStyle20Regular =>
      _fontStyle20Regular ??= _fontRegular.copyWith(
        fontSize: fontSize20,
      );

  // Bold fonts body

  TextStyle? __fontBold;

  TextStyle get _fontBold => __fontBold ??= TextStyle(
      color: TasksTheme.blackColor,
      fontFamily: _fontFamilyStandardBody,
      fontWeight: FontWeight.w700);

  TextStyle? _fontStyle12Bold;
  TextStyle get fontStyle12Bold =>
      _fontStyle12Bold ??= _fontBold.copyWith(fontSize: fontSize12);

  TextStyle? _fontStyle20Bold;

  TextStyle get fontStyle20Bold =>
      _fontStyle20Bold ??= _fontBold.copyWith(fontSize: fontSize20);

  // Fonts Header

  TextStyle? __fontTaskHeaders;

  TextStyle get _fontTaskHeaders => __fontTaskHeaders ??= TextStyle(
        fontFamily: _fontFamilyTaskHeadline,
        color: TasksTheme.blackColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle? _fontStyleHeader24;

  TextStyle get fontStyleHeader24 =>
      _fontStyleHeader24 ??= _fontTaskHeaders.copyWith(fontSize: fontSize24);

  TextStyle? _fontStyleHeader32;

  TextStyle get fontStyleHeader32 =>
      _fontStyleHeader32 ??= _fontTaskHeaders.copyWith(fontSize: fontSize32);
}
