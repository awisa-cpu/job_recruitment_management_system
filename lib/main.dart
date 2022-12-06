import 'package:flutter/material.dart';
import 'package:job_recruitment_app/screens/addNewEmployee.dart';
import 'package:job_recruitment_app/screens/addNewJob.dart';
import 'package:job_recruitment_app/screens/adminHome.dart';
import 'package:job_recruitment_app/screens/adminLogin.dart';
import 'package:job_recruitment_app/screens/jobsHomePage.dart';
import 'package:job_recruitment_app/screens/jobform.dart';
import 'package:job_recruitment_app/utilities/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        jobsHomeRoute: (context) => const JobsHomePage(),
        jobFormRoute: (context) => const JobForm(),
        adminLogin: (context) => const RecruiterLogin(),
        adminHome: (context) => const RecruiterAdmin(),
        newJob: (context) => const JobAdd(),
        newEmployee: (context) => const EmployeeAdd(),
      },
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const JobsHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
