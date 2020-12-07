class EmployeeList {
  final int id;
  final String name;
  final int salary;
  final int age;

  EmployeeList({this.id,this.name,this.salary,this.age});

  factory EmployeeList.fromJson(Map<String, dynamic> json) {
    return EmployeeList(
      id: json['id'],
      name: json['name'],
      salary: json['salary'],
      age: json['age']

    );
  }
}