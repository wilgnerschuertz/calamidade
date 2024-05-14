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
      CoopartilharColors(
        primary: Color(0xff129166),
        secondary: Color(0xfffcb900),
        tertiary: Color(0xff84cc6d),
        error: Color(0xffEB5757),
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

class CoopartilharColors extends ThemeExtension<CoopartilharColors> {
  const CoopartilharColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.error,
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

  final Color primary;
  final Color secondary;
  final Color success;
  final Color tertiary;
  final Color error;
  final Color otherYellow;
  final Color otherGreen;
  final Color black;
  final Color black2;
  final Color middleGrey;
  final Color grey;
  final Color lightGrey;
  final Color white;

  static CoopartilharColors of(BuildContext context) {
    return Theme.of(context).extension<CoopartilharColors>()!;
  }

  @override
  ThemeExtension<CoopartilharColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
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
    return CoopartilharColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      error: error ?? this.error,
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
  ThemeExtension<CoopartilharColors> lerp(
    covariant ThemeExtension<CoopartilharColors>? other,
    double t,
  ) {
    if (other is! CoopartilharColors) {
      return this;
    }

    return CoopartilharColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      error: Color.lerp(error, other.error, t)!,
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
