import 'package:flutter/material.dart';
import 'package:job_recruitment_app/utilities/routes.dart';

class RecruiterLogin extends StatefulWidget {
  const RecruiterLogin({super.key});

  @override
  State<RecruiterLogin> createState() => _RecruiterLoginState();
}

class _RecruiterLoginState extends State<RecruiterLogin> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome Sir, ",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: const Icon(
                  Icons.password_outlined,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                onPressed: () {
                  //implement firebase auth service
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    adminHome,
                    (route) => false,
                  );
                },
                color: Colors.black,
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
