import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'contacts_listview.dart';
import 'drawer.dart';
import 'employee_view.dart';
import 'login_view.dart';
import 'mail_widget.dart';
import 'orientation_check.dart';
import 'platform_check.dart';
import 'imagepicker_gallery_camera.dart';

class IconGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: Router.generateRoute,
        home: Scaffold(appBar:  AppBar(
          title: Text(' Icon Grid Layout'),
          leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop(DrawerEx());
              }
          ),
        ),
            body: GridView.count(
                crossAxisCount: 3,
                children: List.generate(choices.length, (index) {
                  return Center(
                    child: IconGridView(choice: choices[index]),
                  );
                }
                )
            )
        )
    );
  }
}

class IconGridView extends StatelessWidget{
 Choice choice;
 IconGridView({Key key,this.choice}):super(key:key);

  @override
  Widget build(BuildContext context) {
            return Card(
              color: Colors.orange,
              child:InkWell(
                onTap: () {
                  Navigator.pushNamed(context, choice.nav);
                  },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget> [
                      Expanded(child: IconButton(icon:Icon(choice.icon, size:55.0, color: Colors.black45),padding: EdgeInsets.only(right: 30),
                      )),
                      Text(choice.title,style: TextStyle(color: Colors.black45,fontSize: 25), textAlign: TextAlign.center),
                    ],
                  ),
                ),
              )
            );
  }
}

class Choice {
  final String title;
  final IconData icon;
  final  String nav;
  Choice({this.title,this.icon,this.nav});
}

 List<Choice> choices=<Choice>[
  Choice(title: 'Home',icon: Icons.home,nav:homeRoute  ),
   Choice(title: 'Contacts', icon: Icons.contacts,nav: contactsRoute),
   Choice(title: 'Map',icon: Icons.map,nav: mapRoute),
   Choice(title: 'Phone', icon: Icons.phone,nav: phoneRoute),
   Choice(title: 'Camera',icon: Icons.camera_alt,nav: cameraRoute),
   Choice(title: 'Settings', icon: Icons.settings,nav: settingsRoute),
   Choice(title: 'Album',icon: Icons.photo_album,nav: albumRoute),
   Choice(title: 'WiFi', icon: Icons.wifi,nav: wifiRoute),
 ];

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Login());
      case contactsRoute:
        return MaterialPageRoute(builder: (_) => Contacts());
      case mapRoute:
        return MaterialPageRoute(builder: (_) => Mailer());
      case phoneRoute:
        return MaterialPageRoute(builder: (_) => EmployeeHome());
      case cameraRoute:
        return MaterialPageRoute(builder: (_) => ShowImage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => OrientationCheck());
      case albumRoute:
        return MaterialPageRoute(builder: (_) => ShowImage());
      case wifiRoute:
        return MaterialPageRoute(builder: (_) => PlatformCheck());
        default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}

//Dynamic Routes for generating navigation
const String homeRoute='/home';
const String contactsRoute ='/contacts';
const String mapRoute='/map';
const String phoneRoute ='/phone';
const String cameraRoute='/camera';
const String settingsRoute ='/settings';
const String albumRoute='/album';
const String wifiRoute ='/wifi';


