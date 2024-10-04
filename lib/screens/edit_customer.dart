import 'package:commerce_mobile/components/app_drawer.dart';
import 'package:commerce_mobile/components/appbar.dart';
import 'package:commerce_mobile/components/back_button_component.dart';
import 'package:commerce_mobile/components/custom_button.dart';
import 'package:commerce_mobile/components/inputfields.dart';
import 'package:commerce_mobile/controllers/customerController.dart';
import 'package:commerce_mobile/models/CustomersModel.dart'; // Import the Customers model
import 'package:flutter/material.dart';

class EditCustomer extends StatefulWidget {
  final Customers customer; // Pass the entire customer object

  const EditCustomer({
    Key? key,
    required this.customer,
  }) : super(key: key);

  @override
  _EditCustomerState createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.customer.name);
    _addressController = TextEditingController(text: widget.customer.address);
    _phoneNumberController =
        TextEditingController(text: widget.customer.phone_number);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Edit Customer"),
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
                    controllerTextField: _nameController),
                const SizedBox(height: 15),
                InputFields(
                    label: 'Address',
                    hintText: 'Address of the Customer',
                    controllerTextField: _addressController),
                const SizedBox(height: 15),
                InputFields(
                    label: 'Phone Number',
                    hintText: 'Phone Number of the Customer',
                    controllerTextField: _phoneNumberController),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: Center(
                    child: CustomButton(
                      onPressed: () async {
                        Customers customer = Customers(
                            name: _nameController.text,
                            phone_number: _phoneNumberController.text,
                            address: _addressController.text,
                            id: widget.customer.id);

                        await CustomerController()
                            .editCustomer(customer)
                            .then((value) {
                          Navigator.pushNamed(context, '/customer-list');
                        });
                      }, // Call the save function
                      text: 'Update',
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
