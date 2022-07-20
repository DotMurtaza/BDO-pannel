import 'package:bdo_pannel/SizeConfig/size_config.dart';
import 'package:bdo_pannel/Views/BDOviews/BDOwidgets/BDO_input_field.dart';
import 'package:bdo_pannel/controllers/clientController.dart';
import 'package:bdo_pannel/controllers/userController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../constants.dart';

class AddnewClientScreen extends StatefulWidget {
  @override
  _BDOaddProjectScreenState createState() => _BDOaddProjectScreenState();
}

class _BDOaddProjectScreenState extends State<AddnewClientScreen> {
  // final nameController = TextEditingController();
  // final businessController = TextEditingController();
  // final cityNameController = TextEditingController();
  // final clientContactController = TextEditingController();
  // final clientEmailController = TextEditingController();
  // final discriptionController = TextEditingController();
  // final purposeController = TextEditingController();
  final ClientController clientController = Get.put(ClientController());
  final UserController userController = Get.put(UserController());

  void _doSomething() async {
    //print(clientController.clientContactController.text);
    //  clientController.btnController.stop();
    // print(clientController.clientContactController.text);
    if (clientController.formKey.currentState.validate()) {
      clientController.findUserContactNumber(
          int.parse(clientController.clientContactController.text));
    } else {
      clientController.btnController.stop();
    }
    // else if ( clientController.formKey.currentState.validate()) {
    //   clientController.btnController.start();
    //   clientController.addClient();
    // } else {
    //   clientController.btnController.stop();
    // }

    //QuerySnapshot querySnapshot = await collectionReference.

    // if (_formKey.currentState.validate()) {
    //   clientController.btnController.start();
    //   clientController.addClient();
    // } else {
    //   clientController.btnController.stop();
    // }

    // Timer(
    //   Duration(seconds: 3),
    //   () {
    //     _btnController.success();
    //     Get.back();
    //   },
    // );
  }

  //String _countryName = 'Nill';
  String _phoneCode = '+92';
  //String projectsource = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF96BAFF),
        title: Text('Add New Client'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kPadding,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: clientController.formKey,
            child: Column(
              children: [
                const SizedBox(height: kPadding * 1.5),
                BDOinputField(
                  hint: 'Name',
                  label: 'Name',
                  controller: clientController.nameController,
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  maxLines: 1,
                ),
                const SizedBox(height: kPadding),
                BDOinputField(
                  controller: clientController.businessController,
                  hint: "Business Name",
                  label: 'Business Name',
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Business name';
                    }
                    return null;
                  },
                  maxLines: null,
                ),
                // const SizedBox(height: kPadding),
                // BDOinputField(
                //   controller: purposeController,
                //   label: 'Purpose',
                //   hint: 'Purpose',
                //   maxLines: 1,
                //   textInputType: TextInputType.text,
                //   validator: (value) {},
                // ),
                // BDOmyDropDown(
                //   dropDownName: "Type",
                //   value1: "Mobile Application",
                //   value2: "Web Designing & Development",
                //   value3: "Desktop Application",
                //   value4: "Data Science",
                // ),
                const SizedBox(height: kPadding),
                BDOinputField(
                  controller: clientController.cityNameController,
                  hint: 'City Name',
                  label: 'City Name',
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your City ';
                    }
                    return null;
                  },
                  maxLines: 1,
                ),
                const SizedBox(height: kPadding),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     Text('Select Country',
                //         style: Theme.of(context).textTheme.subtitle1),
                //     GestureDetector(
                //       onTap: () {
                //         showCountryPicker(
                //           context: context,
                //           onSelect: (Country country) {
                //             setState(() {
                //               _countryName = country.name;
                //             });
                //           },
                //         );
                //       },
                //       child: Text(_countryName,
                //           style: Theme.of(context)
                //               .textTheme
                //               .subtitle2
                //               .copyWith(fontWeight: FontWeight.w500)),
                //     ),
                //   ],
                // ),
                const SizedBox(height: kPadding),
                Row(
                  children: [
                    // GestureDetector(
                    //     onTap: () {
                    //       showCountryPicker(
                    //         showPhoneCode: true,
                    //         context: context,
                    //         onSelect: (Country country) {
                    //           setState(() {
                    //             _phoneCode = country.phoneCode;
                    //           });
                    //         },
                    //       );
                    //     },
                    //     child: Row(
                    //       children: [
                    //         Text(
                    //           "+" + _phoneCode,
                    //           style: Theme.of(context).textTheme.subtitle1,
                    //         ),
                    //         Icon(Icons.keyboard_arrow_down),
                    //       ],
                    //     )),
                    const SizedBox(width: kPadding * 0.45),
                    Expanded(
                      child: BDOinputField(
                        controller: clientController.clientContactController,
                        label: 'Mobile No.',
                        hint: '0300 1234567',
                        maxLines: 1,
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter contact number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kPadding),
                BDOinputField(
                  controller: clientController.clientEmailController,
                  label: 'Email',
                  hint: 'mail@example.com',
                  maxLines: 1,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: kPadding),
                BDOinputField(
                  controller: clientController.discriptionController,
                  label: 'Discription',
                  hint: 'Discription',
                  maxLines: 6,
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                ),
                // BDOmyDropDown(
                //   dropDownName: "Project Source",
                //   value1: "Fiverr",
                //   value2: "Upwork",
                //   value3: "Guru",
                //   value4: "Direct Client",
                // ),
                const SizedBox(height: kPadding * 3),
                RoundedLoadingButton(
                  height: 0.05 * SizeConfig.screenHeight,
                  width: 0.9 * SizeConfig.screenWidth,
                  color: Color(0xFF96BAFF),
                  child:
                      Text('Add Client', style: TextStyle(color: Colors.white)),
                  controller: clientController.btnController,
                  onPressed: _doSomething,
                ),
                const SizedBox(height: kPadding * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
