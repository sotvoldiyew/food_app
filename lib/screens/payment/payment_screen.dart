import 'package:flutter/material.dart';
import 'package:food_app/router/router_names.dart';
import 'package:food_app/style/app_colors.dart';
import 'package:food_app/style/app_icons.dart';
import 'package:food_app/style/app_images.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, this.price = 0});

  final double price;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  late double price;
  bool _value = true;
  int _radioListTileValue = 1;

  @override
  void initState() {
    super.initState();

    price = widget.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 0, top: 20),
          child: InkWell(
            overlayColor: WidgetStateColor.transparent,
            onTap: () {
              Navigator.maybePop(context);
            },
            child: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(
                AppIcons.arrowLeft,
              ),
            ),
          ),
        ),
        actions: [
          InkWell(
            overlayColor: WidgetStateColor.transparent,
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 0),
              child: SizedBox(
                height: 30,
                child: Image.asset(
                  AppIcons.search,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order summary",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Order",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                      color: Color(0xff7D7D7D),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "\$$price",
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff7D7D7D),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Taxes",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                      color: Color(0xff7D7D7D),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "\$0.3",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff7D7D7D)),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Delivery fees",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                      color: Color(0xff7D7D7D),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "\$1.5",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff7D7D7D),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                thickness: 1,
                color: Colors.grey.shade300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Total:",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                      color: Color(0xff3C2F2F),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "\$${price + 1.8}",
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff3C2F2F),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Estimated delivery time:",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xff3C2F2F),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "15 - 30mins",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff3C2F2F),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 30,
                bottom: 20,
              ),
              child: Text(
                "Payment methods",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            RadioListTile(
              contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              value: _radioListTileValue == 1 ? true : false,
              groupValue: true,
              onChanged: (_) {
                setState(() {
                  _radioListTileValue = 1;
                });
              },
              title: Row(
                children: [
                  SizedBox(
                    height: 42,
                    width: 70,
                    child: Image.asset(
                      AppImages.mastercard,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Credit card"),
                      Text("5105 **** **** 0505"),
                    ],
                  ),
                ],
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              selected: true,
              activeColor: _radioListTileValue == 1 ? Colors.white : Colors.black,
              selectedTileColor: _radioListTileValue == 1 ? AppColors.color3C2F2F : Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            const SizedBox(
              height: 20,
            ),
            RadioListTile(
              contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              value: _radioListTileValue == 2 ? true : false,
              groupValue: true,
              onChanged: (_) {
                setState(() {
                  _radioListTileValue = 2;
                });
              },
              title: Row(
                children: [
                  SizedBox(
                    height: 42,
                    width: 70,
                    child: Image.asset(
                      AppImages.visa,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Credit card",
                      ),
                      Text(
                        "5105 **** **** 0505",
                      ),
                    ],
                  ),
                ],
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              selected: true,
              activeColor:  _radioListTileValue == 2 ? Colors.white : Colors.black,
              selectedTileColor: _radioListTileValue == 2 ? AppColors.color3C2F2F : Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Checkbox(
                  value: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value ?? _value;
                    });
                  },
                  activeColor: AppColors.colorEF2A39,
                ),
                const Text("Save card details for future payments")
              ],
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total price",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xff808080),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                            color: const Color(0xffEf2a39),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "${price + 1.8}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        actionsAlignment: MainAxisAlignment.center,
                        title: Column(
                          children: [
                            const CircleAvatar(
                                backgroundColor: Color(0xffEF2A39),
                                radius: 45,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 50,
                                  weight: 900,
                                )),
                            Text(
                              "Success !",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                  color: const Color(0xffEF2A39),
                                  fontFamily: "Poppins",fontWeight: FontWeight.w700),

                            ),
                          ],
                        ),
                        content: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23),
                          child: Text(
                            "Your payment was successful.A"
                                " receipt for this purchase has been sent to your email.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        actions: [
                          MaterialButton(
                            color: const Color(0xffef2a39),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, RouterNames.home);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                              child: Text(
                                "Go Back",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      barrierDismissible: false,
                    );
                  },
                  style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 55, vertical: 20),
                    ),
                    backgroundColor: const WidgetStatePropertyAll(
                      Color(0xff3C2F2F),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: Text(
                    "Pay Now",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
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
