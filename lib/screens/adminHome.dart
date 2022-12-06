import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_recruitment_app/utilities/routes.dart';

class RecruiterAdmin extends StatefulWidget {
  const RecruiterAdmin({super.key});

  @override
  State<RecruiterAdmin> createState() => _RecruiterAdminState();
}

class _RecruiterAdminState extends State<RecruiterAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HR Dashboard",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          PopupMenuButton<MenuButtons>(
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  value: MenuButtons.addJob,
                  child: Text("Add Job"),
                ),
                PopupMenuItem(
                  value: MenuButtons.addEmployee,
                  child: Text("Add Employee"),
                ),
                PopupMenuItem(
                  value: MenuButtons.logout,
                  child: Text("Logout"),
                ),
                PopupMenuItem(
                  value: MenuButtons.profile,
                  child: Text("Profile"),
                ),
              ];
            },
            onSelected: (value) async {
              switch (value) {
                case MenuButtons.addJob:
                  Navigator.of(context).pushNamed(newJob);
                  break;

                case MenuButtons.addEmployee:
                  Navigator.of(context).pushNamed(newEmployee);
                  break;

                case MenuButtons.profile:
                  break;

                case MenuButtons.logout:
                  bool reply = await showLogOutDialog(context);
                  if (reply) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      jobsHomeRoute,
                      (route) => false,
                    );
                  }
                  break;
              }
            },
          )
        ],
      ),
    );
  }
}

enum MenuButtons {
  addJob,
  addEmployee,
  logout,
  profile,
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Log Out'),
          )
        ],
      );
    },
  ).then((value) => value ?? false);
}
