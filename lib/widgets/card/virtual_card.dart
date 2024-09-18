import 'package:finvest/widgets/amount.dart';
import 'package:flutter/material.dart';

class VirtualCard extends StatelessWidget {
  final String cardNumber;
  final double totalDue;

  const VirtualCard({
    super.key,
    required this.cardNumber,
    required this.totalDue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/card_background.png'),
                    fit: BoxFit.cover,
                    opacity: 0.5),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/chase_logo.png', height: 24),
                      Image.asset('assets/visa_logo.png', height: 24),
                    ],
                  ),
                  Text(
                    _formatCardNumber(cardNumber),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            decoration: const BoxDecoration(
              color: Color(0xFF0066B3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'TOTAL DUE',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Amount(size: 20, color: Colors.white, amount: totalDue),
                  ],
                ),
                Image.asset('assets/chip_icon.png', height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatCardNumber(String number) {
    String masked = number.replaceRange(0, 12, '**** **** ****');
    return masked.replaceAllMapped(
        RegExp(r'.{4}'), (match) => '${match.group(0)} ');
  }
}
