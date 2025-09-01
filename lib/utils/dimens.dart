import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const normalHeight = 805.3;

class Dimens {
//double
  static double screenHeight = ScreenUtil().screenHeight;
  static double screenWidth = ScreenUtil().screenWidth;
  static double pointFive = 0.5.r;
  static double pointEight = 0.8.r;
  // heights
  static double h1 = 1.h;
  static double h2 = 2.h;
  static double h3 = 3.h;
  static double h4 = 4.h;
  static double h5 = 5.h;
  static double h6 = 6.h;
  static double h7 = 7.h;
  static double h8 = 8.h;
  static double h9 = 9.h;
  static double h10 = 10.h;
  static double h11 = 11.h;
  static double h12 = 12.h;
  static double h13 = 13.h;
  static double h14 = 14.h;
  static double h15 = 15.h;
  static double h16 = 16.h;
  static double h17 = 17.h;
  static double h18 = 18.h;
  static double h19 = 19.h;
  static double h20 = 20.h;

//widths
  static double w1 = 1.w;
  static double w2 = 2.w;
  static double w3 = 3.w;
  static double w4 = 4.w;
  static double w5 = 5.w;
  static double w6 = 6.w;
  static double w7 = 7.w;
  static double w8 = 8.w;
  static double w9 = 9.w;
  static double w10 = 10.w;
  static double w11 = 11.w;
  static double w12 = 12.w;
  static double w13 = 13.w;
  static double w14 = 14.w;
  static double w15 = 15.w;
  static double w16 = 16.w;
  static double w17 = 17.w;
  static double w18 = 18.w;
  static double w19 = 19.w;
  static double w20 = 20.w;

  //Radius
  static double r1 = 1.r;
  static double r2 = 2.r;
  static double r3 = 3.r;
  static double r4 = 4.r;
  static double r5 = 5.r;
  static double r6 = 6.r;
  static double r7 = 7.r;
  static double r8 = 8.r;
  static double r9 = 9.r;
  static double r10 = 10.r;
  static double r11 = 11.r;
  static double r12 = 12.r;
  static double r13 = 13.r;
  static double r14 = 14.r;
  static double r15 = 15.r;
  static double r16 = 16.r;
  static double r17 = 17.r;
  static double r18 = 18.r;
  static double r19 = 19.r;
  static double r20 = 20.r;

  //fonts
  static double f1 = 1.sp;
  static double f2 = 2.sp;
  static double f3 = 3.sp;
  static double f4 = 4.sp;
  static double f5 = 5.sp;
  static double f6 = 6.sp;
  static double f7 = 7.sp;
  static double f8 = 8.sp;
  static double f9 = 9.sp;
  static double f10 = 10.sp;
  static double f11 = 11.sp;
  static double f12 = 12.sp;
  static double f13 = 13.sp;
  static double f14 = 14.sp;
  static double f15 = 15.sp;
  static double f16 = 16.sp;
  static double f17 = 17.sp;
  static double f18 = 18.sp;
  static double f19 = 19.sp;
  static double f20 = 20.sp;

// SizedBoxes for heights (up to h50)
  static var boxHeight1 = SizedBox(height: h1);
  static var boxHeight2 = SizedBox(height: h2);
  static var boxHeight3 = SizedBox(height: h3);
  static var boxHeight4 = SizedBox(height: h4);
  static var boxHeight5 = SizedBox(height: h5);
  static var boxHeight6 = SizedBox(height: h6);
  static var boxHeight7 = SizedBox(height: h7);
  static var boxHeight8 = SizedBox(height: h8);
  static var boxHeight9 = SizedBox(height: h9);
  static var boxHeight10 = SizedBox(height: h10);
  static var boxHeight11 = SizedBox(height: h11);
  static var boxHeight12 = SizedBox(height: h12);
  static var boxHeight13 = SizedBox(height: h13);
  static var boxHeight14 = SizedBox(height: h14);
  static var boxHeight15 = SizedBox(height: h15);
  static var boxHeight16 = SizedBox(height: h16);
  static var boxHeight17 = SizedBox(height: h17);
  static var boxHeight18 = SizedBox(height: h18);
  static var boxHeight19 = SizedBox(height: h19);
  static var boxHeight20 = SizedBox(height: h20);

