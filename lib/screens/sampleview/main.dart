
import 'package:flutter/material.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/Screens/Post_api/Album/view/postApi_view.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/Screens/Api/User_list/view/users_list_view.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/contacts_listview.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/drawer.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/employee_view.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/grid_view.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/homePage.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/icon_grid_view.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/image_transition.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/login_view.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/home_view.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/mail_widget.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/orientation_check.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/search_listview.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/imagepicker_gallery_camera.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/Screens/Mvvm/Subscription/model/subscription_model.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/Screens/Mvvm/Subscription/viewprovider/subscription_viewmodel_provider.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/userhome_view.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/screens/sampleview/platform_check.dart';


void main() => runApp(MyApp());

 class MyApp extends StatelessWidget{
  @override
   Widget build(BuildContext buildContext) {
    return MaterialApp(
      home: Home(),
    );
  }}