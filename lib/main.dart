
import 'package:flutter/material.dart';
import 'package:sample/Contacts.dart';
import 'package:sample/EmployeeHome.dart';
import 'package:sample/Images.dart';
import 'package:sample/Login.dart';
import 'package:sample/Home.dart';
import 'package:sample/OrientationCheck.dart';
import 'package:sample/SearchList.dart';
import 'package:sample/ShowImage.dart';
import 'package:sample/DBTestPage .dart';
import 'package:sample/studentsTable.dart';
import 'package:sample/UserHome.dart';
import 'package:sample/DBHelper.dart';
import 'package:sample/PlatformCheck.dart';


void main() => runApp(MyApp());

 class MyApp extends StatelessWidget{
  @override
   Widget build(BuildContext buildContext)
  {
    return MaterialApp(
      home:OrientationCheck()
    );
  }}