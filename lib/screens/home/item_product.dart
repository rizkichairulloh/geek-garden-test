import 'package:flutter/material.dart';
import 'package:geek_garden_test/utilities/typography.dart';

class ItemProduct extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onTapDelete;
  final VoidCallback onTapEdit;
  final String title;
  final String price;
  final String rating;
  final String count;
  final String imageUrl;

  ItemProduct({required this.title, required this.price, required this.rating, required this.count, required this.onTap,required this.onTapDelete,required this.onTapEdit, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
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
                    const SizedBox(
                      height: 36,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Harga : $price", style: kTextBody,),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Rating : $rating", style: kTextBody,),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Count : $count", style: kTextBody,),
                      ],
                    )
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
