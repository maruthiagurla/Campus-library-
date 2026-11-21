
import 'package:flutter/material.dart';

void main() {
  runApp(const CampusLibraryApp());
}

const branches = [
  'CSM A', 'CSM B', 'CSM C',
  'CSE A', 'CSE B', 'CSE C',
  'CSD', 'ECE', 'MEC', 'CIVIL'
];

class CampusLibraryApp extends StatelessWidget {
  const CampusLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Library',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F8FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8FA),
        title: const Text(
          'Campus Library',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: -0.7,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: Icon(Icons.account_circle_outlined, size: 28),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'YOUR DIGITAL LIBRARY',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Learn without limits.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'All your B.Tech notes in one place.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 22),
                  Icon(
                    Icons.auto_stories_rounded,
                    color: Colors.white,
                    size: 48,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Explore your academics',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Select your engineering branch',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 18),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: branches.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 13,
                mainAxisSpacing: 13,
                childAspectRatio: 1.65,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            YearScreen(branch: branches[index]),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.menu_book_outlined, size: 23),
                        const SizedBox(height: 9),
                        Text(
                          branches[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                'CAMPUS LIBRARY  •  LEARN. GROW. ACHIEVE.',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black45,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YearScreen extends StatelessWidget {
  final String branch;

  const YearScreen({super.key, required this.branch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(branch)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Select your year',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ...List.generate(4, (index) {
            int year = index + 1;
            return Card(
              color: Colors.white,
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: const Icon(Icons.school_outlined, size: 30),
                title: Text('Year $year'),
                subtitle: Text('B.Tech Year $year'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SemesterScreen(
                        branch: branch,
                        year: year,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

class SemesterScreen extends StatelessWidget {
  final String branch;
  final int year;

  const SemesterScreen({
    super.key,
    required this.branch,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$branch • Year $year')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Choose semester',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ...List.generate(2, (index) {
            final semester = (year - 1) * 2 + index + 1;
            return Card(
              color: Colors.white,
              child: ListTile(
                leading: const Icon(Icons.library_books_outlined),
                title: Text('Semester $semester'),
                subtitle: const Text('View subjects and notes'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SubjectScreen(
                        branch: branch,
                        semester: semester,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

class SubjectScreen extends StatelessWidget {
  final String branch;
  final int semester;

  const SubjectScreen({
    super.key,
    required this.branch,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Semester $semester')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.menu_book, size: 55),
              const SizedBox(height: 18),
              const Text(
                'Subject Library',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text('$branch • Semester $semester'),
              const SizedBox(height: 12),
              const Text(
                'Your notes will appear here once the admin uploads them.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
