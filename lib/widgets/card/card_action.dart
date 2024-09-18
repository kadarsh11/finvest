import 'package:flutter/material.dart';

class CardAction extends StatelessWidget {
  const CardAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMenuItem(Icons.credit_card, 'DETAILS'),
              _buildMenuItem(Icons.card_giftcard, 'REWARDS'),
              _buildMenuItem(Icons.settings, 'CREDITS'),
              _buildMenuItem(Icons.beach_access,
                  'BENEFITS'), // Replace with a relevant icon
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Container(
      width: 80, // Adjust width as needed
      height: 80, // Adjust height as needed
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12, // Slight shadow
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              color: const Color(0xFF0F73C6), size: 28), // Icon size and color
          const SizedBox(height: 8), // Space between icon and text
          Text(
            label,
            style: const TextStyle(
              fontSize: 10, // Text size
              fontWeight: FontWeight.bold,
              color: Color(0xFF071A34),
            ),
          ),
        ],
      ),
    );
  }
}
