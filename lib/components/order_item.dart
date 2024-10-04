import 'package:commerce_mobile/components/app_drawer.dart';
import 'package:commerce_mobile/components/appbar.dart';
import 'package:commerce_mobile/components/back_button_component.dart';
import 'package:commerce_mobile/components/buttonIcon.dart';
import 'package:commerce_mobile/components/navbar.dart';
import 'package:commerce_mobile/components/search_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// OrderItemComponent implementation
class OrderItemComponent extends StatelessWidget {
  final String imageUrl;
  final String shoeName;
  final String stockCount;
  final VoidCallback onCartPressed;

  const OrderItemComponent({
    Key? key,
    required this.imageUrl,
    required this.shoeName,
    required this.stockCount,
    required this.onCartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0), // Adjusted for more spacing
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Light grey background color
        borderRadius: BorderRadius.circular(20.0), // More rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0), // Rounded image corners
            child: Image.network(
              imageUrl,
              height: 100, // Adjusted height for larger image
              width: 180, // Adjusted width for larger image
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shoeName,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.black,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Current Stock: $stockCount',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF9586A8),
                    letterSpacing: -0.5,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFFA259FF), // Purple background
                      borderRadius: BorderRadius.circular(
                          7), // Rounded container for button
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined,
                          color: Colors.white, size: 20), // White cart icon
                      onPressed: onCartPressed,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
