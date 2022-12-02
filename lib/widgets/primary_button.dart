import 'package:flutter/material.dart';

ElevatedButton primaryButton(
    {Function()? onTap,
      String? label,
      Widget? chid,
      IconData? icon,
      Color? color,
      Color? colorText,
      Color? colorBorder,
      double? width,
      double? radius,
      double widthBorder = 1.0,
      double? fontSize,
      FontWeight? fontWeight,
      bool isActive = true,
      bool border = false,
      bool max = false}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 14.5),
      shape: RoundedRectangleBorder(
        side: border
            ? BorderSide(width: widthBorder, color: colorBorder ?? Colors.black)
            : BorderSide.none,
        borderRadius: BorderRadius.circular(radius ?? 60.0),
      ),
      minimumSize: max ? const Size(500.0, 50.0) : null,
    ),
    onPressed: isActive ? onTap : null,
    child: chid ??
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Container(
              margin: const EdgeInsets.only(right: 7.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 22.0,
              ),
            )
                : const SizedBox(),
            Text(
              label ?? "",
              style: TextStyle(
                color: colorText ?? Colors.white,
                fontSize: fontSize ?? 15.0,
                fontWeight: fontWeight ?? FontWeight.w500,
              ),
            ),
          ],
        ),
  );
}
