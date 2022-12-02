import 'package:flutter/material.dart';
import 'package:geek_garden_test/utilities/typography.dart';
import 'package:geek_garden_test/widgets/widget_button.dart';
import 'package:get/get.dart';

class ModalYesNo extends StatelessWidget {

  final String title, message, txtNo, txtYes;
  final Icon icon;
  final Function onTap;
  final VoidCallback onTapNo;

  ModalYesNo({required this.title,required this.message, required this.icon,required this.onTap,required this.onTapNo, this.txtNo = "Tidak", this.txtYes = "Ya"});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),

      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: kTextHeader3Bold,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              message,
              style: kTextBody,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 26,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: buttonWhite(
                        txtNo,
                        onPressed: onTapNo
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: buttonSky(
                        txtYes,
                        onPressed: onTap
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
