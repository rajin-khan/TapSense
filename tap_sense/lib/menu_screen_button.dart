import 'package:flutter/material.dart';

class MenuScreenButton extends StatelessWidget {
  const MenuScreenButton(
      {super.key, required this.buttonText, required this.onTap});

  final String buttonText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: const Color.fromARGB(255, 64, 111, 128),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Text(buttonText, style: const TextStyle(color: Colors.white)));
  }
}
