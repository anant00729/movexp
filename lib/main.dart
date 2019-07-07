import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movexp/profile.dart';
import 'package:movexp/youtube.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default Brightness and Colors
        //brightness: Brightness.dark,
        primaryColor: const Color(0xff121416),
        accentColor: const Color(0xFF242830),
      ),
      title: 'MovExp',
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}


class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {


  int _selectedIndex = 0;
  var _widgetOptions;


  @override
  void initState() {
    Home _h = Home();
    YoutubePage _y = YoutubePage();
    Profile _p = Profile();

    _widgetOptions = [_h, _y , _p];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: WillPopScope(
        onWillPop: () => _onBackPressed(),
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  top: true,
                  bottom: true,
                  child: Center(
                    child: _widgetOptions.elementAt(_selectedIndex),
                  ),
                ),
                bottomNavigationBar: SafeArea(
                  child:
                  BottomNavigationBar(
                    backgroundColor: const Color(0xff121416),
                    type: BottomNavigationBarType.fixed,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home /*, color: Colors.grey,*/,
                            size: 24,
                          ),
                          title: Container(
                            height: 0.0,
                          )),
                      BottomNavigationBarItem(
                          icon: Icon(
                              FontAwesomeIcons.film /*, color: Colors.grey,*/,
                              size: 24),
                          title: Container(
                            height: 0.0,
                          )),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.search /*, color: Colors.grey,*/,
                              size: 24),
                          title: Container(
                            height: 0.0,
                          )),
                    ],
                    currentIndex: _selectedIndex,
//                  fixedColor: const Color(0xFF1c98ff),
                    unselectedItemColor: const Color(0xFF8c9bad),
                    selectedItemColor: const Color(0xFF1c98ff),
                    onTap: _onItemTapped,
                  ),
                ),
              ),
//                (is_visible ? WalkThroughPage(
//                  onSkip: () {
//                    setState(() {
//                      is_visible = false;
//                    });
//                  },
//                ) : Container())
            ],
          ),
        ),
      ),
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  _onBackPressed() {
    if (_selectedIndex == 0) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return true;
    } else {
      _onItemTapped(0);
      return false;
    }
  }
}