  static var boxHeight21 = SizedBox(height: h20 + h1);
  static var boxHeight22 = SizedBox(height: h20 + h2);
  static var boxHeight23 = SizedBox(height: h20 + h3);
  static var boxHeight24 = SizedBox(height: h20 + h4);
  static var boxHeight25 = SizedBox(height: h20 + h5);
  static var boxHeight26 = SizedBox(height: h20 + h6);
  static var boxHeight27 = SizedBox(height: h20 + h7);
  static var boxHeight28 = SizedBox(height: h20 + h8);
  static var boxHeight29 = SizedBox(height: h20 + h9);
  static var boxHeight30 = SizedBox(height: h20 + h10);
  static var boxHeight31 = SizedBox(height: h20 + h11);
  static var boxHeight32 = SizedBox(height: h20 + h12);
  static var boxHeight33 = SizedBox(height: h20 + h13);
  static var boxHeight34 = SizedBox(height: h20 + h14);
  static var boxHeight35 = SizedBox(height: h20 + h15);
  static var boxHeight36 = SizedBox(height: h20 + h16);
  static var boxHeight37 = SizedBox(height: h20 + h17);
  static var boxHeight38 = SizedBox(height: h20 + h18);
  static var boxHeight39 = SizedBox(height: h20 + h19);
  static var boxHeight40 = SizedBox(height: h20 + h20);

// Repeat the pattern for h41 to h50 if needed
  static var boxHeight41 = SizedBox(height: h20 * 2 + h1);
  static var boxHeight42 = SizedBox(height: h20 * 2 + h2);
  static var boxHeight43 = SizedBox(height: h20 * 2 + h3);
  static var boxHeight44 = SizedBox(height: h20 * 2 + h4);
  static var boxHeight45 = SizedBox(height: h20 * 2 + h5);
  static var boxHeight46 = SizedBox(height: h20 * 2 + h6);
  static var boxHeight47 = SizedBox(height: h20 * 2 + h7);
  static var boxHeight48 = SizedBox(height: h20 * 2 + h8);
  static var boxHeight49 = SizedBox(height: h20 * 2 + h9);
  static var boxHeight50 = SizedBox(height: h20 * 2 + h10);

// SizedBoxes for widths (up to w50)
  static var boxWidth1 = SizedBox(width: w1);
  static var boxWidth2 = SizedBox(width: w2);
  static var boxWidth3 = SizedBox(width: w3);
  static var boxWidth4 = SizedBox(width: w4);
  static var boxWidth5 = SizedBox(width: w5);
  static var boxWidth6 = SizedBox(width: w6);
  static var boxWidth7 = SizedBox(width: w7);
  static var boxWidth8 = SizedBox(width: w8);
  static var boxWidth9 = SizedBox(width: w9);
  static var boxWidth10 = SizedBox(width: w10);
  static var boxWidth11 = SizedBox(width: w11);
  static var boxWidth12 = SizedBox(width: w12);
  static var boxWidth13 = SizedBox(width: w13);
  static var boxWidth14 = SizedBox(width: w14);
  static var boxWidth15 = SizedBox(width: w15);
  static var boxWidth16 = SizedBox(width: w16);
  static var boxWidth17 = SizedBox(width: w17);
  static var boxWidth18 = SizedBox(width: w18);
  static var boxWidth19 = SizedBox(width: w19);
  static var boxWidth20 = SizedBox(width: w20);

