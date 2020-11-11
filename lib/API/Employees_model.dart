
class Data {
  Data({
    this.employeeName,
    this.employeeSalary,
    this.employeeAge,
    this.profileImage,
  });


  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    employeeName: json["employee_name"],
    employeeSalary: json["employee_salary"],
    employeeAge: json["employee_age"] ,
    profileImage: json["profile_image"],
  );
}

