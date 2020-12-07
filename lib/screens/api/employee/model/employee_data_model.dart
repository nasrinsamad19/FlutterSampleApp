class EmpData {
  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  EmpData({this.employeeName, this.employeeSalary, this.employeeAge, this.profileImage, this.id,});

  factory EmpData.fromJson(Map<String, dynamic> json) => EmpData(
    id: json['id'],
    employeeName: json["employee_name"],
    employeeSalary: json["employee_salary"],
    employeeAge: json["employee_age"] ,
    profileImage: json["profile_image"],
  );
}

