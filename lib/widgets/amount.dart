import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Amount extends StatelessWidget {
  final double size;
  final double amount;
  final Color color;

  const Amount({
    super.key,
    this.size = 16,
    this.color = const Color(0xFF071A34),
    this.amount = 245781.00,
  });

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    final amountParts = numberFormat.format(amount).split('.');

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${amountParts[0]}.',
          style: TextStyle(
            color: color,
            fontSize: size,
            letterSpacing: size > 24 ? -2 : -0.6,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: size / 5),
          child: Text(
            amountParts[1],
            style: TextStyle(
              color: color,
              fontSize: size / 2,
              letterSpacing: size > 24 ? -2 : -0.6,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
