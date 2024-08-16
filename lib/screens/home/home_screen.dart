import 'package:flutter/material.dart';
import 'package:food_app/screens/home/widgets/my_card.dart';
import 'package:food_app/screens/home/widgets/my_chip.dart';
import 'package:food_app/style/app_icons.dart';
import 'package:food_app/style/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, bool> chips = {
    "All": true,
    "Combos": false,
    "Sliders": false,
    "Classic": false,
  };

  List<List<String>> products = [
    [AppImages.burger1, "Cheeseburger", "Wendy's Burger", "4.9"],
    [AppImages.burger2, "Hamburger", "Veggie Burger", "4.8"],
    [AppImages.burger3, "Hamburger", "Chicken Burger", "4.6"],
    [AppImages.burger4, "Hamburger", "Fried Chicken Burger", "4.5"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19, right: 19, top: 19),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Foodgo",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontFamily: "Lobster"),
                    ),
                    Text(
                      "Order your favourite food!",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontFamily: "Poppins",
                            color: const Color(0xff6A6A6A),
                          ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xffef2a39),
                  child: Image(
                    width: 20,
                    image: AssetImage(AppIcons.user),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 47),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Row(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 19,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 7,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          prefixIconColor: Colors.black,
                          prefix: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image(
                                width: 18,
                                image: AssetImage(AppIcons.search),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                IconButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Image(
                      width: 24,
                      image: AssetImage(AppIcons.settingsSlider),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 15),
              separatorBuilder: (BuildContext context, int index) => MyChip(
                text: chips.keys.elementAt(index),
                active: chips.values.elementAt(index),
              ),
              itemCount: chips.length + 1,
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 245,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) => InkWell(
                  onTap: () {},
                  overlayColor: WidgetStateColor.transparent,
                  child: MyCard(
                    image: products.elementAt(index)[0],
                    name: products.elementAt(index)[1],
                    name2: products.elementAt(index)[2],
                    rating: products.elementAt(index)[3],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xffef2a39),
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image(
                  width: 24,
                  image: AssetImage(AppIcons.home),
                ),
                Positioned(
                  bottom: -13,
                  left: 9,
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            Image(
              width: 24,
              image: AssetImage(AppIcons.user),
            ),
            SizedBox(width: 24),
            Image(
              width: 24,
              image: AssetImage(AppIcons.comments),
            ),
            Image(
              width: 24,
              image: AssetImage(AppIcons.heartFilled),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xffef2a39),
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(18.0),
          child: Image(
            image: AssetImage(AppIcons.plus),
          ),
        ),
      ),
    );
  }
}
