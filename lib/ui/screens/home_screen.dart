import 'package:flutter/material.dart';
import 'package:csoc_flutter/models/subjects.dart';
import 'package:csoc_flutter/models/user_model.dart';
import 'package:csoc_flutter/cubit/auth_cubit.dart';
import 'package:csoc_flutter/ui/widgets/app_bar.dart';
import 'package:csoc_flutter/utils/colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:csoc_flutter/ui/screens/grades.dart';  // Import the grades screen

class HomeScreen extends StatefulWidget {
  final UserModel user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Subject>> subjects;

  @override
  void initState() {
    super.initState();
    subjects = fetchSubjects();
  }

  Future<List<Subject>> fetchSubjects() async {
    final String response =
    await rootBundle.loadString('assets/attendance_data.json');
    final data = await json.decode(response);
    return (data['subjects'] as List)
        .map((subject) => Subject.fromJson(subject))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: const CustomAppBar(
        title: "CSOC Flutter",
        backgroundColor: AppColors.primaryColor,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.user.name!),
            ElevatedButton(
              onPressed: authCubit.signOut,
              child: const Text("Sign-out"),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Attendance',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.circle, color: Colors.green),
                          Text('Present'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.circle, color: Colors.red),
                          Text('Absent'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.circle, color: Colors.yellow),
                          Text('Cancelled'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.circle, color: Colors.blue),
                          Text('Proxied'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 400, // Constrains the ListView's height
                    child: FutureBuilder<List<Subject>>(
                      future: subjects,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          final subjects = snapshot.data!;
                          return Material(
                            child: ListView.builder(
                              padding: const EdgeInsets.all(8.0),
                              itemCount: subjects.length,
                              itemBuilder: (context, index) {
                                final subject = subjects[index];
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.cyanAccent,
                                    borderRadius:
                                    BorderRadius.circular(15.0),
                                  ),
                                  child: ListTile(
                                    title: Center(
                                        child: Text(subject.subjectName)),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "Real Attendance: ${subject.realAttendance}"),
                                          Text(
                                              "Proxied Attendance: ${subject.attendanceWithProxies}"),
                                          Text(
                                              "Target Attendance: ${subject.targetAttendance}"),
                                          const Text(
                                              "Attend/Can Bunk ------- Classes"),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.circle,
                                                    color: Colors.green),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.circle,
                                                    color: Colors.red),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.circle,
                                                    color: Colors.blue),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.circle,
                                                    color: Colors.yellow),
                                              ), //TODO: Add logic in these buttons
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(15),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Add logic to add extra class
                    },
                    child: const Text('Add Extra Class'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GradeScreen(userId: widget.user.id ?? ''), // Pass the userId here
                        ),
                      );
                    },
                    child: const Text('View Grades'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Back'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
