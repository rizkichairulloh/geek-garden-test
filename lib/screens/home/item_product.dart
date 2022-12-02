import 'package:flutter/material.dart';
import 'package:geek_garden_test/utilities/date_service.dart';
import 'package:geek_garden_test/utilities/typography.dart';

class ItemProduct extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onTapDelete;
  final VoidCallback onTapEdit;
  final String title;
  // final String date;
  final String imageUrl;

  ItemProduct({required this.title, required this.onTap,required this.onTapDelete,required this.onTapEdit, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // String dateFormat = DateService.convertDateFormat(dateTimeString: date, oldFormat: "yyyy-MM-dd'T'HH:mm:ssZ", newFormat: "dd MMM yyyy");
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Image.network(imageUrl, width: 100, height: 100,),),
              const SizedBox(width: 10,),
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: kTextBodyBold,),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                  child: Column(
                  children: [
                    InkWell(
                      onTap: onTapEdit ,
                      child: const Icon(Icons.edit, color: Colors.black,),
                    ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: onTapDelete ,
                    child: const Icon(Icons.delete_forever, color: Colors.red,),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
