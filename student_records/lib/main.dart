import 'package:flutter/material.dart';

class Student {
  final String name;
  final int age;
  final String rollNo;
  final String course;
  Student({
    required this.name,
    required this.age,
    required this.rollNo,
    required this.course,
  });
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext c) => MaterialApp(home: StudentHome());
}

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  bool useGrid = false;
  final List<Student> students = List.generate(
    20,
    (i) => Student(
      name: 'Student ${i + 1}',
      age: 16 + (i % 5),
      rollNo: 'R${100 + i}',
      course: 'Course ${(i % 3) + 1}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students (${students.length})'),
        actions: [
          IconButton(
            icon: Icon(useGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => useGrid = !useGrid),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: useGrid ? buildGrid() : buildList(),
      ),
    );
  }

  Widget buildList() {
    return ListView.separated(
      itemCount: students.length,
      itemBuilder: (ctx, i) {
        final s = students[i];
        return ListTile(
          leading: CircleAvatar(child: Text(s.name[0])),
          title: Text(s.name),
          subtitle: Text('${s.course} • Roll: ${s.rollNo}'),
          trailing: Text('${s.age}'),
          onTap: () {
            /* open detail/edit */
          },
        );
      },
      separatorBuilder: (_, __) => const Divider(color: Colors.amber),
    );
  }

  Widget buildGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250, // responsive tiles
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: students.length,
      itemBuilder: (ctx, i) {
        final s = students[i];
        return Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(child: Text(s.name[0])),
                const SizedBox(height: 8),
                Text(
                  s.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Roll: ${s.rollNo}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
