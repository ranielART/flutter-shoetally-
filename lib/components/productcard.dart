import 'package:commerce_mobile/models/ProductsModel.dart';
import 'package:commerce_mobile/screens/edit_product.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    super.key,
    required this.product,
    this.titleColor =
        const Color.fromARGB(255, 98, 54, 155), // Default color value
  });

  final Product product;
  Color titleColor; // Use final since it's immutable

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Perform action on tap

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditProduct(
                      product: widget.product,
                    )));
      },
      child: ListTile(
        title: Text(
          widget.product.name,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: widget.titleColor,
          ),
        ),
        subtitle: Text(
          'Stocks: ${widget.product.product_stock.toString()}',
          style: GoogleFonts.inter(fontSize: 11),
        ),
        trailing: Text(
          "₱ ${widget.product.selling_price} / Unit",
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 98, 54, 155),
          ),
        ),
      ),
    );
  }
}
