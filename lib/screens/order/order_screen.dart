import 'package:flutter/material.dart';
import 'package:food_app/screens/order/toppings.dart';
import 'package:food_app/screens/payment/payment_screen.dart';
import 'package:food_app/style/app_icons.dart';
import 'package:food_app/style/app_images.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({
    super.key,
    this.foodSpicy = 0,
    this.countNumber = 0,
    this.foodPrice = 0,
  });

  final double foodSpicy;
  final int countNumber;
  final double foodPrice;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late int number;
  late double sliderValue;
  late double price;

  @override
  void initState() {
    super.initState();
    number = widget.countNumber;
    sliderValue = widget.foodSpicy;
    price = widget.foodPrice;
  }

  void minus() {
    setState(() {
      if (number > 1) {
        number--;
      }
    });
  }

  void plus() {
    setState(() {
      number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: IconButton(
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                    icon: const Image(
                      image: AssetImage(AppIcons.arrowLeft),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage(AppIcons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Row(
              children: [
                const Image(
                  image: AssetImage(AppImages.separated),
                  width: 180,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 10),
                  child: SizedBox(
                    width: 180,
                    height: 310,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(height: 1.8, fontSize: 15),
                            children: [
                              TextSpan(
                                text: "Customize ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                              ),
                              const TextSpan(
                                text:
                                    "Your Burger to Your Tastes. Ultimate Experience ",
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            "Spicy",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                        Slider.adaptive(
                          value: sliderValue,
                          onChanged: (value) {
                            setState(() {
                              sliderValue = value;
                            });
                          },
                          divisions: 100,
                          activeColor: Colors.red,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Mild",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: const Color(0xff1CC019),
                                        fontSize: 14)),
                            Text("Hot",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: const Color(0xffEF2A39),
                                        fontSize: 14)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                            "Portion",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontSize: 15),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                    Color(0xffef2a39),
                                  ),
                                ),
                                onPressed: minus,
                                icon: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image(
                                    width: 15,
                                    height: 12,
                                    image: AssetImage(AppIcons.minus),
                                  ),
                                )),
                            Expanded(child: Center(child: Text("$number"))),
                            IconButton(
                              style: const ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  Color(0xffef2a39),
                                ),
                              ),
                              onPressed: plus,
                              icon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image(
                                  width: 15,
                                  height: 12,
                                  image: AssetImage(AppIcons.plus),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Text(
              "Toppings",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 105,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Toppings(name: "Tomoto", image: AppImages.food1),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Toppings(name: "onions", image: AppImages.food2),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Toppings(name: "Pickles", image: AppImages.food3),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Toppings(name: "Bacons", image: AppImages.food4),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15),
            child: Text(
              "Side options",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 19, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 118,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Toppings(name: "Fries", image: AppImages.food5),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Toppings(name: "Coleslaw", image: AppImages.food6),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Toppings(name: "Salad", image: AppImages.food7),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Toppings(name: "Onion", image: AppImages.food6),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox.expand()),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        const Text(
                          "\$",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          (widget.foodPrice * number).toStringAsFixed(2),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 38),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 200,
                  height: 65,
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                            price: price,
                          ),
                        ),
                      );
                    },
                    color: Colors.red,
                    child: Text(
                      "ORDER NOW",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 19,
                            color: Colors.white,
                            fontFamily: "Inter",
                          ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
