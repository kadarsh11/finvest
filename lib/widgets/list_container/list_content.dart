import 'package:finvest/widgets/amount.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final Widget footer;
  final String title;
  final GestureTapCallback? onPressed;

  const ListCard({
    super.key,
    required this.title,
    required this.items,
    required this.footer,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 20.0,
                color: Color(0xFF071A34),
                fontWeight: FontWeight.w500,
                letterSpacing: -0.8),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const Divider(), // Add a divider after each item
                  ListCardItem(
                    onPressed: () => {onPressed!()},
                    title: items[index]['title'],
                    subtitle: items[index]['subtitle'],
                    amount: items[index]['amount'],
                    imageUrl: items[index]['imageUrl'],
                  ),
                  if (index == items.length - 1) const Divider(),
                ],
              );
            },
          ),
          const SizedBox(height: 4),
          footer,
        ],
      ),
    );
  }
}

class ListCardItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double amount;
  final GestureTapCallback onPressed;

  static void _defaultOnPressed() {
    // Default empty function, does nothing
  }

  const ListCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.onPressed = _defaultOnPressed,
    required this.imageUrl,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      leading: Container(
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF071A34),
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.6,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Color(0xFF697A93),
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.3,
        ),
      ),
      trailing: const Amount(size: 16, amount: 245781),
    );
  }
}
