import 'dart:io';
import 'package:commerce_mobile/components/app_drawer.dart';
import 'package:commerce_mobile/components/appbar.dart';
import 'package:commerce_mobile/components/back_button_component.dart';
import 'package:commerce_mobile/components/custom_button.dart';
import 'package:commerce_mobile/components/dropdownbuttonform.dart';
import 'package:commerce_mobile/components/encapsulation.dart';
import 'package:commerce_mobile/components/inputfields.dart';
import 'package:commerce_mobile/controllers/Product_Controllers.dart';
import 'package:commerce_mobile/models/ProductsModel.dart';
import 'package:commerce_mobile/screens/products.dart';
import 'package:commerce_mobile/services/storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart'; // Import dotted_border

class EditProduct extends StatefulWidget {
  const EditProduct({super.key, required this.product});
  // final List<Product> filteredTransactions;
  // final int index;
  final Product product;
  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  void initState() {
    productNameTextField.text = '${widget.product.name}';
    sellingPriceTextField.text = '${widget.product.selling_price}';
    totalPurchaseTextField.text = '${widget.product.total_purchase}';
    quantityTextField.text = '${widget.product.product_stock}';
    categoryTextField.text = '${widget.product.category}';
    preImage = widget.product.image;
    stringid = widget.product.id;
    '${widget.product.category}';
    preImage = widget.product.image;
    stringid = widget.product.id;
    super.initState();
  }

  bool productNameError = false;
  bool sellingError = false;
  bool purchaseError = false;
  bool quantityError = false;
  bool categoryError = false;

  XFile? _image;
  String preImage = '';
  String stringid = '';

  TextEditingController productNameTextField = TextEditingController();
  TextEditingController sellingPriceTextField = TextEditingController();
  TextEditingController totalPurchaseTextField = TextEditingController();
  TextEditingController quantityTextField = TextEditingController();
  Encapsulation categoryTextField = Encapsulation();

  // Add file variable to store selected file
  String? _selectedFile;

  // Function to handle file picking
  // Future<void> _validation(StorageService storageService) async {
  //   setState(() {
  //     productNameError = productNameTextField.text.isEmpty;
  //     sellingError = sellingPriceTextField.text.isEmpty;
  //     purchaseError = totalPurchaseTextField.text.isEmpty;
  //     quantityError = quantityTextField.text.isEmpty;
  //     categoryError = categoryTextField.text?.isEmpty ?? true;
  //   });

  //   if (!productNameError &&
  //       !sellingError &&
  //       !purchaseError &&
  //       !quantityError &&
  //       !categoryError) {
  //     //submit
  //     String finalImage;
  //     if (_image != null) {
  //       finalImage = await storageService.updloadImage(_image);
  //       storageService.deleteImage(preImage);
  //     } else {
  //       finalImage = preImage;
  //     }
  //     await ProductControllers().updateProduct(Product(
  //       id: stringid,
  //       name: productNameTextField.text,
  //       selling_price: double.parse(sellingPriceTextField.text),
  //       total_purchase: double.parse(totalPurchaseTextField.text),
  //       product_stock: int.parse(quantityTextField.text),
  //       category: categoryTextField.text ?? 'shoes',
  //       image: finalImage,
  //     ));
  //     Navigator.pop(context);
  //   } else {
  //     toastification.show(
  //       context: context,
  //       title: Text(
  //         'Validation Error',
  //         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
  //       ),
  //       description: Text('Please fill out all fields.'),
  //       borderRadius: BorderRadius.circular(10),
  //       icon: Icon(Icons.error_outline, color: Colors.red),
  //       type: ToastificationType.error,
  //       style: ToastificationStyle.flatColored,
  //       autoCloseDuration: const Duration(seconds: 5),
  //     );
  //   }
  // }

