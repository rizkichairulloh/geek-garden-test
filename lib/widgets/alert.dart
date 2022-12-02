import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geek_garden_test/utilities/constants.dart';
import 'package:get/get.dart';

Timer? _timer;

class AlertApp {
  static alertWarning(String title, String message,
      {Widget? child, int? duration}) async {
    _timer = Timer(Duration(milliseconds: duration ?? 4000), () {
      Get.back();
    });
    await Get.dialog(
        AlertDialog(
            contentPadding:
            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 32.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            content: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: IconButton(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            padding: const EdgeInsets.only(),
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 50.0,
                                width: 50.0,
                                child: Image.asset(
                                  'assets/icon/alert/remove.png',
                                  filterQuality: FilterQuality.high,
                                )),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text(title,
                                style: const TextStyle(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w900)),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(message,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300)),
                            const SizedBox(
                              height: 15.0,
                            ),
                            child ?? const SizedBox()
                          ]),
                    ),
                  ],
                ))),
        barrierColor: Colors.black38)
        .then((val) {
      if (_timer!.isActive) {
        _timer!.cancel();
      }
    });
  }

  static alertError(String title, String message) async {
    _timer = Timer(const Duration(milliseconds: 2200), () {
      Get.back();
    });
    await Get.dialog(
        AlertDialog(
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70.0,
                  width: 70.0,
                  child: Icon(
                    Icons.error_outline_sharp,
                    size: 70.0,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 24.0,
                      color: kColorBlack,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: kColorGreen,
                      fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () => Get.back(),
            ),
          ],
        ),
        barrierColor: Colors.black38)
        .then((val) {
      if (_timer!.isActive) {
        _timer!.cancel();
      }
    });
  }

  static alertSuccess(String title, String message,
      {Widget? child, int? duration}) async {
    _timer = Timer(const Duration(milliseconds: 2200), () {
      Get.back();
    });
    await Get.dialog(
        AlertDialog(
            contentPadding:
            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 32.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            content: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: IconButton(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            padding: const EdgeInsets.only(),
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 50.0,
                                width: 50.0,
                                child: Image.asset(
                                  'assets/icon/alert/check.png',
                                  filterQuality: FilterQuality.high,
                                )),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text(title,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900)),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(message,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300)),
                            const SizedBox(
                              height: 15.0,
                            ),
                            child ?? const SizedBox()
                          ]),
                    ),
                  ],
                ))),
        barrierColor: Colors.black38)
        .then((val) {
      if (_timer!.isActive) {
        _timer!.cancel();
      }
    });
  }

  static alertConfirm(String title, String message, Function() onTapConfim,
      Function() onTapCancle) async {
    return await Get.dialog(
      AlertDialog(
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70.0,
                width: 70.0,
                child: Icon(
                  Icons.report_outlined,
                  size: 70.0,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 24.0,
                    color: kColorBlack,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.0,
                    color: kColorGreen,
                    fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: onTapConfim,
                child: const Text("Iya"),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: onTapCancle,
                child: const Text(
                  "Tidak",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
