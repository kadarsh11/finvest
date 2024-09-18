import 'package:finvest/widgets/amount.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreditLimitCard extends StatelessWidget {
  final double availableCredit;
  final double spentAmount;
  final double totalCreditLimit;
  final DateTime lastUpdated;

  const CreditLimitCard({
    super.key,
    required this.availableCredit,
    required this.spentAmount,
    required this.totalCreditLimit,
    required this.lastUpdated,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('d MMM, h:mma');

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'AVAILABLE CREDIT LIMIT',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFF697A93),
            ),
          ),
          const SizedBox(height: 8),
          Amount(
            amount: availableCredit,
            size: 24,
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: spentAmount / totalCreditLimit,
            backgroundColor: Colors.blue.withOpacity(0.2),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            minHeight: 8,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Amount(
                    amount: spentAmount,
                    size: 16,
                  ),
                  const Text(
                    'Spent',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Amount(
                    amount: totalCreditLimit,
                    size: 16,
                  ),
                  const Text(
                    'Total credit limit',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: const Divider(),
          ),
          Text(
            'Last updated from bank on ${dateFormatter.format(lastUpdated)}',
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