  static var boxWidth21 = SizedBox(width: w20 + w1);
  static var boxWidth22 = SizedBox(width: w20 + w2);
  static var boxWidth23 = SizedBox(width: w20 + w3);
  static var boxWidth24 = SizedBox(width: w20 + w4);
  static var boxWidth25 = SizedBox(width: w20 + w5);
  static var boxWidth26 = SizedBox(width: w20 + w6);
  static var boxWidth27 = SizedBox(width: w20 + w7);
  static var boxWidth28 = SizedBox(width: w20 + w8);
  static var boxWidth29 = SizedBox(width: w20 + w9);
  static var boxWidth30 = SizedBox(width: w20 + w10);
  static var boxWidth31 = SizedBox(width: w20 + w11);
  static var boxWidth32 = SizedBox(width: w20 + w12);
  static var boxWidth33 = SizedBox(width: w20 + w13);
  static var boxWidth34 = SizedBox(width: w20 + w14);
  static var boxWidth35 = SizedBox(width: w20 + w15);
  static var boxWidth36 = SizedBox(width: w20 + w16);
  static var boxWidth37 = SizedBox(width: w20 + w17);
  static var boxWidth38 = SizedBox(width: w20 + w18);
  static var boxWidth39 = SizedBox(width: w20 + w19);
  static var boxWidth40 = SizedBox(width: w20 + w20);

// Repeat the pattern for w41 to w50 if needed
  static var boxWidth41 = SizedBox(width: w20 * 2 + w1);
  static var boxWidth42 = SizedBox(width: w20 * 2 + w2);
  static var boxWidth43 = SizedBox(width: w20 * 2 + w3);
  static var boxWidth44 = SizedBox(width: w20 * 2 + w4);
  static var boxWidth45 = SizedBox(width: w20 * 2 + w5);
  static var boxWidth46 = SizedBox(width: w20 * 2 + w6);
  static var boxWidth47 = SizedBox(width: w20 * 2 + w7);
  static var boxWidth48 = SizedBox(width: w20 * 2 + w8);
  static var boxWidth49 = SizedBox(width: w20 * 2 + w9);
  static var boxWidth50 = SizedBox(width: w20 * 2 + w10);

  //Edgeinset
  static var edgA1 = EdgeInsets.all(r1);
  static var edgA2 = EdgeInsets.all(r2);
  static var edgA3 = EdgeInsets.all(r3);
  static var edgA4 = EdgeInsets.all(r4);
  static var edgA5 = EdgeInsets.all(r5);
  static var edgA6 = EdgeInsets.all(r6);
  static var edgA7 = EdgeInsets.all(r7);
  static var edgA8 = EdgeInsets.all(r8);
  static var edgA9 = EdgeInsets.all(r9);
  static var edgA10 = EdgeInsets.all(r10);
  static var edgA11 = EdgeInsets.all(r11);
  static var edgA12 = EdgeInsets.all(r12);
  static var edgA13 = EdgeInsets.all(r13);
  static var edgA14 = EdgeInsets.all(r14);
  static var edgA15 = EdgeInsets.all(r15);
  static var edgA16 = EdgeInsets.all(r16);
  static var edgA17 = EdgeInsets.all(r17);
  static var edgA18 = EdgeInsets.all(r18);
  static var edgA19 = EdgeInsets.all(r19);
  static var edgA20 = EdgeInsets.all(r20);
  //only bottom
  static var onlyBottom1 = EdgeInsets.only(bottom: r1);
  static var onlyBottom2 = EdgeInsets.only(bottom: r2);
  static var onlyBottom3 = EdgeInsets.only(bottom: r3);
  static var onlyBottom4 = EdgeInsets.only(bottom: r4);
  static var onlyBottom5 = EdgeInsets.only(bottom: r5);
  static var onlyBottom6 = EdgeInsets.only(bottom: r6);
  static var onlyBottom7 = EdgeInsets.only(bottom: r7);
  static var onlyBottom8 = EdgeInsets.only(bottom: r8);
  static var onlyBottom9 = EdgeInsets.only(bottom: r9);
  static var onlyBottom10 = EdgeInsets.only(bottom: r10);
  static var onlyBottom11 = EdgeInsets.only(bottom: r11);
  static var onlyBottom12 = EdgeInsets.only(bottom: r12);
  static var onlyBottom13 = EdgeInsets.only(bottom: r13);
  static var onlyBottom14 = EdgeInsets.only(bottom: r14);
  static var onlyBottom15 = EdgeInsets.only(bottom: r15);
  static var onlyBottom16 = EdgeInsets.only(bottom: r16);
  static var onlyBottom17 = EdgeInsets.only(bottom: r17);
  static var onlyBottom18 = EdgeInsets.only(bottom: r18);
  static var onlyBottom19 = EdgeInsets.only(bottom: r19);
  static var onlyBottom20 = EdgeInsets.only(bottom: r20);
  //top
  static var onlyTop1 = EdgeInsets.only(top: r1);
  static var onlyTop2 = EdgeInsets.only(top: r2);
  static var onlyTop3 = EdgeInsets.only(top: r3);
  static var onlyTop4 = EdgeInsets.only(top: r4);
  static var onlyTop5 = EdgeInsets.only(top: r5);
  static var onlyTop6 = EdgeInsets.only(top: r6);
  static var onlyTop7 = EdgeInsets.only(top: r7);
  static var onlyTop8 = EdgeInsets.only(top: r8);
  static var onlyTop9 = EdgeInsets.only(top: r9);
  static var onlyTop10 = EdgeInsets.only(top: r10);
  static var onlyTop11 = EdgeInsets.only(top: r11);
  static var onlyTop12 = EdgeInsets.only(top: r12);
  static var onlyTop13 = EdgeInsets.only(top: r13);
  static var onlyTop14 = EdgeInsets.only(top: r14);
  static var onlyTop15 = EdgeInsets.only(top: r15);
  static var onlyTop16 = EdgeInsets.only(top: r16);
  static var onlyTop17 = EdgeInsets.only(top: r17);
  static var onlyTop18 = EdgeInsets.only(top: r18);
  static var onlyTop19 = EdgeInsets.only(top: r19);
  static var onlyTop20 = EdgeInsets.only(top: r20);
  //right only
  static var onlyRight1 = EdgeInsets.only(right: r1);
  static var onlyRight2 = EdgeInsets.only(right: r2);
  static var onlyRight3 = EdgeInsets.only(right: r3);
  static var onlyRight4 = EdgeInsets.only(right: r4);
  static var onlyRight5 = EdgeInsets.only(right: r5);
  static var onlyRight6 = EdgeInsets.only(right: r6);
  static var onlyRight7 = EdgeInsets.only(right: r7);
  static var onlyRight8 = EdgeInsets.only(right: r8);
  static var onlyRight9 = EdgeInsets.only(right: r9);
  static var onlyRight10 = EdgeInsets.only(right: r10);
  static var onlyRight11 = EdgeInsets.only(right: r11);
  static var onlyRight12 = EdgeInsets.only(right: r12);
  static var onlyRight13 = EdgeInsets.only(right: r13);
  static var onlyRight14 = EdgeInsets.only(right: r14);
  static var onlyRight15 = EdgeInsets.only(right: r15);
  static var onlyRight16 = EdgeInsets.only(right: r16);
  static var onlyRight17 = EdgeInsets.only(right: r17);
  static var onlyRight18 = EdgeInsets.only(right: r18);
  static var onlyRight19 = EdgeInsets.only(right: r19);
  static var onlyRight20 = EdgeInsets.only(right: r20);

