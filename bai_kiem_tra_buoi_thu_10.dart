import 'dart:io';

class Person {
  String id;
  String name;
  int age;
  String gender;

  Person(this.id, this.name, this.age, this.gender);
}

class Student extends Person {
  String grade;
  Map<String, double> subjectScores = {};

  Student(String id, String name, int age, String gender, this.grade)
      : super(id, name, age, gender);

  void updateScore(String subject, double score) {
    subjectScores[subject] = score;
  }

  double get averageScore {
    if (subjectScores.isEmpty) return 0.0;
    return subjectScores.values.reduce((a, b) => a + b) / subjectScores.length;
  }

  void displayInfo() {
    print('\nStudent: $name ($id), Grade: $grade');
    if (subjectScores.isEmpty) {
      print('  No subjects.');
    } else {
      subjectScores.forEach((subject, score) {
        print('  $subject: $score');
      });
      print('  Average Score: ${averageScore.toStringAsFixed(2)}');
    }
  }
}

class Teacher extends Person {
  String subject;
  double salary;

  Teacher(String id, String name, int age, String gender, this.subject, this.salary)
      : super(id, name, age, gender);

  void displayInfo() {
    print('\nTeacher: $name ($id), Subject: $subject, Salary: $salary');
  }
}

class Classroom {
  String id;
  String name;
  Teacher? teacher;
  List<Student> students = [];

  Classroom(this.id, this.name);

  void assignTeacher(Teacher t) => teacher = t;
  void addStudent(Student s) => students.add(s);

  void displayInfo() {
    print('\nClass: $name (ID: $id)');
    print('Teacher: ${teacher?.name ?? "None"}');
    if (students.isEmpty) {
      print('No students in class.');
    } else {
      for (var s in students) {
        print('- ${s.name} (${s.id}) - Avg: ${s.averageScore.toStringAsFixed(2)}');
      }
    }
  }
}

class SchoolManager {
  List<Student> students = [];
  List<Teacher> teachers = [];
  List<Classroom> classrooms = [];

  void addStudent() {
    stdout.write('Student ID: ');
    String id = stdin.readLineSync()!;
    stdout.write('Name: ');
    String name = stdin.readLineSync()!;
    stdout.write('Age: ');
    int age = int.parse(stdin.readLineSync()!);
    stdout.write('Gender: ');
    String gender = stdin.readLineSync()!;
    stdout.write('Grade: ');
    String grade = stdin.readLineSync()!;
    var student = Student(id, name, age, gender, grade);

    stdout.write('How many subjects? ');
    int n = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < n; i++) {
      stdout.write('Subject name: ');
      String subject = stdin.readLineSync()!;
      stdout.write('Score: ');
      double score = double.parse(stdin.readLineSync()!);
      student.updateScore(subject, score);
    }

    students.add(student);
    print('✅ Student added.');
  }

  void addTeacher() {
    stdout.write('Teacher ID: ');
    String id = stdin.readLineSync()!;
    stdout.write('Name: ');
    String name = stdin.readLineSync()!;
    stdout.write('Age: ');
    int age = int.parse(stdin.readLineSync()!);
    stdout.write('Gender: ');
    String gender = stdin.readLineSync()!;
    stdout.write('Subject: ');
    String subject = stdin.readLineSync()!;
    stdout.write('Salary: ');
    double salary = double.parse(stdin.readLineSync()!);
    teachers.add(Teacher(id, name, age, gender, subject, salary));
    print('✅ Teacher added.');
  }

  void addClassroom() {
    stdout.write('Classroom ID: ');
    String id = stdin.readLineSync()!;
    stdout.write('Class name: ');
    String name = stdin.readLineSync()!;
    classrooms.add(Classroom(id, name));
    print('✅ Classroom added.');
  }

  void assignStudentToClass() {
    stdout.write('Student ID: ');
    String sid = stdin.readLineSync()!;
    stdout.write('Classroom ID: ');
    String cid = stdin.readLineSync()!;
    try {
      var s = students.firstWhere((e) => e.id == sid);
      var c = classrooms.firstWhere((e) => e.id == cid);
      c.addStudent(s);
      print('✅ Student assigned to class.');
    } catch (e) {
      print('❌ Not found.');
    }
  }

  void assignTeacherToClass() {
    stdout.write('Teacher ID: ');
    String tid = stdin.readLineSync()!;
    stdout.write('Classroom ID: ');
    String cid = stdin.readLineSync()!;
    try {
      var t = teachers.firstWhere((e) => e.id == tid);
      var c = classrooms.firstWhere((e) => e.id == cid);
      c.assignTeacher(t);
      print('✅ Teacher assigned to class.');
    } catch (e) {
      print('❌ Not found.');
    }
  }

  void showAllStudents() {
    if (students.isEmpty) print('No students.');
    for (var s in students) s.displayInfo();
  }

  void showAllTeachers() {
    if (teachers.isEmpty) print('No teachers.');
    for (var t in teachers) t.displayInfo();
  }

  void showAllClassrooms() {
    if (classrooms.isEmpty) print('No classrooms.');
    for (var c in classrooms) c.displayInfo();
  }

  void showClassReport() {
    Map<String, List<Student>> grouped = {};
    for (var s in students) {
      grouped.putIfAbsent(s.grade, () => []).add(s);
    }
    grouped.forEach((grade, group) {
      print('\nClass $grade Report:');
      double total = 0;
      for (var s in group) {
        double avg = s.averageScore;
        total += avg;
        print('- ${s.name}: Avg = ${avg.toStringAsFixed(2)}');
      }
      print('>> Class $grade average: ${(total / group.length).toStringAsFixed(2)}');
    });
  }
}

