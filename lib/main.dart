import 'package:commerce_mobile/screens/add_customer.dart';
import 'package:commerce_mobile/screens/add_product.dart';
import 'package:commerce_mobile/screens/customer_list.dart';
import 'package:commerce_mobile/screens/dashboard.dart';
import 'package:commerce_mobile/screens/edit_product.dart';
import 'package:commerce_mobile/screens/edit_profile_page.dart';
import 'package:commerce_mobile/screens/login_screen.dart';
import 'package:commerce_mobile/screens/products.dart';
import 'package:commerce_mobile/screens/profile.dart';
import 'package:commerce_mobile/screens/signup_screen.dart';
import 'package:commerce_mobile/screens/splash_screen.dart';
import 'package:commerce_mobile/screens/transaction_history.dart';
import 'package:flutter/material.dart';

void main() => runApp(ShoeTallyApp());

class ShoeTallyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/dashboard': (context) => Dashboard(),
        '/transaction_history': (context) => TransactionHistory(),
        '/products': (context) => Products(),
        '/add-product': (context) => AddProduct(),
        '/profile': (context) => UserProfilePage(),
        '/edit-product': (context) => EditProduct(),
        '/add-customer': (context) => AddCustomer(),
        '/customer-list': (context) => CustomerList(),
        '/edit-profile': (context) => EditProfilePage(),
      },
    );
  }
}
