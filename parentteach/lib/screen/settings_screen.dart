import 'package:flutter/material.dart';
import 'package:parentteach/screen/home_screen.dart';
import 'package:parentteach/screen/profile_screen.dart';

import '../model/articles.dart';
import '../model/subject.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/drawer_menu.dart';

class SettingsScreen extends StatefulWidget {
  final List<Subject> subjects;
  final List<Articles> articles;

  SettingsScreen({Key? key, required this.subjects, required this.articles}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /*A GlobalKey<ScaffoldState> is used to control the Scaffold. 
  This key allows you to access and manipulate the state of the Scaffold, including opening and closing the drawer.*/
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    //this is used to manage the navigation on the bottom navbar
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(subjects: widget.subjects, articles: widget.articles,))
        );
      }
      else if(index == 0){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen())
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 254, 230, 119),
      endDrawer: DrawerMenu(subjects: widget.subjects, articles: widget.articles,),//The drawer menu will appear on the right side
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

          ],
        ),
        backgroundColor: const Color.fromARGB(255, 254, 230, 119),
        elevation: 0,
      ),

      //bottom navbar
      bottomNavigationBar: BottomNavbar(currentIndex: _selectedIndex, onTap: _onItemTapped,)      
     
    );
  }
}