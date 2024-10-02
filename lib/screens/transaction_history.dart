import 'package:commerce_mobile/compontents/app_drawer.dart';
import 'package:commerce_mobile/compontents/appbar.dart';
import 'package:commerce_mobile/compontents/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final List<Map<String, String>> _transactions = [
    {
      'title': 'Century Tuna Ila Bernard',
      'price': '₱ 25,000.00',
      'dateTime': 'September 29, 2024, 5:00 PM'
    },
    {
      'title': 'Kyle Dellatan',
      'price': '₱ 25,000.00',
      'dateTime': 'September 29, 2024, 5:00 PM'
    },
    {
      'title': 'Century Tuna Ila Bernard',
      'price': '₱ 25,000.00',
      'dateTime': 'September 29, 2024, 5:00 PM'
    },
    {
      'title': 'Century Tuna Ila Bernard',
      'price': '₱ 25,000.00',
      'dateTime': 'September 29, 2024, 5:00 PM'
    },
    {
      'title': 'Century Tuna Ila Bernard',
      'price': '₱ 25,000.00',
      'dateTime': 'September 29, 2024, 5:00 PM'
    },
    {
      'title': 'Century Tuna Ila Bernard',
      'price': '₱ 25,000.00',
      'dateTime': 'September 29, 2024, 5:00 PM'
    },
    {
      'title': 'Century Tuna Ila Bernard',
      'price': '₱ 25,000.00',
      'dateTime': 'September 29, 2024, 5:00 PM'
    },
  ];

  List<Map<String, String>> _filteredTransactions = [];
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _filteredTransactions =
        _transactions; // Initialize with full transaction list
  }

  void _filterTransactions(String searchText) {
    setState(() {
      _searchText = searchText;
      if (_searchText.isEmpty) {
        _filteredTransactions =
            _transactions; // Reset to full list if search is empty
      } else {
        _filteredTransactions = _transactions
            .where((transaction) => transaction['title']!
                .toLowerCase()
                .contains(_searchText.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: "Transaction History"), // No scaffoldKey here anymore
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => _filterTransactions(value),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: _filteredTransactions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            _filteredTransactions[index]['title']!,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 98, 54, 155),
                            ),
                          ),
                          subtitle: Text(
                            _filteredTransactions[index]['dateTime']!,
                            style: GoogleFonts.inter(fontSize: 11),
                          ),
                          trailing: Text(
                            "${_filteredTransactions[index]['price']} / Unit",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 98, 54, 155),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Handle the tap based on the index
          if (index == 0) {}
        },
      ),
    );
  }
}
