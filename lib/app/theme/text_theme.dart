import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kHeadTextStyle = GoogleFonts.lato(
  textStyle: TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.w700,
    height: 1.2,
  ),
);
var kSubHeadTextStyle = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    height: 1.2,
  ),
);

var kSub2HeadTextStyle = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.2,
  ),
);

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 0),
  blurRadius: 20,
  color: Colors.black26,
);

const kLightShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12,
);
