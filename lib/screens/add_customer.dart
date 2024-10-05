import 'package:commerce_mobile/components/custom_button.dart';
import 'package:commerce_mobile/controllers/customerController.dart';
import 'package:commerce_mobile/models/CustomersModel.dart';
import 'package:flutter/material.dart';
import 'package:commerce_mobile/components/app_drawer.dart';
import 'package:commerce_mobile/components/appbar.dart';
import 'package:commerce_mobile/components/back_button_component.dart';
import 'package:commerce_mobile/components/inputfields.dart';
import 'package:toastification/toastification.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  TextEditingController customerNameTextField = TextEditingController();
  TextEditingController customerAddressTextField = TextEditingController();
  TextEditingController customerPhoneTextField = TextEditingController();

  Future<void> showConfirmationDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Customize border radius
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Confirmation',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text('Are you sure you want to add this customer?'),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    SizedBox(width: 8),
                    TextButton(
                      child: Text('Add'),
                      onPressed: () async {
                        Customers customer = Customers(
                            name: customerNameTextField.text,
                            phone_number: customerPhoneTextField.text,
                            address: customerAddressTextField.text,
                            id: '');

                        await CustomerController()
                            .addCustomer(customer)
                            .then((value) {
                          toastification.show(
                            context:
                                context, // optional if you use ToastificationWrapper
                            title: Text(
                              'Customer Added Sucessfully!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[900]),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            icon: Icon(
                              Icons.check_circle_outline,
                              color: Colors.green[900],
                            ),
                            type: ToastificationType.success,
                            style: ToastificationStyle.flatColored,
                            autoCloseDuration: const Duration(seconds: 5),
                          );
                          Navigator.pushNamed(context, '/customer-list');
                        });

                        customerNameTextField.clear();
                        customerPhoneTextField.clear();
                        customerAddressTextField.clear();

                        Navigator.of(context).pop(); // Closes the dialog
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Add Customer"),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButtonComponent(),
                Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                InputFields(
                    label: 'Name',
                    hintText: 'Name of the Customer',
                    controllerTextField: customerNameTextField),
                const SizedBox(height: 15),
                InputFields(
                    label: 'Address',
                    hintText: 'Address of the Customer',
                    controllerTextField: customerAddressTextField),
                const SizedBox(height: 15),
                InputFields(
                    label: 'Phone Number',
                    hintText: 'Phone Number of the Customer',
                    controllerTextField: customerPhoneTextField),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 90.0), //mag dictate unsa ka dako ang button
                  child: Center(
                    child: CustomButton(
                      onPressed: () async {
                        // add product function
                        showConfirmationDialog(context);
                      },
                      text: 'Add Customer',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
