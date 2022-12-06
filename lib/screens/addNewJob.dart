import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' show log;
import 'package:intl/intl.dart';
import 'package:job_recruitment_app/Auth/employeeModel.dart';
import 'package:job_recruitment_app/Auth/jobModel.dart';
import 'package:job_recruitment_app/utilities/routes.dart';

import '../api_connection/api_connection.dart';

class JobAdd extends StatefulWidget {
  const JobAdd({super.key});

  @override
  State<JobAdd> createState() => _JobAddState();
}

class _JobAddState extends State<JobAdd> {
  final _formKey = GlobalKey<FormState>();

  final _jobid = TextEditingController();
  final _jobclassification = TextEditingController();
  final _jobDescription = TextEditingController();
  final _jobName = TextEditingController();
  final _appliedDepartment = TextEditingController();
  final _salary = TextEditingController();
  final _jobStatus = TextEditingController();
  final _location = TextEditingController();

  _addNewJob() async {
    JobModel userModel = JobModel(
      _jobid.text.trim(),
      _jobclassification.text.trim(),
      _jobDescription.text.trim(),
      _jobName.text.trim(),
      _appliedDepartment.text,
      _salary.text.trim(),
      _jobStatus.text.trim(),
      _location.text.trim(),
    );

    try {
      var response = await http.post(
        Uri.parse(
            //using the api to communicate with the database
            API.postJobs),
        body: userModel.toJson(),
      );

      if (response.statusCode == 200) {
        //from the flutter app the connection with the api is ->succesful
        print(response.body);
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
                            "ADD NEW JOB",
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
                  controller: _jobid,
                  decoration: InputDecoration(
                    labelText: "Job Id",
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
                        !RegExp(r'^[0-9]+$').hasMatch(value)) {
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
                  controller: _location,
                  decoration: InputDecoration(
                    labelText: "Job Classification",
                    prefixIcon: const Icon(
                      Icons.text_rotation_none_rounded,
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
                      return "Enter Job Classification";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                  controller: _jobclassification,
                  decoration: InputDecoration(
                    labelText: "Job Description",
                    prefixIcon: const Icon(
                      Icons.text_rotation_none_outlined,
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
                      return "Enter Job Description";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                  controller: _jobDescription,
                  decoration: InputDecoration(
                    labelText: "Job Name",
                    prefixIcon: const Icon(
                      Icons.text_rotation_none_outlined,
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
                      return "Enter Job Name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                  controller: _jobName,
                  decoration: InputDecoration(
                    labelText: "Applied Department",
                    prefixIcon: const Icon(
                      Icons.text_rotation_none_outlined,
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
                      return "Enter Applied Department";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                  controller: _appliedDepartment,
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
                        !RegExp(r'^[0-9]+$').hasMatch(value)) {
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
                  controller: _salary,
                  decoration: InputDecoration(
                    labelText: "Job Status",
                    prefixIcon: const Icon(
                      Icons.text_rotation_none_outlined,
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
                      return "Enter Job Status";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextFormField(
                  controller: _jobStatus,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.text_rotation_none_outlined,
                      color: Colors.black,
                    ),
                    labelText: "Location",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter Job Location";
                    } else {
                      return null;
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
                          await _addNewJob();
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
                      "Add Job",
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
