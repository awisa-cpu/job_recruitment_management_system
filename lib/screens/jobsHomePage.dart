import 'package:flutter/material.dart';
import 'package:job_recruitment_app/utilities/routes.dart';

class JobsHomePage extends StatefulWidget {
  const JobsHomePage({super.key});

  @override
  State<JobsHomePage> createState() => _JobsHomePageState();
}

class _JobsHomePageState extends State<JobsHomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    List<String> jobList = [
      "Developer",
      "Analyst",
      "Tester",
      "UI/UX Designer",
      "Com_Engineer",
      "SoftwareArchitect",
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Container()),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.assignment_ind_outlined,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Container()),
                const Text(
                  "Admin",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.07,
            ),
            const Text(
              "Find Your",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Dream Job",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * 0.2,
            ),
            const Text(
              "Popular Profession",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jobList.length,
                itemBuilder: (context, index) {
                  return OpenJobs(
                    job: jobList[index],
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 50,
                    width: 320,
                    color: Colors.black,
                    child: const Center(
                      child: Text(
                        "Search by skills",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}

class OpenJobs extends StatelessWidget {
  final String job;
  const OpenJobs({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(jobFormRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            height: 110,
            width: 180,
            color: Colors.white,
            child: Center(
                child: Text(
              job,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            )),
          ),
        ),
      ),
    );
  }
}
