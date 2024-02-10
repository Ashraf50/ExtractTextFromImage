import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget icon;
  final Function() onPressed;
  const CustomButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff086390),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
