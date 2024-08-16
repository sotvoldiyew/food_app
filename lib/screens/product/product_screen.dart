import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/product/widgets/my_filled_button.dart';
import 'package:food_app/style/app_colors.dart';
import 'package:food_app/style/app_images.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    this.foodImage = AppImages.burger1,
    this.foodName = "Cheeseburger Wendy's Burger",
    this.foodStar = 4.9,
    this.foodTimer = 26,
    this.foodInfo = "The Cheeseburger Wendy's Burger is a classic fast food "
        "burger that packs a punch of flavor in every bite. Made with a juicy "
        "beef patty cooked to perfection, it's topped with melted American "
        "cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
    this.foodPrice = 8.24,
  });

  final String foodImage;
  final String foodName;
  final String foodInfo;
  final double foodStar;
  final int foodTimer;
  final double foodPrice;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _countNumber = 1;
  double _sliderValue = 68;

  void _addCountNumber() {
    setState(() {
      _countNumber++;
    });
  }

  void _subCountNumber() {
    if (_countNumber != 1) {
      setState(() {
        _countNumber--;
      });
    }
  }

  void _onChanged(double number) {
    setState(() {
      _sliderValue = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(widget.foodImage),
                    width: 350,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                widget.foodName,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${widget.foodStar} - ${widget.foodTimer} mins",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                widget.foodInfo,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(height: 30),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 190,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Spicy",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Slider(
                          activeColor: Colors.red,
                          value: _sliderValue,
                          min: 1,
                          max: 100,
                          onChanged: _onChanged,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Mild",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green,
                                    ),
                              ),
                            ),
                            Text(
                              "Hot",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            const SizedBox(width: 4),
                            Text(
                              "Portion",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            MyFilledButton(
                              onPressed: _subCountNumber,
                              child: const Icon(
                                CupertinoIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "$_countNumber",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Inter",
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            MyFilledButton(
                              onPressed: _addCountNumber,
                              child: const Icon(
                                CupertinoIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 70,
                    width: 120,
                    child: Card(
                      color: AppColors.colorEF2A39,
                      child: Center(
                        child: Text(
                          "\$${(widget.foodPrice * _countNumber).toStringAsFixed(2)}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.color3C2F2F,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fixedSize: const Size(240, 70),
                    ),
                    child: Text(
                      "ORDER NOW",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
