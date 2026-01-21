enum AttendanceStatus 
{
  present,
  absent,
  late
}

class Student 
{
  final String id;
  final String name;

  Student(this.id, this.name);
}

class AttendanceRecord 
{
  final Student student;
  final DateTime date;
  AttendanceStatus status;

  AttendanceRecord(this.student, this.date, this.status);
}

class AttendanceManager 
{
  final List<AttendanceRecord> _records = [];

  void markAttendance(
    Student student,
    AttendanceStatus status,
  C  DateTime date,
  ) 
  {
    _records.add(AttendanceRecord(student, date, status));
  }

  void printStudentAttendance(String studentId) 
  {
    for (var record in _records) 
    {
      if (record.student.id == studentId) 
      {
        print(
          "${record.student.name} | "
          "${record.date.toLocal().toString().split(' ')[0]} | "
          "${record.status.name}"
        );
      }
    }
  }
}

void main() 
{
  Student s1 = Student("S01", "Ama");
  Student s2 = Student("S02", "Kojo");

  AttendanceManager manager = AttendanceManager();

  manager.markAttendance(
    s1,
    AttendanceStatus.present,
    DateTime(2026, 1, 20),
  );

  manager.markAttendance(
    s2,
    AttendanceStatus.late,
    DateTime(2026, 1, 20),
  );

  manager.markAttendance(
    s1,
    AttendanceStatus.absent,
    DateTime(2026, 1, 21),
  );

  manager.printStudentAttendance("S01");
}
