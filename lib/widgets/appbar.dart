import 'package:flutter/material.dart';
import 'package:geek_garden_test/utilities/constants.dart';
import 'package:geek_garden_test/utilities/typography.dart';
import 'package:get/get.dart';

appBarContainer(text, {bottom, actions, height = 130.0}) {
  return Container(
    width: double.infinity,
    height: height,
    color: kColorGreen,
    child: AppBar(
      title: Text(
        text,
        style: kTextHeader3Bold.copyWith(color: kColorWhite),
      ),
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: kColorWhite),
      elevation: 0.0,
      bottom: bottom,
      actions: actions,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(
          Icons.chevron_left,
          size: 28.0,
        ),
        onPressed: () => Get.back(),
      ),
    ),

  );
}

appBarWithBackButton(context, text, {bottom, actions}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.chevron_left,
        size: 28.0,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(
      text,
      style: kTextHeader3Bold.copyWith(color: kColorWhite),
    ),
    backgroundColor: kColorGreen,
    iconTheme: IconThemeData(color: kColorWhite),
    elevation: 0.0,
    bottom: bottom,
  );
}