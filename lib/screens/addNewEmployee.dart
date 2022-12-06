import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' show log;
import 'package:intl/intl.dart';
import 'package:job_recruitment_app/Auth/employeeModel.dart';
import 'package:job_recruitment_app/utilities/routes.dart';

import '../api_connection/api_connection.dart';

class EmployeeAdd extends StatefulWidget {
  const EmployeeAdd({super.key});

  @override
  State<EmployeeAdd> createState() => _EmployeeAddState();
}

class _EmployeeAddState extends State<EmployeeAdd> {
  final _formKey = GlobalKey<FormState>();

  final _employeeid = TextEditingController();
  final _recruiterid = TextEditingController();
  final _jobid = TextEditingController();
  final _departmentid = TextEditingController();
  final _salary = TextEditingController();
  final _dependentid = TextEditingController();
  final _datepicked = TextEditingController();
  final _fullNames = TextEditingController();

  String pickedDate = '';

  _addNewEmployee() async {
    EmployeeModel userModel = EmployeeModel(
      _employeeid.text.trim(),
      _fullNames.text.trim(),
      _recruiterid.text.trim(),
      _jobid.text.trim(),
      _departmentid.text.trim(),
      _salary.text,
      _dependentid.text.trim(),
      pickedDate.trim(),
    );

    try {
      var response = await http.post(
        Uri.parse(
            //using the api to communicate with the database
            API.postEmployee),
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
                            "ADD NEW EMPLOYEE",
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
                          Navigator.of(context).pushNamed(adminHome);
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
                  controller: _employeeid,
                  decoration: InputDecoration(
                    labelText: "Employee Id",
                    prefixIcon: const Icon(
                      Icons.numbers,
                      color: Colors.black,
                    ),
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
                        !RegExp(r'^[0-9]{0,9+$').hasMatch(value)) {
                      return "Enter Employee id";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                  controller: _fullNames,
                  decoration: InputDecoration(
                    labelText: "Full Names",
                    prefixIcon: const Icon(
                      Icons.text_format,
                      color: Colors.black,
                    ),
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
                      return "Enter Full Names";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                  controller: _recruiterid,
                  decoration: InputDecoration(
                    labelText: "Recruiter id",
                    prefixIcon: const Icon(
                      Icons.numbers_outlined,
                      color: Colors.black,
                    ),
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
                        !RegExp(r'^[0-9]{0,9+$').hasMatch(value)) {
                      return "Enter Recruiter id";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                  controller: _jobid,
                  decoration: InputDecoration(
                    labelText: "Job id",
                    prefixIcon: const Icon(
                      Icons.numbers_outlined,
                      color: Colors.black,
                    ),
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
                        !RegExp(r'^[0-9]{0,9+$').hasMatch(value)) {
                      return "Enter Job id";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                  controller: _departmentid,
                  decoration: InputDecoration(
                    labelText: "Department Id",
                    prefixIcon: const Icon(
                      Icons.numbers_outlined,
                      color: Colors.black,
                    ),
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
                        !RegExp(r'^[0-9]{0,9+$').hasMatch(value)) {
                      return "Enter Department id";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                  controller: _salary,
                  decoration: InputDecoration(
                    labelText: "Salary",
                    prefixIcon: const Icon(
                      Icons.numbers,
                      color: Colors.black,
                    ),
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
                        !RegExp(r'^[0-9]{0,9+$').hasMatch(value)) {
                      return "Enter salary";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                  controller: _dependentid,
                  decoration: InputDecoration(
                    labelText: "Dependent Id",
                    prefixIcon: const Icon(
                      Icons.numbers,
                      color: Colors.black,
                    ),
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
                        !RegExp(r'^[0-9]{0,9+$').hasMatch(value)) {
                      return "Enter dependent id";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                  controller: _datepicked,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.date_range,
                      color: Colors.black,
                    ),
                    labelText: "Date of Creation",
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
                        _datepicked.text =
                            DateFormat("yyyy-MM-dd").format(datePicked);
                        pickedDate = _datepicked.text;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.06,
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
                          await _addNewEmployee();
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
                      "Create Employee",
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
