import 'package:commerce_mobile/components/app_drawer.dart';
import 'package:commerce_mobile/components/appbar.dart';
import 'package:commerce_mobile/components/navbar.dart';
import 'package:commerce_mobile/components/transaction_item.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Map<String, String>> _transactionsSample = [
    {
      'title': 'Century Tuna Ila Bernard',
      'price': '25,000.00',
      'dateTime': 'September 29, 2024, 5:00 PM'
    },
    {
      'title': 'Kyle Dellatan',
      'price': '25,000.00',
      'dateTime': 'September 29, 2024, 5:00 PM'
    },
    {
      'title': 'Mark Anderson',
      'price': '25,000.00',
      'dateTime': 'September 29, 2024, 5:00 PM'
    },
    {
      'title': 'Kyle Dellatan',
      'price': '25,000.00',
      'dateTime': 'September 29, 2024, 5:00 PM'
    },
    {
      'title': 'Kyle Dellatan',
      'price': '25,000.00',
      'dateTime': 'September 29, 2024, 5:00 PM'
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const CustomAppBar(title: "Dashboard"), // No scaffoldKey here anymore
      drawer: const AppDrawer(),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(35, 35, 35, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product and Customer Info
            Center(
              child: Column(
                children: [
                  _infoCard("Total Products", "189893"),
                  const SizedBox(height: 16),
                  _infoCard("Number of Customers", "25"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Profit Info
            _profitCard("Profit", "PHP 100,000"),
            const SizedBox(height: 35),
            // Transactions Title
            Text(
              "Transactions",
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFA259FF),
              ),
            ),
            const SizedBox(height: 8),
            // Transactions List
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _transactionsSample.length > 3
                    ? 3
                    : _transactionsSample.length,
                itemBuilder: (context, index) {
                  return TransactionItemComponent.transactionItem(
                    _transactionsSample[index]['title']!,
                    _transactionsSample[index]['price']!,
                    _transactionsSample[index]['dateTime']!,
                  );
                },
              ),
            ),
            // View All Transactions Button
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/transaction_history');
                },
                child: Text(
                  "View All Transactions",
                  style: GoogleFonts.inter(
                    color: const Color(0xFFA259FF),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 0,
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFA259FF), // Purple background color
        borderRadius: BorderRadius.circular(7.0), // Rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 10),
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _profitCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFA259FF),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFA259FF),
            ),
          ),
        ],
      ),
    );
  }
}
