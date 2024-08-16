import 'package:flutter/material.dart';
import 'package:food_app/style/app_icons.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {super.key,
      required this.image,
      required this.name,
      required this.rating,
      required this.name2});

  final String image;
  final String name;
  final String name2;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                width: 120,
                image: AssetImage(image),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              name2,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Image(
                      width: 20,
                      image: AssetImage(AppIcons.star),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      rating,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                const Image(
                  width: 24,
                  image: AssetImage(AppIcons.heart),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
