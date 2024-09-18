import 'package:finvest/constants/mock.dart';
import 'package:finvest/screens/transactions/filter.dart';
import 'package:finvest/widgets/list_container/list_content.dart';
import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final ScrollController _scrollController = ScrollController();

  void onNavgateToTransactionList() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const FractionallySizedBox(
          heightFactor: 0.9, child: TransactionFilterModal()),
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
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: onNavgateToTransactionList,
            ),
          ],
        ),
        backgroundColor: const Color(0xFFDCE4F2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              _buildDropdown(),
              _buildFilter(),
              Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: MockTransactionListData
                      .length, // Add 1 for the loading indicator
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListCardItem(
                          onPressed: onNavgateToTransactionList,
                          title: MockTransactionListData[index]['title'],
                          subtitle: MockTransactionListData[index]['subtitle'],
                          imageUrl: MockTransactionListData[index]['imageUrl'],
                          amount: MockTransactionListData[index]['amount'],
                        ),
                        const Divider(
                          color: Color(0xFFDFE8F5),
                        ), //
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Text(
            "Transactions",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 32, color: Color(0xFF071A34), letterSpacing: -2),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'All credit cards',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
            onPressed: onNavgateToTransactionList,
          ),
        ],
      ),
    );
  }

  Widget _buildFilter() {
    ButtonStyle btnStyle = OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          OutlinedButton(
            onPressed: onNavgateToTransactionList,
            style: btnStyle,
            child: const Row(
              children: [
                Text(
                  'Filters',
                  style: TextStyle(
                      color: Color(0xFF071A34),
                      fontSize: 12,
                      letterSpacing: -0.2),
                ),
                SizedBox(width: 2),
                Icon(
                  Icons.filter_alt_sharp,
                  size: 16,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: onNavgateToTransactionList,
            style: btnStyle,
            child: const Text('Top transaction'),
          ),
        ],
      ),
    );
  }
}
