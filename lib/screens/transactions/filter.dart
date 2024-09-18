import 'package:flutter/material.dart';

class TransactionFilterModal extends StatefulWidget {
  const TransactionFilterModal({super.key});

  @override
  State<TransactionFilterModal> createState() => _TransactionFilterModalState();
}

class _TransactionFilterModalState extends State<TransactionFilterModal> {
  RangeValues _currentRangeValues = const RangeValues(40, 1000);

  void onClose() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF4F7FC),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filters',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.8,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildDivider(),
                _buildFilterSection(
                  label: 'Amount',
                  children: [
                    _buildSlider(),
                    _buildRangeLabels('\$0', '\$7500'),
                  ],
                ),
                _buildDivider(),
                _buildFilterSection(
                  label: 'Date range',
                  children: _buildChipList([
                    'All time',
                    'Current month',
                    'Last month',
                    'This year',
                    'Previous year'
                  ]),
                ),
                _buildDivider(),
                _buildFilterSection(
                  label: 'Status',
                  children: _buildChipList(['All', 'Completed', 'Pending']),
                ),
                _buildDivider(),
                _buildFilterSection(
                  label: 'Transaction type',
                  children: _buildChipList(
                      ['All', 'Buy', 'Sell', 'Deposit', 'Withdrawal']),
                ),
                _buildDivider(),
                _buildFilterSection(
                  label: 'Categories',
                  children: _buildChipList([
                    'All',
                    'Foods & dining',
                    'Housing',
                    'Auto & Transport',
                    'Health',
                    'Entertainments'
                  ]),
                ),
              ],
            ),
          ),
          _buildActionButton()
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onClose,
            child: const Text('Close'),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: ElevatedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Color(0xFF061B34),
            ),
            onPressed: onClose,
            child: const Text(
              'Apply',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Color(0xFFDFE8F5),
      height: 24,
    );
  }

  Widget _buildFilterSection({
    required String label,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.8,
            color: Color(0xFF071A34),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: children,
        ),
      ],
    );
  }

  Widget _buildSlider() {
    return RangeSlider(
      values: _currentRangeValues,
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
      min: 0.0,
      max: 7500.0,
    );
  }

  Widget _buildRangeLabels(String start, String end) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildChip(start),
        _buildChip(end),
      ],
    );
  }

  List<Widget> _buildChipList(List<String> labels) {
    return labels.map((label) => _buildChip(label)).toList();
  }

  Widget _buildChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: const Color.fromARGB(255, 180, 187, 197),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14.0,
          letterSpacing: -0.2,
          color: Color(0xFF071A34),
        ),
      ),
    );
  }
}
