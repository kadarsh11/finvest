import 'package:flutter/material.dart';

class ListFooter extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;

  const ListFooter(this.text, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF071A34),
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
