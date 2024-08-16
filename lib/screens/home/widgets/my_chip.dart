import 'package:flutter/material.dart';

class MyChip extends StatefulWidget {
  MyChip({super.key, required this.text, required this.active});

  final String text;
  bool active;

  @override
  State<MyChip> createState() => _MyChipState();
}

class _MyChipState extends State<MyChip> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        widget.text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: widget.active ? Colors.white :const Color(0xff6A6A6A),
          fontFamily: "Inter",
        ),
      ),
      showCheckmark: false,
      selectedColor: const Color(0xffef2a39),
      selected: widget.active,
      backgroundColor: const Color(0xfff3f4f6),
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side:
        const BorderSide(width: 0, color: Colors.transparent),
      ),
      onSelected: (bool value) {
        setState(() {
          widget.active = value;
        });
      },
    );
  }
}
