class Data {
  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;
  Data({this.employeeName,this.employeeSalary,this.employeeAge,this.profileImage,this.id,});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'],
    employeeName: json["employee_name"],
    employeeSalary: json["employee_salary"],
    employeeAge: json["employee_age"] ,
    profileImage: json["profile_image"],
  );
}

