import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/DBhelperEmployee.dart';
import 'package:sample/EmployeesTable.dart';

class EmployeeHome extends StatefulWidget{
  final String title;
  EmployeeHome({Key key ,this.title}): super(key:key);
  @override
  State<StatefulWidget> createState(){
    return _State();
  }

}
class _State extends State<EmployeeHome>{

  Future<List<Employee>> employees;

  TextEditingController fnameController= TextEditingController();
  TextEditingController lnameController= TextEditingController();
  TextEditingController deptController= TextEditingController();
  String fname;
  String lname;
  String dept;
  int id;

  final formKey= new GlobalKey<FormState>();
  var dBHelper;
  bool isUpdating;

  @override
  void initState() {
    super.initState();
    dBHelper=DBhelperEmployee();
    isUpdating=false;
    refreshList();
  }
  refreshList(){
    setState(() {
      employees= dBHelper.getEmployee();
    });
  }
  clearField(){
    fnameController.text="";
    lnameController.text="";
    deptController.text="";

  }
  validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      if (isUpdating) {
        Employee e = Employee(id,fname,lname,dept);
        dBHelper.update(e);
        setState(() {
          isUpdating = false;
        });
      } else {
        Employee e = Employee(null, fname,lname,dept);
        dBHelper.save(e);
      }
      clearField();
      refreshList();
    }
  }
  form(){
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection:VerticalDirection.down,
          children:<Widget> [
            TextFormField(
              controller: fnameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'First Name'),
              validator: (val) => val.length == 0 ? 'Enter First Name' : null,
              onSaved: (val) => fname = val,
            ),
            TextFormField(
              controller: lnameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Last Name'),
              validator: (val) => val.length == 0 ? 'Enter Last Name' : null,
              onSaved: (val) => lname = val,
            ),
            TextFormField(
              controller: deptController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Department Name'),
              validator: (val) => val.length == 0 ?'Enter Department Name':null,
              onSaved: (val)=>dept= val,
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  onPressed: validate,
                  child: Text(isUpdating? 'Update':'Add'),
                ),
                FlatButton(
                  onPressed: (){
                    setState(() {
                      isUpdating=false;
                    });
                    clearField();
                  },
                  child: Text('Cancel'),
                ),
              ],
            )
          ],
        ),
      ),

    );
}
  SingleChildScrollView dataTable(List<Employee> employees) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('NAME'),
          ),
          DataColumn(
            label: Text('DEPARTMENT'),
          ),
          DataColumn(
            label: Text('DELETE'),
          )
        ],
       rows: employees.map((employee) => DataRow(cells: [
         DataCell(
           Text(employee.fname+" "+employee.lname),
           onTap: () {
             setState(() {
               isUpdating = true;
               id = employee.id;
             });
             fnameController.text = employee.fname;
             lnameController.text=employee.lname;
             deptController.text=employee.dept;
           },
         ),
         DataCell(
           Text(employee.dept),
         ),
         DataCell(IconButton(
           icon: Icon(Icons.delete),
           onPressed: () {
             dBHelper.delete(employee.id);
             refreshList();
           },
         )),
       ]),
       )
         .toList(),
     ),

    );
}
  list() {
    return Expanded(
      child: FutureBuilder(
        future: employees,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(snapshot.data);
          }

          if (null == snapshot.data || snapshot.data.length == 0) {
            return Text("No Data Found");
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Employees Data'),
     ),
     body: Container(
       child: Column(
         children:<Widget> [
           form(),
           list(),

         ],
       ),
     ),

   );
  }






}