void main() {
  var students = [
    Student('S1', 'Alice', 16, 'Female', '10A')
      ..updateScore('Math', 8.5)
      ..updateScore('English', 7.5),
    Student('S2', 'Bob', 15, 'Male', '10A')
      ..updateScore('Math', 6.0)
      ..updateScore('English', 8.0),
    Student('S3', 'Charlie', 17, 'Male', '11B')
      ..updateScore('Math', 9.0)
      ..updateScore('English', 8.5)
  ];

  var teachers = [
    Teacher('T1', 'Ms. Smith', 30, 'Female', 'Math', 5000),
    Teacher('T2', 'Mr. Brown', 45, 'Male', 'English', 5200)
  ];

  var classroomA = Classroom('C1', '10A');
  classroomA.assignTeacher(teachers[0]);
  classroomA.addStudent(students[0]);
  classroomA.addStudent(students[1]);

  var classroomB = Classroom('C2', '11B');
  classroomB.assignTeacher(teachers[1]);
  classroomB.addStudent(students[2]);

  // Display all
  for (var teacher in teachers) {
    teacher.displayInfo();
  }

  for (var student in students) {
    student.displayInfo();
  }

  classroomA.displayInfo();
  classroomB.displayInfo();

  // Class report
  var classGroups = <String, List<Student>>{};
  for (var student in students) {
    classGroups.putIfAbsent(student.grade, () => []).add(student);
  }
  classGroups.forEach((grade, group) {
    print('\nReport for class $grade:');
    double total = 0;
    for (var s in group) {
      double avg = s.averageScore;
      total += avg;
      print('- ${s.name}: Avg = ${avg.toStringAsFixed(2)}');
    }
    print('>> Class $grade average: ${(total / group.length).toStringAsFixed(2)}');
  });

  final manager = SchoolManager();
  while (true) {
    print('\n=== SCHOOL MENU ===');
    print('1. Add student');
    print('2. Add teacher');
    print('3. Add classroom');
    print('4. Assign student to class');
    print('5. Assign teacher to class');
    print('6. Show all students');
    print('7. Show all teachers');
    print('8. Show all classrooms');
    print('9. Show class report');
    print('0. Exit');
    stdout.write('Select: ');
    final input = stdin.readLineSync();
    switch (input) {
      case '1': manager.addStudent(); break;
      case '2': manager.addTeacher(); break;
      case '3': manager.addClassroom(); break;
      case '4': manager.assignStudentToClass(); break;
      case '5': manager.assignTeacherToClass(); break;
      case '6': manager.showAllStudents(); break;
      case '7': manager.showAllTeachers(); break;
      case '8': manager.showAllClassrooms(); break;
      case '9': manager.showClassReport(); break;
      case '0': print('Exiting...'); return;
      default: print('Invalid choice.');
    }
  }
}