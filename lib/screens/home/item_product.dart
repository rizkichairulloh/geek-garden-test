import 'package:flutter/material.dart';
import 'package:geek_garden_test/utilities/date_service.dart';
import 'package:geek_garden_test/utilities/typography.dart';

class ItemProduct extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  // final String date;
  final String imageUrl;

  ItemProduct({required this.title, required this.onTap, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // String dateFormat = DateService.convertDateFormat(dateTimeString: date, oldFormat: "yyyy-MM-dd'T'HH:mm:ssZ", newFormat: "dd MMM yyyy");
    return InkWell(
      onTap: onTap,
      child: Padding(padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 4,
                child: Image.network(imageUrl)),
            const SizedBox(width: 10,),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: kTextBodyBold,),
                  const SizedBox(height: 5,),
                  // Text(dateFormat, style: kTextBodySmall,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
