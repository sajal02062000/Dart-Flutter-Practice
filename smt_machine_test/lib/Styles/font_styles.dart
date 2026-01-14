import 'package:flutter/material.dart';
import 'package:smt_machine_test/Constants/custom_colors.dart';

class FontStyles {
  TextStyle regularTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: const Color(0XFF043A3A),
  );

  TextStyle boldTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: const Color(0XFF043A3A),
  );

  TextStyle primaryTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: CustomColors.primaryColor,
  );

  TextStyle primaryBoldTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: CustomColors.primaryColor,
  );

  TextStyle headingTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: const Color(0XFF043A3A),
  );

  TextStyle primaryHeadingTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: CustomColors.whiteColor,
  );
}
