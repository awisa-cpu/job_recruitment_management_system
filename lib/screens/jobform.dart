import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_recruitment_app/Auth/user.dart';
import 'package:job_recruitment_app/api_connection/api_connection.dart';
import 'package:job_recruitment_app/utilities/routes.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' show log;

class JobForm extends StatefulWidget {
  final String? selectedJob;
  const JobForm({super.key, this.selectedJob});

  @override
  State<JobForm> createState() => _JobFormState();
}

class _JobFormState extends State<JobForm> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _otherNamesController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();

  String pickedDate = '';

  _sendApplicantDetails() async {
    UserModel userModel = UserModel(
      1,
      _firstNameController.text.trim(),
      _otherNamesController.text.trim(),
      _lastNameController.text.trim(),
      _emailController.text.trim(),
      _phoneController.text,
      pickedDate.trim(),
    );

    try {
      var response = await http.post(
        Uri.parse(
            //using the api to communicate with the database
            API.postApplicant),
        body: userModel.toJson(),
      );

      if (response.statusCode == 200) {
        //from the flutter app the connection with the api is ->succesful

        if (response.body == "1") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Applied Succesfully")),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error Occured, Try again")));
        }
      }
    } catch (e) {
      // rethrow;
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: height * 0.1,
                        child: const Center(
                          child: Text(
                            "FILL APPLICATION FORM",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(jobsHomeRoute);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    prefixIcon: const Icon(
                      Icons.text_format,
                      color: Colors.black,
                    ),
                    // suffixIcon: clearInput(text: _firstNameController),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter correct Name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    prefixIcon: const Icon(
                      Icons.text_format,
                      color: Colors.black,
                    ),
                    // suffixIcon: clearInput(text: _lastNameController),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter correct Name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                  controller: _otherNamesController,
                  decoration: InputDecoration(
                    labelText: "Other Names",
                    prefixIcon: const Icon(
                      Icons.text_format,
                      color: Colors.black,
                    ),
                    // suffixIcon: clearInput(text: _otherNamesController),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    // suffixIcon: clearInput(text: _emailController),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+[\w-]+\.)+[\w]{2,4}')
                            .hasMatch(value)) {
                      return "Enter correct email";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    // suffixIcon: clearInput(text: _phoneController),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                            .hasMatch(value)) {
                      return "Enter correct phone number";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                  controller: _dobController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.date_range,
                      color: Colors.black,
                    ),
                    labelText: "dob",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  onTap: () async {
                    DateTime? datePicked = await showDatePicker(
                        //store the datepicked in a variable
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2045));

                    //check if there is an actual date or not
                    if (datePicked != null) {
                      setState(() {
                        _dobController.text =
                            DateFormat("yyyy-MM-dd").format(datePicked);
                        pickedDate = _dobController.text;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                //sumit form button
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        //implement form submission to server or database
                        //validate each applicants email
                        try {
                          await _sendApplicantDetails();
                        } catch (e) {
                          rethrow;
                        }
                        const snackbar =
                            SnackBar(content: Text("Form Submitted"));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    },
                    color: Colors.black,
                    child: const Text(
                      "Submit Application",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget clearInput({required TextEditingController text}) {
  return IconButton(
    onPressed: () {
      text.clear();
    },
    icon: Icon(
      Icons.clear,
      color: Colors.black.withOpacity(0.5),
    ),
  );
}
