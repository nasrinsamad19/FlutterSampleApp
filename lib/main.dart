
import 'package:flutter/material.dart';
import 'package:sample/API/album_view.dart';
import 'package:sample/API/followers_list_view.dart';
import 'package:sample/API/users_list_view.dart';
import 'package:sample/contacts_listview.dart';
import 'package:sample/drawer.dart';
import 'package:sample/employee_view.dart';
import 'package:sample/grid_view.dart';
import 'package:sample/icon_grid_view.dart';
import 'package:sample/image_transition.dart';
import 'package:sample/login_view.dart';
import 'package:sample/home_view.dart';
import 'package:sample/mail_widget.dart';
import 'package:sample/orientation_check.dart';
import 'package:sample/search_listview.dart';
import 'package:sample/imagepicker_gallery_camera.dart';
import 'package:sample/mvvm/subscription_model.dart';
import 'package:sample/mvvm/subscription_viewmodel_provider.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/mvvm/viewmodel_home.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/mvvm/viewmodel_page_home.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/mvvm/viewmodel_provider.dart';
import 'package:sample/userhome_view.dart';
import 'package:sample/platform_check.dart';


void main() => runApp(MyApp());

 class MyApp extends StatelessWidget{
  @override
   Widget build(BuildContext buildContext) {
    return MaterialApp(
      home: Apisample_3()
    );
  }}