import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors in the app
const kPrimaryColor = Color(0xfff57c00);
const kButtonColor = Color(0x8affffff);
const kTextColor = Color(0xffCAD5E2);
const kLightOrangeColor = Color(0xffffe0b2);
const kSearchBarColor = Color(0xffD6D6D6);
const kIconColor = Color(0xff7b1fa2);
const kLightGreyColor = Color(0xffe0e0e0);
const kWhiteColor = Color(0xffffffff);
const kGreyColor = Color(0xff9e9e9e);
const kBlClr = Color(0xff000000);

// All text Syle

TextStyle kExtraSmallTextStyle =
    GoogleFonts.oswald(color: kPrimaryColor, fontSize: 8);
TextStyle kSmallTextStyle =
    GoogleFonts.oswald(color: kPrimaryColor, fontSize: 10);
TextStyle kMediumTextStyle =
    GoogleFonts.oswald(color: kPrimaryColor, fontSize: 14);
TextStyle kExMediumTextStyle =
    GoogleFonts.oswald(color: kPrimaryColor, fontSize: 16);
TextStyle kLMediumTextStyle =
    GoogleFonts.oswald(color: kPrimaryColor, fontSize: 18);
TextStyle kXLMediumTextStyle =
    GoogleFonts.oswald(color: kPrimaryColor, fontSize: 22);

// WHITE TEXT

TextStyle kWhiteSmlTextStyle =
    GoogleFonts.oswald(color: kWhiteColor, fontSize: 10);
TextStyle kWhiteMdmTextStyle =
    GoogleFonts.oswald(color: kWhiteColor, fontSize: 16);
TextStyle kLargeTextStyle =
    GoogleFonts.oswald(color: kWhiteColor, fontSize: 18);
TextStyle kWhiteLrgTextStyle =
    GoogleFonts.oswald(color: kWhiteColor, fontSize: 18);
TextStyle kWtXtaTstSte = GoogleFonts.oswald(color: kWhiteColor, fontSize: 22);
TextStyle kBtXtaTstSte = GoogleFonts.oswald(color: kWhiteColor, fontSize: 24);

// BLACK COLOR TEXT
TextStyle kBlackSmlTextStyle = GoogleFonts.oswald(color: kBlClr, fontSize: 14);
TextStyle kBMdmTextStyle = GoogleFonts.oswald(color: kBlClr, fontSize: 16);

TextStyle kXBtXtaTstSte = GoogleFonts.oswald(color: kBlClr, fontSize: 20);

TextStyle kBLrgTextStyle = GoogleFonts.oswald(color: kBlClr, fontSize: 18);

//black  000000 444444 666666 and similar variants
//grey grey 959595 E5E5E5 9C9C9C CFCECEgrey 959595 E5E5E5 9C9C9C CFCECE

// test style
const kTextWeight = FontWeight.bold;
const double kSmallText = 16.0;
const double kMediumText = 20.0;
const kTextStyle =
    TextStyle(color: Colors.black, fontSize: 27, fontWeight: FontWeight.w400);

// padding
const double kDefaultPadding = 15.0;

// display mediaquery size

Size displaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}

// when no data get from the api

// const String SUCCESS_MESSAGE=" You will be contacted by us very soon.";
const String kNoimageFound = "assets/images/noImageFound.jpg";
const String kDataNotFond = "No data Found";