  //left
  static var onlyLeft1 = EdgeInsets.only(left: r1);
  static var onlyLeft2 = EdgeInsets.only(left: r2);
  static var onlyLeft3 = EdgeInsets.only(left: r3);
  static var onlyLeft4 = EdgeInsets.only(left: r4);
  static var onlyLeft5 = EdgeInsets.only(left: r5);
  static var onlyLeft6 = EdgeInsets.only(left: r6);
  static var onlyLeft7 = EdgeInsets.only(left: r7);
  static var onlyLeft8 = EdgeInsets.only(left: r8);
  static var onlyLeft9 = EdgeInsets.only(left: r9);
  static var onlyLeft10 = EdgeInsets.only(left: r10);
  static var onlyLeft11 = EdgeInsets.only(left: r11);
  static var onlyLeft12 = EdgeInsets.only(left: r12);
  static var onlyLeft13 = EdgeInsets.only(left: r13);
  static var onlyLeft14 = EdgeInsets.only(left: r14);
  static var onlyLeft15 = EdgeInsets.only(left: r15);
  static var onlyLeft16 = EdgeInsets.only(left: r16);
  static var onlyLeft17 = EdgeInsets.only(left: r17);
  static var onlyLeft18 = EdgeInsets.only(left: r18);
  static var onlyLeft19 = EdgeInsets.only(left: r19);
  static var onlyLeft20 = EdgeInsets.only(left: r20);

  static BorderRadius circularBorderRadius = BorderRadius.circular(r5);

  //symetric
  static var edgeV16H12 = EdgeInsets.symmetric(vertical: h16, horizontal: w12);
  static var edgeH8 = EdgeInsets.symmetric(horizontal: f8);
  static var edgeH12 = EdgeInsets.symmetric(horizontal: f12);
}
