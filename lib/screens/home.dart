import 'package:finvest/constants/mock.dart';
import 'package:finvest/screens/card_details.dart';
import 'package:finvest/widgets/balance_card.dart';
import 'package:finvest/widgets/list_container/list_content.dart';
import 'package:finvest/widgets/list_container/list_footer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onNavgateToCardDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CardDetails()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Background color
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
            onPressed: onNavgateToCardDetails,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const BalanceCard(),
          const TransactionChart(),
          Container(
            color: const Color(0xFFDCE4F2),
            child: Column(
              children: [
                ListCard(
                  title: "Credit cards",
                  items: MockCreditListData,
                  onPressed: onNavgateToCardDetails,
                  footer: ListFooter("Sell App", onNavgateToCardDetails),
                ),
                ListCard(
                  title: "Top categories",
                  items: MockCategoryListData,
                  onPressed: onNavgateToCardDetails,
                  footer:
                      ListFooter("See all categories", onNavgateToCardDetails),
                ),
                ListCard(
                  title: "Recent transactions",
                  items: MockTransactionListData,
                  onPressed: onNavgateToCardDetails,
                  footer: ListFooter(
                      "See all transactions", onNavgateToCardDetails),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
