import 'package:flutter/material.dart';
import 'package:food_app/style/app_icons.dart';

class Toppings extends StatelessWidget {
  const Toppings({super.key, required this.name, required this.image});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 60,
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                child: Image(
                  width: 55,
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.white),
              ),
              SizedBox(width: 10),
              SizedBox(
                height: 20,
                width: 20,
                child: IconButton(
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(3.5)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      Color(0xffef2a39),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Image(
                    width: 20,
                    image: AssetImage(AppIcons.plus),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
