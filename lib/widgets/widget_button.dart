import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:geek_garden_test/utilities/constants.dart';
import 'package:geek_garden_test/utilities/typography.dart';

Widget buttonRaised(text, {textColor = Colors.white, bgColor, onPressed}) {
  return ElevatedButton(
    child: Text(
      text,
      style: kTextButton.copyWith(color: textColor),
    ),
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      primary: bgColor,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    onPressed: onPressed,
  );
}

Widget buttonRaisedLoading({textColor = Colors.white, bgColor}) {
  return ElevatedButton(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Loading" ,style: kTextButton.copyWith(color: textColor),),
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              '...',
              textStyle: kTextButton.copyWith(color: textColor),
              speed: const Duration(milliseconds: 100),
            ),
          ],
          repeatForever: true,
        ),

      ],
    ),
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      primary: bgColor,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    onPressed: (){},
  );
}



Widget buttonOrange(text, {onPressed}) {
  return buttonRaised(
    text,
    bgColor: kColorOrange,
    onPressed: onPressed,
  );
}
Widget buttonOrangeLoading() {
  return buttonRaisedLoading(
    bgColor: kColorOrange,
  );
}

Widget buttonOrange16(text, {onPressed}) {
  return buttonRaised(
    text,
    textColor: kColorOrange,
    bgColor: kColorOrange16,
    onPressed: onPressed,
  );
}
Widget buttonOrange16Loading() {
  return buttonRaisedLoading(
    textColor: kColorOrange,
    bgColor: kColorOrange16,
  );
}

// Widget buttonSwitch(onToggle, status) {
//   return FlutterSwitch(
//       inactiveColor: PariColor.grey3,
//       width: 50.0,
//       height: 30.0,
//       value: status,
//       borderRadius: 30.0,
//       padding: 3.0,
//       onToggle: onToggle);
// }

Widget buttonSky(text, {onPressed}) {
  return buttonRaised(
    text,
    bgColor: kColorGreen,
    onPressed: onPressed,
  );
}
Widget buttonSkyLoading() {
  return buttonRaisedLoading(
    bgColor: kColorGreen,
  );
}

Widget buttonSky16(text, {onPressed}) {
  return buttonRaised(
    text,
    textColor: kColorSky,
    bgColor: kColorSky16,
    onPressed: onPressed,
  );
}
Widget buttonSky16Loading() {
  return buttonRaisedLoading(
    textColor: kColorSky,
    bgColor: kColorSky16,
  );
}

Widget buttonRed(text, {onPressed}) {
  return buttonRaised(
    text,
    bgColor: kColorRed,
    onPressed: onPressed,
  );
}
Widget buttonRedLoading() {
  return buttonRaisedLoading(
    bgColor: kColorRed,
  );
}

Widget buttonWhite(text, {onPressed}) {
  return buttonRaised(
    text,
    textColor: kColorRed,
    bgColor: kColorWhite,
    onPressed: onPressed,
  );
}
Widget buttonWhiteLoading() {
  return buttonRaisedLoading(
    textColor: kColorRed,
    bgColor: kColorWhite,
  );
}

Widget buttonGrey(text, {onPressed}) {
  return buttonRaised(
    text,
    textColor: kColorRed,
    bgColor: kColorGrey4,
    onPressed: onPressed,
  );
}
Widget buttonGreyLoading(text, {onPressed}) {
  return buttonRaisedLoading(
    textColor: kColorRed,
    bgColor: kColorGrey4,
  );
}
