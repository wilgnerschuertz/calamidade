import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  return ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xff129166),
      secondary: Color(0xfffcb900),
      tertiary: Color(0xff84cc6d),
      error: Color(0xffEB5757),
    ),
    textTheme: GoogleFonts.interTextTheme(textTheme),
    extensions: const [
      CoopartilharColorsExtension(
        black: Color(0xff0D3F67),
        black2: Color(0xff255276),
        middleGrey: Color(0xffb6c5d1),
        grey: Color(0xffb6c5d1),
        lightGrey: Color(0xffF2F2F7),
        white: Color(0xffFFFFFF),
        success: Color(0xff00FF85),
        otherYellow: Color(0xffffc745),
        otherGreen: Color(0xff00b050),
      ),
    ],
  );
}

class CoopartilharColorsExtension extends ThemeExtension<CoopartilharColorsExtension> {
  const CoopartilharColorsExtension({
    required this.success,
    required this.otherYellow,
    required this.otherGreen,
    required this.black,
    required this.black2,
    required this.middleGrey,
    required this.grey,
    required this.lightGrey,
    required this.white,
  });

  final Color success;
  final Color otherYellow;
  final Color otherGreen;
  final Color black;
  final Color black2;
  final Color middleGrey;
  final Color grey;
  final Color lightGrey;
  final Color white;

  @override
  ThemeExtension<CoopartilharColorsExtension> copyWith({
    Color? success,
    Color? otherYellow,
    Color? otherGreen,
    Color? black,
    Color? black2,
    Color? middleGrey,
    Color? grey,
    Color? lightGrey,
    Color? white,
  }) {
    return CoopartilharColorsExtension(
      success: success ?? this.success,
      otherYellow: otherYellow ?? this.otherYellow,
      otherGreen: otherGreen ?? this.otherGreen,
      black: black ?? this.black,
      black2: black2 ?? this.black2,
      middleGrey: middleGrey ?? this.middleGrey,
      grey: grey ?? this.grey,
      lightGrey: lightGrey ?? this.lightGrey,
      white: white ?? this.white,
    );
  }

  @override
  ThemeExtension<CoopartilharColorsExtension> lerp(
    covariant ThemeExtension<CoopartilharColorsExtension>? other,
    double t,
  ) {
    if (other is! CoopartilharColorsExtension) {
      return this;
    }

    return CoopartilharColorsExtension(
      success: Color.lerp(success, other.success, t)!,
      otherYellow: Color.lerp(otherYellow, other.otherYellow, t)!,
      otherGreen: Color.lerp(otherGreen, other.otherGreen, t)!,
      black: Color.lerp(black, other.black, t)!,
      black2: Color.lerp(black2, other.black2, t)!,
      middleGrey: Color.lerp(middleGrey, other.middleGrey, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
      white: Color.lerp(white, other.white, t)!,
    );
  }
}
