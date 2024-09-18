import 'package:finvest/constants/mock.dart';
import 'package:finvest/screens/transactions/list.dart';
import 'package:finvest/widgets/card/virtual_card.dart';
import 'package:finvest/widgets/card/card_action.dart';
import 'package:finvest/widgets/card/credit_limit_card.dart';
import 'package:finvest/widgets/list_container/list_content.dart';
import 'package:finvest/widgets/list_container/list_footer.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  void onNavgateToTransactionList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Transactions()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Background color
        elevation: 0, // Add a slight shadow effect
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Default back button action
          },
        ),
        leadingWidth: 30,
        title: const Text(
          'Credit card',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF071A34), // Text color
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.black),
            onPressed: onNavgateToTransactionList,
          ),
        ],
      ),
      backgroundColor: const Color(0xFFDCE4F2),
      body: ListView(
        children: [
          const VirtualCard(
            cardNumber: '1234567890127628',
            totalDue: 24890.00,
          ),
          const CardAction(),
          CreditLimitCard(
            availableCredit: 32781.00,
            spentAmount: 24890.00,
            totalCreditLimit: 50000.00,
            lastUpdated: DateTime(2023, 7, 4, 10, 24),
          ),
          ListCard(
            title: "Top categories",
            items: MockCategoryListData,
            onPressed: onNavgateToTransactionList,
            footer:
                ListFooter("See all categories", onNavgateToTransactionList),
          ),
          ListCard(
            title: "Recent transactions",
            items: MockTransactionListData,
            onPressed: onNavgateToTransactionList,
            footer:
                ListFooter("See all transactions", onNavgateToTransactionList),
          )
        ],
      ),
    );
  }
}