  void _updateCustomer(StorageService storageService) {
    setState(() {
      productNameError = productNameTextField.text.isEmpty;
      sellingError = sellingPriceTextField.text.isEmpty;
      purchaseError = totalPurchaseTextField.text.isEmpty;
      quantityError = quantityTextField.text.isEmpty;
      categoryError = categoryTextField.text?.isEmpty ?? true;
    });

    // Check if there are any errors
    if (!productNameError &&
        !sellingError &&
        !purchaseError &&
        !quantityError &&
        !categoryError) {
      showConfirmationUpdateDialog(context, widget.product, storageService);
    } else {
      // Show toast messages for empty fields
      String errorMessage = 'Please fill out the all the fields.';

      toastification.show(
        context: context,
        title: Text(
          'Input Error',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
        description: Text(errorMessage),
        borderRadius: BorderRadius.circular(10),
        icon: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
        type: ToastificationType.error,
        style: ToastificationStyle.flatColored,
        autoCloseDuration: const Duration(seconds: 5),
      );
    }
  }

  Future<void> showConfirmationUpdateDialog(
      BuildContext context, Product product, StorageService storageService) {
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
                Text('Are you sure you want to update this product?'),
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
                      child: Text('Update'),
                      onPressed: () async {
                        String finalImage;
                        if (_image != null) {
                          finalImage =
                              await storageService.updloadImage(_image);
                          storageService.deleteImage(preImage);
                        } else {
                          finalImage = preImage;
                        }
                        await ProductControllers()
                            .updateProduct(Product(
                          id: stringid,
                          name: productNameTextField.text,
                          selling_price:
                              double.parse(sellingPriceTextField.text),
                          total_purchase:
                              double.parse(totalPurchaseTextField.text),
                          product_stock: int.parse(quantityTextField.text),
                          category: categoryTextField.text ?? 'shoes',
                          image: finalImage,
                        ))
                            .then((value) {
                          toastification.show(
                            context: context,
                            title: Text(
                              'Product Updated Successfully!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[900]),
                            ),
                            description:
                                Text('You successfully updated a product.'),
                            borderRadius: BorderRadius.circular(10),
                            icon: Icon(
                              Icons.check_circle_outline,
                              color: Colors.green[900],
                            ),
                            type: ToastificationType.success,
                            style: ToastificationStyle.flatColored,
                            autoCloseDuration: const Duration(seconds: 5),
                          );

                          // await _customerController
                          //     .editCustomer(customer)
                          //     .then((value) {
                          //   toastification.show(
                          //     context: context,
                          //     title: Text(
                          //       'Customer Updated Successfully!',
                          //       style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           color: Colors.green[900]),
                          //     ),
                          //     description:
                          //         Text('You successfully updated a customer.'),
                          //     borderRadius: BorderRadius.circular(10),
                          //     icon: Icon(
                          //       Icons.check_circle_outline,
                          //       color: Colors.green[900],
                          //     ),
                          //     type: ToastificationType.success,
                          //     style: ToastificationStyle.flatColored,
                          //     autoCloseDuration: const Duration(seconds: 5),
                          //   );

                          Navigator.pushNamed(context, '/products');
                        });
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
    return Consumer<StorageService>(builder: (context, storageService, widget) {
      return Scaffold(
        appBar: const CustomAppBar(title: "Edit Product"),
        drawer: const AppDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BackButtonComponent(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputFields(
                        label: 'Name',
                        hintText: 'Name of the product',
                        controllerTextField: productNameTextField,
                        borderColor:
                            productNameError ? Colors.red : Colors.black26,
                      ),
                      const SizedBox(height: 15),
                      InputFields(
                        label: 'Selling Price',
                        hintText: "Enter the product's price",
                        controllerTextField: sellingPriceTextField,
                        borderColor: sellingError ? Colors.red : Colors.black26,
                      ),
                      const SizedBox(height: 15),
                      InputFields(
                        label: 'Total Purchase',
                        hintText: 'Enter the purchasing price',
                        controllerTextField: totalPurchaseTextField,
                        borderColor:
                            purchaseError ? Colors.red : Colors.black26,
                      ),
                      const SizedBox(height: 15),
                      InputFields(
                        label: 'Quantity',
                        hintText: 'Enter the quantity',
                        controllerTextField: quantityTextField,
                        borderColor:
                            quantityError ? Colors.red : Colors.black26,
                      ),
                      const SizedBox(height: 15),
                      DropdownField(
                        label: 'Category',
                        hintText: 'Select a category',
                        items: const ['shoes', 'slippers', 'food', 'vehicles'],
                        selectedValue: categoryTextField,
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () async {
                          final imageSeleted =
                              await storageService.selectImage();
                          if (imageSeleted != null) {
                            setState(() {
                              _image = imageSeleted;
                            });
                          }
                        }, // file picker on tap
                        child: DottedBorder(
                          color: const Color(0xFF766789),
                          strokeWidth: 2,
                          dashPattern: const [10, 10], // spacing
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          child: Container(
                              height: 150,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: _image == null
                                  ? const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.cloud_upload_outlined,
                                            size: 30, color: Colors.grey),
                                        Text(
                                          "Choose a file or drag & drop it here",
                                          style: TextStyle(
                                            color: Color(0xFF766789),
                                          ),
                                        ),
                                        Text(
                                            "JPEG, PNG, PDG, MP4 formats, up to 50MB",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ],
                                    )
                                  : kIsWeb
                                      ? Image.network(_image!.path)
                                      : Image.file(File(_image!.path))),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: Center(
                          child: CustomButton(
                            onPressed: () => _updateCustomer(storageService),
                            text: 'Edit Product',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
